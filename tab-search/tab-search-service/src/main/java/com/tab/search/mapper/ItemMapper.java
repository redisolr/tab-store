package com.tab.search.mapper;

import java.util.List;

import com.tab.common.pojo.SearchItem;

public interface ItemMapper {

	List<SearchItem> getItemList();
	SearchItem getItemById(Long itemid);
}
