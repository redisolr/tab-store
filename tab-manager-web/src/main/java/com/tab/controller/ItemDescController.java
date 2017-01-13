package com.tab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tab.pojo.TbItemDesc;
import com.tab.service.ItemDescService;

@Controller
@RequestMapping("/item")
public class ItemDescController {
	@Autowired
	private ItemDescService itemService;
	@RequestMapping("/desc/{itemId}")
	@ResponseBody
	public TbItemDesc geTbItemDescById(@PathVariable Long itemId) {
		TbItemDesc tbItemDesc = itemService.geTbItemDescById(itemId);
		return tbItemDesc;
	}
}
