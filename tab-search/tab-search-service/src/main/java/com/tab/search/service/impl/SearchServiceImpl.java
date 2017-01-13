package com.tab.search.service.impl;

import org.apache.solr.client.solrj.SolrQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.tab.common.pojo.SearchResult;
import com.tab.search.dao.SearchDao;
import com.tab.search.service.SearchService;

/**
 * 查询服务Service
 */
@Service
public class SearchServiceImpl implements SearchService {
	@Reference
	@Autowired(required=true)
	private SearchDao searchDao;
	
	@Override
	public SearchResult search(String queryString, int page, int rows) throws Exception {
		//拼装solrQuery对象
		SolrQuery query = new SolrQuery();
		//设置查询条件
		query.setQuery(queryString);
		//设置分页条件
		query.setStart((page-1)*rows);
		query.setRows(rows);
		//设置默认搜索域
		query.set("df", "item_title");
		//设置高亮
		query.setHighlight(true);
		//高亮显示的域
		query.addHighlightField("item_title");
		//高亮的前缀后缀
		query.setHighlightSimplePre("<font class=\"skcolor_ljg\">");
		query.setHighlightSimplePost("</font>");
		//执行查询
		SearchResult searchResult = searchDao.query(query);
		//计算总页数
		long recordCount = searchResult.getRecordCount();
		int pageCount = (int) (recordCount / rows);
		if (recordCount % rows > 0) {
			pageCount++;
		}
		searchResult.setPageCount(pageCount);
		searchResult.setCurPage(page);
		
		return searchResult;
	}

}
