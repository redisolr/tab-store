package com.tab.common.pojo;

import java.io.Serializable;
import java.util.List;

public class SearchResult implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8905917821042357390L;
	private List<SearchItem> itemList;
	private long recordCount;
	private int pageCount;
	private int curPage;

	public List<SearchItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<SearchItem> itemList) {
		this.itemList = itemList;
	}

	public long getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(long recordCount) {
		this.recordCount = recordCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

}
