package com.tab.order.pojo;

import java.io.Serializable;
import java.util.List;

import com.tab.pojo.TbOrder;
import com.tab.pojo.TbOrderItem;
import com.tab.pojo.TbOrderShipping;

public class OrderInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4769395178186555199L;
	private TbOrder order;
	private List<TbOrderItem> itemList;
	private TbOrderShipping orderShipping;
	public TbOrder getOrder() {
		return order;
	}
	public void setOrder(TbOrder order) {
		this.order = order;
	}
	
	public List<TbOrderItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<TbOrderItem> itemList) {
		this.itemList = itemList;
	}
	public TbOrderShipping getOrderShipping() {
		return orderShipping;
	}
	public void setOrderShipping(TbOrderShipping orderShipping) {
		this.orderShipping = orderShipping;
	}
	
}
