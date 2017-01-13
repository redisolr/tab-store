package com.tab.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tab.cart.service.CartService;
import com.tab.order.pojo.OrderInfo;
import com.tab.order.service.OrderService;
import com.tab.common.pojo.TabResult;
import com.tab.pojo.TbItem;
import com.tab.pojo.TbOrderItem;
import com.tab.pojo.TbUser;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@RequestMapping("/order-cart")
	public String showOrderCart(HttpServletRequest request){
		//取用户信息
		TbUser user = (TbUser) request.getAttribute("user");
		//根据用户查询收货地址列表
		//................
		//取商品列表
		List<TbItem> list = cartService.getCartList(request);
		if(list.size() == 0){
			return "cart";
		}
		request.setAttribute("cartList", list);
		return "order-cart";

	}
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createOrder(OrderInfo orderInfo, Model model, HttpServletRequest request, HttpServletResponse response) {
		//取用户信息
		TbUser user = (TbUser) request.getAttribute("user");
		//设置用户id
		orderInfo.getOrder().setUserId(user.getId());
		orderInfo.getOrder().setBuyerNick(user.getUsername());
		TabResult result = orderService.createOrder(orderInfo);
		//把订单号传递给页面
		model.addAttribute("orderId", result.getData());
		model.addAttribute("payment", orderInfo.getOrder().getPayment());
		//预计配送时间是三天后
		DateTime dateTime = new DateTime();
		dateTime = dateTime.plusDays(3);
		model.addAttribute("date", dateTime.toString("yyyy-MM-dd"));
		List<TbOrderItem> itemList = orderInfo.getItemList();
		for (TbOrderItem tbOrderItem : itemList) {
			cartService.deleteCartItem(Long.valueOf(tbOrderItem.getItemId()), request, response);
		}
		//返回成功页面
		return "success";
	}
}
