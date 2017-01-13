package com.tab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tab.common.pojo.EasyUIDataGridResult;
import com.tab.common.pojo.TabResult;
import com.tab.content.service.ContentService;
import com.tab.pojo.TbContent;

@Controller
@RequestMapping("/content")
public class ContentController {
	@Autowired
	private ContentService contentService;
	/**
	 * 查询分类内容
	 * @param categoryId
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/query/list")
	@ResponseBody
	public EasyUIDataGridResult getContentList(Long categoryId, Integer page, Integer rows ){
		EasyUIDataGridResult list = contentService.getContentList(categoryId, page, rows);
		return list;
	}
	/**
	 * 添加分类内容
	 * @param content
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody
	public TabResult addContent(TbContent content){
		TabResult result = contentService.addContent(content);
		return result;
	}
	/**
	 * 编辑分类内容
	 * @param content
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public TabResult editContent(TbContent content){
		TabResult result = contentService.updateContent(content);
		return result;
	}
	/**
	 * 删除分类内容
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public TabResult deleteContent(long[] ids){
		TabResult result = contentService.deleteContent(ids);
		return result;
	}
}
