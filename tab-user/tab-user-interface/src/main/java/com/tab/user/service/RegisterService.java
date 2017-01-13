package com.tab.user.service;

import com.tab.common.pojo.TabResult;
import com.tab.pojo.TbUser;

public interface RegisterService {

	TabResult dataCheck(String param, int type);
	TabResult register(TbUser user);
}
