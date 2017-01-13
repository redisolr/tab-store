package com.tab.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tab.cart.service.CartService;
import com.tab.common.pojo.TabResult;
import com.tab.pojo.TbItem;

/**
 * 购物车处理Controller
 * @version 1.0
 */
@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@RequestMapping("/add/{itemId}")
	public String addCartItem(@PathVariable Long itemId, Integer num,
			HttpServletResponse response, HttpServletRequest request) {
		//调用Service添加商品列表
		cartService.addCart(itemId, num, request, response);
		//返回添加成功页面
		return "cartSuccess";
		
	}
	
	@RequestMapping("/cart")
	public String showCart(HttpServletRequest request) {
		List<TbItem> list = cartService.getCartList(request);
		//把购物车列表传递给页面
		request.setAttribute("cartList", list);
		return "cart";
	}
	
	@RequestMapping("/update/num/{itemId}/{num}")
	@ResponseBody
	public TabResult updateNum(@PathVariable Long itemId, @PathVariable Integer num,
			HttpServletRequest request ,HttpServletResponse response) {
		TabResult result = cartService.updateNum(itemId, num, request, response);
		return result;
	}
	
	@RequestMapping("/delete/{itemId}")
	public String deleteCarItem(@PathVariable Long itemId, HttpServletRequest request,
			HttpServletResponse response) {
		cartService.deleteCartItem(itemId, request, response);
		//返回到购物车列表页面
		return "redirect:/cart/cart.html";
	}
 	
}
