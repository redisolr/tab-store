package com.tab.cart.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.tab.common.pojo.TabResult;
import com.tab.common.utils.CookieUtils;
import com.tab.common.utils.JsonUtils;
import com.tab.pojo.TbItem;
import com.tab.service.ItemService;

/**
 * 操作cookie中的购物车数据
 * @version 1.0
 */
@Service
public class CartService {
	
	@Value("${CART_KEY}")
	private String CART_KEY;
	@Value("${COOKIE_EXPIRE}")
	private Integer COOKIE_EXPIRE;
	@Autowired
	private ItemService itemService;

	/**
	 * 添加购物车处理
	 * <p>Title: addCart</p>
	 * <p>Description: </p>
	 * @param itemId
	 * @param num
	 */
	public void addCart(Long itemId, Integer num, 
			HttpServletRequest request, HttpServletResponse response) {
		
		//从cookie中取取购物车列表
		List<TbItem> list = getItemListFromCookie(request);
		//查看列表中是否有此商品
		boolean flag = false;
		for (TbItem tbItem : list) {
			//包装数据类型直接==比较的不是数值
			if (tbItem.getId() == itemId.longValue()){
				//商品数量相加
				tbItem.setNum(tbItem.getNum() + num );
				flag = true;
				break;
			}
		}
		//列表中没有此商品
		if (!flag) {
			//根据商品id取商品信息。
			TbItem item = itemService.getItemById(itemId);
			//设置商品的数量
			item.setNum(num);
			//把对象添加到商品列表
			list.add(item);
		}
		//把购物车商品列表写入cookie
		CookieUtils.setCookie(request, response, CART_KEY, JsonUtils.objectToJson(list), COOKIE_EXPIRE, true);
		
	}
	
	/**
	 * 取购物车列表
	 * <p>Title: getItemListFromCookie</p>
	 * <p>Description: </p>
	 * @param request
	 * @return
	 */
	private List<TbItem> getItemListFromCookie(HttpServletRequest request) {
		//从cookie中取商品列表
		String json = CookieUtils.getCookieValue(request, CART_KEY, true);
		if (StringUtils.isBlank(json)) {
			return new ArrayList<>();
		}
		//购物车不为空把json数据转换成java对象
		List<TbItem> list = JsonUtils.jsonToList(json, TbItem.class);
		return list;
	}
	
	/**
	 * 取购物车列表
	 * <p>Title: getCartList</p>
	 * <p>Description: </p>
	 * @param request
	 * @return
	 */
	public List<TbItem> getCartList(HttpServletRequest request) {
		
		return getItemListFromCookie(request);
	}
	
	/**
	 * 更新商品数量
	 * <p>Title: updateNum</p>
	 * <p>Description: </p>
	 * @param itemId
	 * @param num
	 * @return
	 */
	public TabResult updateNum(long itemId, int num, 
			HttpServletRequest request, HttpServletResponse response) {
		//取商品列表
		List<TbItem> list = getItemListFromCookie(request);
		//查询商品
		for (TbItem tbItem : list) {
			if (itemId == tbItem.getId()) {
				tbItem.setNum(num);
				break;
			}
		}
		//把商品列表写回cookie
		CookieUtils.setCookie(request, response, CART_KEY, JsonUtils.objectToJson(list), COOKIE_EXPIRE, true);
		//返回
		return TabResult.ok();
	}
	
	/**
	 * 删除购物车商品
	 * <p>Title: deleteCartItem</p>
	 * <p>Description: </p>
	 * @param itemId
	 * @param request
	 * @param response
	 */
	public void deleteCartItem(Long itemId, 
			HttpServletRequest request, HttpServletResponse response) {
		// 1、从cookie中把购物车列表取出来
		List<TbItem> list = getItemListFromCookie(request);
		// 2、然后把商品从购物车列表中删除，
		for (TbItem tbItem : list) {
			if (tbItem.getId() == itemId.longValue()) {
				list.remove(tbItem);
				break;
			}
		}
		// 3、删除之后保存到cookie。
		CookieUtils.setCookie(request, response, CART_KEY, JsonUtils.objectToJson(list), COOKIE_EXPIRE, true);
	}
	
}
