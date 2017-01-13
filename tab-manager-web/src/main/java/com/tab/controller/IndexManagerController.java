package com.tab.controller;
/**
 * 索引库管理Controller
 * <p>Title: IndexManagerController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云龙
 * @date	2015年12月19日上午11:54:13
 * @version 1.0
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tab.common.pojo.TabResult;
import com.tab.search.service.SearchItemService;

@Controller
public class IndexManagerController {
	
	@Autowired
	private SearchItemService searchItemService;
	
	@RequestMapping("/index/importall")
	@ResponseBody
	public TabResult importAllItems() {
		try {
			TabResult taotaoResult = searchItemService.importAllItems();
			return taotaoResult;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return TabResult.build(500, "同步失败");
		}
	}
	
}
