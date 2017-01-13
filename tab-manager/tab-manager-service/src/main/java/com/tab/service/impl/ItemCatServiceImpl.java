package com.tab.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.tab.common.pojo.EasyUITreeNode;
import com.tab.mapper.TbItemCatMapper;
import com.tab.pojo.TbItemCat;
import com.tab.pojo.TbItemCatExample;
import com.tab.pojo.TbItemCatExample.Criteria;
import com.tab.service.ItemCatService;

/**
 * 商品分类管理service
 * 
 * @author qt
 *
 */
@Service
public class ItemCatServiceImpl implements ItemCatService {
	@Reference
	@Autowired(required = false)
	private TbItemCatMapper itemCatMapper;

	/**
	 * 根据商品分类的parentId查询列表
	 */
	@Override
	public List<EasyUITreeNode> getItemCatList(long parentId) {
		// 根据parentId查询分类列表
		TbItemCatExample example = new TbItemCatExample();
		// 设置插叙条件
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		// 执行查询
		List<TbItemCat> list = itemCatMapper.selectByExample(example);
		// 装换成EasyUITreeNode列表
		List<EasyUITreeNode> resultList = new ArrayList<>();
		for (TbItemCat tbItemCat : list) {
			// 创建 EasyUITreeNode对象
			EasyUITreeNode node = new EasyUITreeNode();
			node.setId(tbItemCat.getId().intValue());
			node.setText(tbItemCat.getName());
			// 当节点下有子节点"closed",如果没有"open"
			node.setState(tbItemCat.getIsParent() ? "closed" : "open");
			resultList.add(node);
		}
		return resultList;
	}

}
