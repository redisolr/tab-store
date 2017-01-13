package com.tab.order.service.impl;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.tab.common.pojo.TabResult;
import com.tab.mapper.TbOrderItemMapper;
import com.tab.mapper.TbOrderMapper;
import com.tab.mapper.TbOrderShippingMapper;
import com.tab.order.pojo.OrderInfo;
import com.tab.order.service.OrderService;
import com.tab.order.service.jedisclient.JedisClient;
import com.tab.pojo.TbOrder;
import com.tab.pojo.TbOrderItem;
import com.tab.pojo.TbOrderShipping;

/**
 * 订单服务Service
 */
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private TbOrderMapper orderMapper;
	@Autowired
	private TbOrderItemMapper orderItemMapper;
	@Autowired
	private TbOrderShippingMapper orderShippingMapper;
	@Autowired
	private JedisClient jedisClient;
	
	@Value("${ORDER_ID_GEN_KEY}")
	private String ORDER_ID_GEN_KEY;
	@Value("${ORDER_START_NUM}")
	private String ORDER_START_NUM;
	@Value("${ORDER_DETAIL_ID_GEN_KEY}")
	private String ORDER_DETAIL_ID_GEN_KEY;
	
	@Override
	public TabResult createOrder(OrderInfo orderInfo) {
		// 1、接收OrderInfo pojo
		// 2、生成orderid
		String key = jedisClient.get(ORDER_ID_GEN_KEY);
		if (StringUtils.isBlank(key)) {
			//设置初始值
			jedisClient.set(ORDER_ID_GEN_KEY, ORDER_START_NUM);
		}
		//取订单号
		Long orderId = jedisClient.incr(ORDER_ID_GEN_KEY);
		// 3、补全orderpojo的属性。
		TbOrder order = orderInfo.getOrder();
		//设置订单号
		order.setOrderId(orderId.toString());
		//免邮费
		order.setPostFee("0");
		//订单状态
		//未付款状态1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭
		order.setStatus(1);
		Date date = new Date();
		order.setCreateTime(date);
		order.setUpdateTime(date);
		// 4、向order表中插入数据
		orderMapper.insert(order);
		// 5、循环的插入orderItem表
		for (TbOrderItem orderItem : orderInfo.getItemList()) {
			//生成订单明细主键
			Long orderItemId = jedisClient.incr(ORDER_DETAIL_ID_GEN_KEY);
			//补全订单明细属性
			orderItem.setId(orderItemId.toString());
			//设置订单号
			orderItem.setOrderId(orderId.toString());
			//插入数据
			orderItemMapper.insert(orderItem);
		}
		// 6、插入配送信息表
		TbOrderShipping orderShipping = orderInfo.getOrderShipping();
		orderShipping.setOrderId(orderId.toString());
		orderShipping.setCreated(date);
		orderShipping.setUpdated(date);
		//插入数据
		orderShippingMapper.insert(orderShipping);
		// 7、返回成功。返回TaotaoResult，包含订单号。
		return TabResult.ok(orderId);
	}

}
