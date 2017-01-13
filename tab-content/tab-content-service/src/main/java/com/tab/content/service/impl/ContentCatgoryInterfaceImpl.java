package com.tab.content.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.tab.common.pojo.EasyUITreeNode;
import com.tab.common.pojo.TabResult;
import com.tab.content.service.ContentCatgoryInterface;
import com.tab.mapper.TbContentCategoryMapper;
import com.tab.mapper.TbContentMapper;
import com.tab.pojo.TbContent;
import com.tab.pojo.TbContentCategory;
import com.tab.pojo.TbContentCategoryExample;
import com.tab.pojo.TbContentCategoryExample.Criteria;
import com.tab.pojo.TbContentExample;

@Service
public class ContentCatgoryInterfaceImpl implements ContentCatgoryInterface {
	@Reference
	@Autowired(required = false)
	private TbContentCategoryMapper contentCategoryMapper;
	@Reference
	@Autowired(required = false)
	private TbContentMapper contentMapper;
	/**
	 * 查询内容分类列表
	 */
	@Override
	public List<EasyUITreeNode> getContentCatList(long parentId) {
		// 根据父节点id查询字节裂变
		TbContentCategoryExample example = new TbContentCategoryExample();
		// 设置查询条件
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		// 执行查询
		List<TbContentCategory> list = contentCategoryMapper.selectByExample(example);
		// 转换为EasyUITree的节点列表
		List<EasyUITreeNode> resultList = new ArrayList<>();
		for (TbContentCategory tbContentCategory : list) {
			// 创建一节点对象
			EasyUITreeNode node = new EasyUITreeNode();
			node.setId(tbContentCategory.getId().intValue());
			node.setText(tbContentCategory.getName());
			node.setState(tbContentCategory.getIsParent() ? "closed" : "open");
			// 添加到列表
			resultList.add(node);
		}
		return resultList;
	}

	/**
	 * 添加内容分类节点
	 */
	@Override
	public TabResult createCatNode(long parentId, String name) {
		// 创建一个ContentCatory对象
		TbContentCategory contentCategory = new TbContentCategory();
		contentCategory.setParentId(parentId);
		;
		contentCategory.setName(name);
		contentCategory.setIsParent(false);
		// 可选值:1(正常),2(删除)
		contentCategory.setStatus(1);
		// 排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数
		contentCategory.setSortOrder(1);
		contentCategory.setCreated(new Date());
		contentCategory.setUpdated(new Date());
		// 插入数据
		contentCategoryMapper.insert(contentCategory);
		// 判断ParentId对应的记录的isparent属性
		TbContentCategory parentNode = contentCategoryMapper.selectByPrimaryKey(parentId);
		if (!parentNode.getIsParent()) {
			parentNode.setIsParent(true);
			contentCategoryMapper.updateByPrimaryKey(parentNode);
		}
		// 返回结果
		return TabResult.ok(contentCategory);
	}

	/**
	 * 编辑节点名称
	 */
	@Override
	public TabResult updateCatNode(long id, String name) {
		// 创建一个ContentCatory对象
		TbContentCategory contentCategory = new TbContentCategory();
		contentCategory.setId(id);
		contentCategory.setName(name);
		contentCategory.setUpdated(new Date());
		contentCategoryMapper.updateByPrimaryKeySelective(contentCategory);
		return TabResult.ok(contentCategory);
	}

	/**
	 * 删除节点
	 */
	@Override
	public TabResult deleteCatNode(long id) {
		TbContentCategory contentCategory1 = contentCategoryMapper.selectByPrimaryKey(id);
		TbContentCategoryExample example = new TbContentCategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(id);
		List<TbContentCategory> list = contentCategoryMapper.selectByExample(example);
		if(list!=null && list.size()!=0){
			for (TbContentCategory contentCategory : list) {
				if(contentCategory.getIsParent()){
					deleteCatNode(contentCategory.getId());
				}else{
					contentCategoryMapper.deleteByPrimaryKey(contentCategory.getId());
					deleteContent(contentCategory.getId());
				}
				contentCategoryMapper.deleteByPrimaryKey(id);
				deleteContent(id);
			}
			
			
			TbContentCategoryExample example1 = new TbContentCategoryExample();
			Criteria criteria2 = example1.createCriteria();
			criteria2.andParentIdEqualTo(contentCategory1.getParentId());
			List<TbContentCategory> list1 = contentCategoryMapper.selectByExample(example1);
			if(list1.size() == 0){
				TbContentCategory contentCategory2 = contentCategoryMapper.selectByPrimaryKey(contentCategory1.getParentId());
				contentCategory2.setIsParent(false);
				contentCategoryMapper.updateByPrimaryKey(contentCategory2);
			}
			return TabResult.ok();
		}
		contentCategoryMapper.deleteByPrimaryKey(id);
		deleteContent(id);
		TbContentCategoryExample example1 = new TbContentCategoryExample();
		Criteria criteria2 = example1.createCriteria();
		criteria2.andParentIdEqualTo(contentCategory1.getParentId());
		List<TbContentCategory> list1 = contentCategoryMapper.selectByExample(example1);
		if(list1.size() == 0){
			TbContentCategory contentCategory2 = contentCategoryMapper.selectByPrimaryKey(contentCategory1.getParentId());
			contentCategory2.setIsParent(false);
			contentCategoryMapper.updateByPrimaryKey(contentCategory2);
		}
		return TabResult.ok();
	}
	/**
	 * 删除节点内容
	 * @param id
	 */
	public void deleteContent(long id){
		TbContentExample contentExample = new TbContentExample();
		com.tab.pojo.TbContentExample.Criteria criteria = contentExample.createCriteria();
		criteria.andCategoryIdEqualTo(id);
		List<TbContent> contents = contentMapper.selectByExample(contentExample);
		if (contents.size() > 0) {
			for (TbContent tbContent : contents) {
				contentMapper.deleteByPrimaryKey(tbContent.getId());
			}
		}
	}

}
