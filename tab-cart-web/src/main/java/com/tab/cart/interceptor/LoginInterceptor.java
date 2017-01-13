package com.tab.cart.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tab.common.pojo.TabResult;
import com.tab.common.utils.CookieUtils;
import com.tab.user.service.LoginService;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Value("${TOKEN_KEY}")
	private String TOKEN_KEY;
	@Value("${SSO_LOGIN_URL}")
	private String SSO_LOGIN_URL;
	@Autowired
	private LoginService loginService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 从cookie中取token
		String token = CookieUtils.getCookieValue(request, TOKEN_KEY);
		// 没取到token，跳转到sso登录页面。
		if (StringUtils.isBlank(token)) {
			//取当前访问的url
			String url = request.getRequestURL().toString();
			response.sendRedirect(SSO_LOGIN_URL + "?redirectURL=" + url);
			return false;
		}
		// 取到token，根据token查询用户信息，如果已经过期，跳转到sso登录页面。
		TabResult result = loginService.checkUser(token);
		//Session已经失效
		if (result.getStatus() != 200) {
			//取当前访问的url
			String url = request.getRequestURL().toString();
			response.sendRedirect(SSO_LOGIN_URL + "?redirectURL=" + url);
			return false;
		}
		//把用户信息写入request
		request.setAttribute("user", result.getData());
		// 没有过期就显示订单确认页面，拦截器放行。
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
