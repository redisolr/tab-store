package com.tab.content.service;

import java.util.List;

import com.tab.common.pojo.EasyUITreeNode;
import com.tab.common.pojo.TabResult;

public interface ContentCatgoryInterface {
	List<EasyUITreeNode> getContentCatList(long parentId);

	TabResult createCatNode(long parentId, String name);

	TabResult updateCatNode(long id, String name);

	TabResult deleteCatNode(long id);
}
