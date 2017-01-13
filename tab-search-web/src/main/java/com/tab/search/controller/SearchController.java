package com.tab.search.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tab.common.pojo.SearchResult;
import com.tab.search.service.SearchService;

/**
 * 搜索服务Controller
 
 */
@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/search")
	public String search(@RequestParam("q") String queryString, 
			@RequestParam(defaultValue="1")Integer page, 
			@RequestParam(defaultValue="12")Integer rows, Model model) {
		//调用Service查询商品列表
		try {
			queryString = new String(queryString.getBytes("iso8859-1"), "utf-8");
			SearchResult result = searchService.search(queryString, page, rows);
			//页面需要的数据传递给页面
			model.addAttribute("query", queryString);
			model.addAttribute("totalPages", result.getPageCount());
			model.addAttribute("itemList", result.getItemList());
			model.addAttribute("page", page);
			return "search";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "您的网络有问题，请重试！");
			return "error/exception";
		}
		
	}
}
