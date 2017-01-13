package com.tab.content.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tab.common.pojo.Ad1Node;
import com.tab.common.pojo.EasyUIDataGridResult;
import com.tab.common.pojo.TabResult;
import com.tab.common.utils.JsonUtils;
import com.tab.content.service.ContentService;
import com.tab.content.service.jedisclient.JedisClient;
import com.tab.mapper.TbContentMapper;
import com.tab.pojo.TbContent;
import com.tab.pojo.TbContentExample;
import com.tab.pojo.TbContentExample.Criteria;

@Service
public class ContentServiceImpl implements ContentService {
	@Reference
	@Autowired(required = false)
	private TbContentMapper contentMapper;
	@Autowired
	private JedisClient jedisClient;
	
	@Value("${REDIS_CONTENT_HASH_KEY}")
	private String REDIS_CONTENT_HASH_KEY;
	/**
	 * 查询分类内容
	 */
	@Override
	public EasyUIDataGridResult getContentList(Long categoryId, int page, int rows) {
		// 根据categoryId查询列表
		TbContentExample example = new TbContentExample();
		Criteria criteria = example.createCriteria();
		criteria.andCategoryIdEqualTo(categoryId);
		// 分页处理
		PageHelper.startPage(page, rows);
		// 执行查询
		List<TbContent> list = contentMapper.selectByExample(example);
		// 取分页信息
		PageInfo<TbContent> pageInfo = new PageInfo<>(list);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setTotal(pageInfo.getTotal());
		result.setRows(list);
		// 返回结果
		return result;
	}

	/**
	 * 添加分类内容
	 */
	@Override
	public TabResult addContent(TbContent content) {
		// 补全属性
		content.setCreated(new Date());
		content.setUpdated(new Date());
		// 插入数据库
		contentMapper.insert(content);
		//内容添加成功需要缓存同步
		jedisClient.hdel(REDIS_CONTENT_HASH_KEY, content.getCategoryId().toString());
		// 返回结果
		return TabResult.ok();
	}

	/**
	 * 编辑分类内容
	 */
	@Override
	public TabResult updateContent(TbContent content) {
		// 补全属性
		content.setUpdated(new Date());
		// 更新数据
		contentMapper.updateByPrimaryKeySelective(content);
		//内容添加成功需要缓存同步
		jedisClient.hdel(REDIS_CONTENT_HASH_KEY, content.getCategoryId().toString());
		return TabResult.ok();
	}

	/**
	 * 删除分类内容
	 */
	@Override
	public TabResult deleteContent(long[] ids) {
		for (long id : ids) {
			contentMapper.deleteByPrimaryKey(id);
		}
		return TabResult.ok();
	}

	/**
	 * 根据分类id查询分类内容
	 */
	@Override
	public List<Ad1Node> getContentList(long categoryId) {
		try {
			//添加查询缓存的业务逻辑
			String json = jedisClient.hget(REDIS_CONTENT_HASH_KEY, categoryId+"");
			//判断返回结果是否为空
			if (StringUtils.isNotBlank(json)) {
				//把json转换成list对象
				List<Ad1Node> list = JsonUtils.jsonToList(json, Ad1Node.class);
				return list;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		// 查询内容列表
		TbContentExample example = new TbContentExample();
		// 设置查询条件
		Criteria criteria = example.createCriteria();
		criteria.andCategoryIdEqualTo(categoryId);
		// 执行查询
		List<TbContent> list = contentMapper.selectByExample(example);
		// 转换成Ad1Node列表
		List<Ad1Node> resultList = new ArrayList<>();
		for (TbContent tbContent : list) {
			Ad1Node node = new Ad1Node();
			node.setAlt(tbContent.getSubTitle());
			node.setSrc(tbContent.getPic());
			node.setSrcB(tbContent.getPic2());
			node.setHref(tbContent.getUrl());
			node.setContent(tbContent.getContent());
			resultList.add(node);
		}
		//返回结果之前,把数据添加到缓存
		try {
			//使用JedisClient对象添加缓存
			jedisClient.hset(REDIS_CONTENT_HASH_KEY, categoryId+"", JsonUtils.objectToJson(resultList));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return resultList;
	}

}
