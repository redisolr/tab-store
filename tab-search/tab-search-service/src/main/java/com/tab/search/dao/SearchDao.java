package com.tab.search.dao;

import org.apache.solr.client.solrj.SolrQuery;

import com.tab.common.pojo.SearchResult;

public interface SearchDao {

	SearchResult query(SolrQuery query) throws Exception;
}
