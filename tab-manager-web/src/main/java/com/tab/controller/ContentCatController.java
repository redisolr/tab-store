package com.tab.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tab.common.pojo.EasyUITreeNode;
import com.tab.common.pojo.TabResult;
import com.tab.content.service.ContentCatgoryInterface;

@Controller
@RequestMapping("/content/category")
public class ContentCatController {

	@Autowired
	private ContentCatgoryInterface contentCatgoryInterface;
	/**
	 * 查询节点
	 * @param parentId
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public List<EasyUITreeNode> getContentCatList(@RequestParam(value="id",defaultValue="0") Long parentId){
		List<EasyUITreeNode> list = contentCatgoryInterface.getContentCatList(parentId);
		return list;
	}
	/**
	 * 添加节点
	 * @param parentId
	 * @param name
	 * @return
	 */
	@RequestMapping("/create")
	@ResponseBody
	public TabResult createCatNode(Long parentId, String name) {
		TabResult result = contentCatgoryInterface.createCatNode(parentId, name);
		return result;
	}
	/**
	 * 编辑节点
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public TabResult updateCatNode(Long id, String name){
		TabResult result = contentCatgoryInterface.updateCatNode(id, name);
		return result;
	}
	/**
	 * 删除节点
	 * @param id
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public TabResult deleteCatNode(Long id){
		TabResult result = contentCatgoryInterface.deleteCatNode(id);
		return result;
	}
}
