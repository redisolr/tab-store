package com.tab.content.service;

import java.util.List;

import com.tab.common.pojo.Ad1Node;
import com.tab.common.pojo.EasyUIDataGridResult;
import com.tab.common.pojo.TabResult;
import com.tab.pojo.TbContent;

public interface ContentService {
	EasyUIDataGridResult getContentList(Long categoryId, int page, int rows);

	TabResult addContent(TbContent content);

	TabResult updateContent(TbContent content);

	TabResult deleteContent(long[] ids);

	List<Ad1Node> getContentList(long categoryId);
}
