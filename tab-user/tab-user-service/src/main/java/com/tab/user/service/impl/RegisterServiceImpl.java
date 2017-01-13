package com.tab.user.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.tab.common.pojo.TabResult;
import com.tab.mapper.TbUserMapper;
import com.tab.pojo.TbUser;
import com.tab.pojo.TbUserExample;
import com.tab.pojo.TbUserExample.Criteria;
import com.tab.user.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private TbUserMapper userMapper;
	
	@Override
	public TabResult dataCheck(String param, int type) {
		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		// 判断数据类型
		//1、2、3分别代表username、phone、email
		if (type == 1) {
			criteria.andUsernameEqualTo(param);
		} else if (type == 2) {
			criteria.andPhoneEqualTo(param);
		} else if (type == 3) {
			criteria.andEmailEqualTo(param);
		}
		//执行查询
		List<TbUser> list = userMapper.selectByExample(example);
		//判断返回结果是否为空
		if (list == null || list.isEmpty()) {
			//此数据可用，返回true
			return TabResult.ok(true);
		}
		return TabResult.ok(false);
	}

	/**
	 * 用户注册
	 * <p>Title: register</p>
	 * <p>Description: </p>
	 * @param user
	 * @return
	 * @see com.taotao.user.service.RegisterService#register(com.taotao.pojo.TbUser)
	 */
	@Override
	public TabResult register(TbUser user) {
		//补全属性
		user.setCreated(new Date());
		user.setUpdated(new Date());
		//密码进行md5加密
		String passowrdMd5 = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
		user.setPassword(passowrdMd5);
		//插入数据库
		userMapper.insert(user);
		
		return TabResult.ok();
	}

}
