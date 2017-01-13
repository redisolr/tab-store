package com.tab.search.activemq;

import java.io.IOException;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tab.common.pojo.SearchItem;
import com.tab.search.mapper.ItemMapper;

@Component
public class ItemAddMessageListener implements MessageListener {

	@Autowired
	private ItemMapper itemMapper;
	@Autowired
	private SolrServer solrServer;
	
	@Override
	public void onMessage(Message message) {
		//接收商品id
		TextMessage textMessage = (TextMessage) message;
		Long itemid = null;
		try {
			String text = textMessage.getText();
			//转换成商品id
			itemid = new Long(text);
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//根据商品id查询商品信息
		SearchItem searchItem = itemMapper.getItemById(itemid);
		//把商品添加到索引库
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
		try {
			solrServer.add(document);
			solrServer.commit();
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
