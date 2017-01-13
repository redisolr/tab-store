package com.tab.portal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tab.common.pojo.Ad1Node;
import com.tab.content.service.ContentService;

@Controller
public class IndexController {
	@Value("${AD1_CATEGORY_ID}")
	private Long AD1_CATEGORY_ID;
	@Value("${AD1_WIDTH}")
	private Integer AD1_WIDTH;
	@Value("${AD1_WIDTH_B}")
	private Integer AD1_WIDTH_B;
	@Value("${AD1_HEIGHT}")
	private Integer AD1_HEIGHT;
	@Value("${AD1_HEIGHT_B}")
	private Integer AD1_HEIGHT_B;
	@Autowired
	private ContentService contentService;
	//访问首页
	@RequestMapping("/index")
	public String showIndex(){
		return "index";
	}
	//轮播图
	@RequestMapping("/bigImage")
	@ResponseBody
	public List<Ad1Node> bigImage(Model model) {
		// 调用service查询内容列表
		List<Ad1Node> list = contentService.getContentList(AD1_CATEGORY_ID);
		for (Ad1Node ad1Node : list) {
			ad1Node.setHeight(AD1_HEIGHT);
			ad1Node.setHeightB(AD1_HEIGHT_B);
			ad1Node.setWeight(AD1_WIDTH);
			ad1Node.setWeightB(AD1_WIDTH_B);
		}
		return list;
	}
}
