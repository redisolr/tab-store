package com.tab.sso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tab.common.pojo.TabResult;
import com.tab.pojo.TbUser;
import com.tab.user.service.RegisterService;

/**
 * 用户注册Controller
 * @version 1.0
 */
@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService;
	
	@RequestMapping("/user/check/{param}/{type}")
	@ResponseBody
	public TabResult dataCheck(@PathVariable String param, @PathVariable Integer type) {
		TabResult result = registerService.dataCheck(param, type);
		return result;
	}
	
	@RequestMapping(value="/user/register", method=RequestMethod.POST)
	@ResponseBody
	public TabResult register(TbUser user) {
		TabResult taotaoResult = registerService.register(user);
		return taotaoResult;
	}
}
