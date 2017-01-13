package com.tab.sso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tab.common.pojo.TabResult;
import com.tab.common.utils.CookieUtils;
import com.tab.user.service.LoginService;

/**
 * 登录处理
 * @version 1.0
 */
@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	@Value("${TOKEN_KEY}")
	private String TOKEN_KEY;
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	@ResponseBody
	public TabResult login(String username, String password, 
			HttpServletRequest request, HttpServletResponse response) {
		//调用服务登录
		TabResult result = loginService.login(username, password);
		if (result.getStatus() == 200) {
			//向cookie中写入token
			CookieUtils.setCookie(request, response, TOKEN_KEY, result.getData().toString());
		}
		//返回TaotaoResult
		return result;
	}
	@RequestMapping("/user/token/{token}")
	@ResponseBody
	public Object getUserByToken(@PathVariable String token, String callback) {
		TabResult result = loginService.checkUser(token);
		//正常调用
		if (StringUtils.isBlank(callback)) {
			return result;
		} else {
			//call不为空jsop调用
			//return "callback(result);"
			MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
			mappingJacksonValue.setJsonpFunction(callback);
			return mappingJacksonValue;
		}
	}
	@RequestMapping(value="/user/signout/{token}")
	@ResponseBody
	public Object signout(@PathVariable String token, String callback){
		TabResult result = loginService.signout(token);
		//正常调用
		if (StringUtils.isBlank(callback)) {
			return result;
		} else {
			//call不为空jsop调用
			//return "callback(result);"
			MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
			mappingJacksonValue.setJsonpFunction(callback);
			return mappingJacksonValue;
		}
	}
}
