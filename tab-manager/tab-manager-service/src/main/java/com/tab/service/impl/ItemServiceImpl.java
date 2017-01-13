package com.tab.service.impl;

import java.util.Date;
import java.util.List;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.command.ActiveMQTopic;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tab.common.pojo.EasyUIDataGridResult;
import com.tab.common.pojo.TabResult;
import com.tab.common.utils.IDUtils;
import com.tab.common.utils.JsonUtils;
import com.tab.mapper.TbItemDescMapper;
import com.tab.mapper.TbItemMapper;
import com.tab.pojo.TbItem;
import com.tab.pojo.TbItemDesc;
import com.tab.pojo.TbItemDescExample;
import com.tab.pojo.TbItemExample;
import com.tab.service.ItemService;
import com.tab.service.jedisclient.JedisClient;

@Service
public class ItemServiceImpl implements ItemService {
	@Reference
	@Autowired(required = false)
	private TbItemMapper itemMapper;
	@Reference
	@Autowired(required = false)
	private TbItemDescMapper itemDescMapper;
	@Autowired
	private JmsTemplate jmsTemplate;
	//发送消息的目的地
	@Autowired
	private ActiveMQTopic activeMQTopic;

	@Autowired
	private JedisClient jedisClient;
	
	@Value("${REDIS_ITEM_KEY}")
	private String REDIS_ITEM_KEY;
	@Value("${REDIS_ITEM_EXPIRE}")
	private Integer REDIS_ITEM_EXPIRE;
	@Override
	public TbItem getItemById(Long itemId) {
		//查询商品之前先查询缓存
		try { 	
			String json = jedisClient.get(REDIS_ITEM_KEY + ":" + itemId + ":BASE");
			if (StringUtils.isNotBlank(json)) {
				//把json数据转换成java对象
				TbItem item = JsonUtils.jsonToPojo(json, TbItem.class);
				return item;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 根据商品id查询商品数据
		TbItem tbItem = itemMapper.selectByPrimaryKey(itemId);
		//把数据缓存起来
		try {
			jedisClient.set(REDIS_ITEM_KEY + ":" + itemId + ":BASE", JsonUtils.objectToJson(tbItem));
		//设置过期时间
			jedisClient.expire(REDIS_ITEM_KEY + ":" + itemId + ":BASE", REDIS_ITEM_EXPIRE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tbItem;
	}

	/**
	 * 查询商品列表
	 
	 */
	@Override
	public EasyUIDataGridResult getItemList(int page, int rows) {
		// 分页处理
		PageHelper.startPage(page, rows);
		// 执行查询
		TbItemExample example = new TbItemExample();
		List<TbItem> list = itemMapper.selectByExample(example);
		// 取分页信息
		PageInfo<TbItem> pageInfo = new PageInfo<>(list);
		// 创建EasyUIDataGridResult
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setTotal(pageInfo.getTotal());
		result.setRows(list);
		return result;
	}

	/**
	 * 添加商品
	 */
	@Override
	public TabResult addItem(TbItem item, TbItemDesc desc) {
		// 生成商品id
		final long itemId = IDUtils.genItemId();
		// 补全pojo的内容
		item.setId(itemId);
		// 1-正常 2-下架 3-删除
		item.setStatus((byte) 1);
		Date date = new Date();
		item.setCreated(date);
		item.setUpdated(date);
		// 插入数据库
		itemMapper.insert(item);
		// 插入商品描述
		desc.setItemId(itemId);
		desc.setCreated(date);
		desc.setUpdated(date);
		itemDescMapper.insert(desc);
		//发送商品添加消息
		jmsTemplate.send(activeMQTopic, new MessageCreator() {
			
			@Override
			public Message createMessage(Session session) throws JMSException {
				TextMessage textMessage = session.createTextMessage(itemId + "");
				return textMessage;
			}
		});
		// 返回成功
		return TabResult.ok();
	}
	/**
	 * 编辑商品
	 */
	@Override
	public TabResult updateItem(TbItem item, TbItemDesc desc) {
		item.setUpdated(new Date());
		itemMapper.updateByPrimaryKeySelective(item);
		desc.setUpdated(new Date());
		itemDescMapper.updateByPrimaryKeySelective(desc);
		//商品修改需要缓存同步
		jedisClient.hdel(REDIS_ITEM_KEY, item.getId().toString());
		return TabResult.ok();
	}
	/**
	 * 删除商品
	 */
	@Override
	public TabResult deleteItem(long[] ids) {
		for (final long id : ids) {
			TbItem item = new TbItem();
			item.setId(id);
			item.setStatus((byte)3);
			itemMapper.updateByPrimaryKeySelective(item);
			//发送删除添加消息
			jmsTemplate.send(activeMQTopic, new MessageCreator() {
				@Override
				public Message createMessage(Session session) throws JMSException {
					TextMessage textMessage = session.createTextMessage(id + "");
					return textMessage;
				}
			});
		}
		return TabResult.ok();
	}
	/**
	 * 商品下架
	 */
	@Override
	public TabResult updateItemInstock(long[] ids) {
		for (long id : ids) {
			TbItem item = new TbItem();
			item.setId(id);
			item.setStatus((byte)2);
			itemMapper.updateByPrimaryKeySelective(item);
		}
		return TabResult.ok();
	}
	/**
	 * 商品上架
	 */
	@Override
	public TabResult updateItemReshelf(long[] ids) {
		for (long id : ids) {
			TbItem item = new TbItem();
			item.setId(id);
			item.setStatus((byte)1);
			itemMapper.updateByPrimaryKeySelective(item);
		}
		return TabResult.ok();
	}

	/**
	 * 取商品描述
	 */
	@Override
	public TbItemDesc getItemDescById(Long itemId) {
		//查询商品之前先查询缓存
		try {
			String json = jedisClient.get(REDIS_ITEM_KEY + ":" + itemId + ":DESC");
			if (StringUtils.isNotBlank(json)) {
				//把json数据转换成java对象
				TbItemDesc itemDesc = JsonUtils.jsonToPojo(json, TbItemDesc.class);
				return itemDesc;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//设置查询条件
		TbItemDescExample example = new TbItemDescExample();
		com.tab.pojo.TbItemDescExample.Criteria criteria = example.createCriteria();
		criteria.andItemIdEqualTo(itemId);
		//执行查询
		List<TbItemDesc> list = itemDescMapper.selectByExampleWithBLOBs(example);
		if (list != null && list.size() > 0) {
			TbItemDesc itemDesc = list.get(0);
			//把数据缓存起来
			try {
				jedisClient.set(REDIS_ITEM_KEY + ":" + itemId + ":DESC", JsonUtils.objectToJson(itemDesc));
				//设置过期时间
				jedisClient.expire(REDIS_ITEM_KEY + ":" + itemId + ":DESC", REDIS_ITEM_EXPIRE);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return itemDesc;
		}
		return null;
	}

}
