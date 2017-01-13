package com.tab.sso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面跳转Controller
 * @version 1.0
 */
@Controller
public class PageController {

	@RequestMapping("/page/login")
	public String showLogin(String redirectURL, Model model) {
		//把回调的url传递给jsp
		model.addAttribute("redirect", redirectURL);
		return "login";
	}
	@RequestMapping("/page/register")
	public String showRegister() {
		return "register";
	}
}
