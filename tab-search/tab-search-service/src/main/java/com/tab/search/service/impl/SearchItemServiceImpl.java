package com.tab.search.service.impl;

import java.util.List;

import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tab.common.pojo.SearchItem;
import com.tab.common.pojo.TabResult;
import com.tab.search.mapper.ItemMapper;
import com.tab.search.service.SearchItemService;

/**
 * 在搜索系统中管理商品的服务
 */
@Service
public class SearchItemServiceImpl implements SearchItemService {

	@Autowired
	private ItemMapper itemMapper;

	// 第一步：创建一个SolrServer对象，如果是单机版使用HttpSolrServer、集群版使用CloudSolrServer。
	@Autowired
	private SolrServer solrServer;

	@Override
	public TabResult importAllItems() throws Exception {
		// 查询商品列表，如果商品太多需要分页。
		List<SearchItem> itemList = itemMapper.getItemList();
		// 把商品信息写入索引库
		for (SearchItem searchItem : itemList) {
			// 第二步：创建一个文档对象SolrInputDocument对象。
			SolrInputDocument document = new SolrInputDocument();
			// 第三步：向文档中添加域。每个文档对象中必须有id域，id不能重复。用到的所有的域的名称必须在schema.xml中定义。
			document.addField("id", searchItem.getId());
			document.addField("item_title", searchItem.getTitle());
			document.addField("item_sell_point", searchItem.getSell_point());
			document.addField("item_price", searchItem.getPrice());
			document.addField("item_image", searchItem.getImage());
			document.addField("item_category_name", searchItem.getCategory_name());
			document.addField("item_desc", searchItem.getItem_des());
			// 第四步：使用SolrServer把文档添加到索引库
			solrServer.add(document);
		}
		// 第五步：提交。
		solrServer.commit();
		//返回成功
		return TabResult.ok();
	}

}
