package com.tab.order.service;

import com.tab.common.pojo.TabResult;
import com.tab.order.pojo.OrderInfo;

public interface OrderService {

	TabResult createOrder(OrderInfo orderInfo);
}
