package com.tab.service;

import com.tab.common.pojo.EasyUIDataGridResult;
import com.tab.common.pojo.TabResult;
import com.tab.pojo.TbItem;
import com.tab.pojo.TbItemDesc;

public interface ItemService {
	public TbItem getItemById(Long itemId);
	EasyUIDataGridResult getItemList(int page, int rows);
	TabResult addItem(TbItem item, TbItemDesc desc);
	TabResult updateItem(TbItem item, TbItemDesc desc);
	TabResult deleteItem(long[] ids);
	TabResult updateItemInstock(long[] ids);
	TabResult updateItemReshelf(long[] ids);
	TbItemDesc getItemDescById(Long itemId);
}
