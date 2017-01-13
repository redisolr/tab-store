package com.tab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tab.common.pojo.EasyUIDataGridResult;
import com.tab.common.pojo.TabResult;
import com.tab.pojo.TbItem;
import com.tab.pojo.TbItemDesc;
import com.tab.service.ItemService;

import sun.tools.jconsole.Tab;
@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;
	@RequestMapping("item/{itemId}")
	@ResponseBody
	public TbItem geTbItemById(@PathVariable Long itemId){
		TbItem tbItem = itemService.getItemById(itemId);
		return tbItem;
	}
	/**
	 * 查询商品列表
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/item/list")
	@ResponseBody
	public EasyUIDataGridResult getItemList(Integer page, Integer rows) {
		//调用服务查询商品列表
		EasyUIDataGridResult result = itemService.getItemList(page, rows);
		return result;
	}
	/**
	 * 添加商品
	 * @param item
	 * @param itemDesc
	 * @return
	 */
	@RequestMapping("/item/save")
	@ResponseBody
	public TabResult itemSave(TbItem item, TbItemDesc itemDesc){
		//调用服务插入数据
		TabResult result = itemService.addItem(item, itemDesc);
		return result;
	}
	/**
	 * 编辑商品
	 * @param item
	 * @param itemDesc
	 * @return
	 */
	@RequestMapping("/item/update")
	@ResponseBody
	public TabResult updateItem(TbItem item, TbItemDesc itemDesc){
		TabResult result = itemService.updateItem(item, itemDesc);
		return result;
	}
	/**
	 * 删除商品
	 * @param ids
	 * @return
	 */
	@RequestMapping("/item/delete")
	@ResponseBody
	public TabResult deleteItem(long[] ids){
		TabResult result = itemService.deleteItem(ids);
		return result;
	}
	/**
	 * 下架商品
	 * @param ids
	 * @return
	 */
	@RequestMapping("/item/instock")
	@ResponseBody
	public TabResult updateItemInstock(long[] ids){
		TabResult result = itemService.updateItemInstock(ids);
		return result;
	}
	/**
	 * 上架商品
	 * @param ids
	 * @return
	 */
	@RequestMapping("/item/reshelf")
	@ResponseBody
	public TabResult updateItemReshelf(long[] ids){
		TabResult result = itemService.updateItemReshelf(ids);
		return result;
	}
	
}
