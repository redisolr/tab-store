package com.tab.user.service;

import com.tab.common.pojo.TabResult;

public interface LoginService {

	TabResult login(String username, String password);
	TabResult checkUser(String token);
	TabResult signout(String token);
}
