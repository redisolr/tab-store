package com.tab.user.service.impl;

import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.tab.common.pojo.TabResult;
import com.tab.common.utils.JsonUtils;
import com.tab.mapper.TbUserMapper;
import com.tab.pojo.TbUser;
import com.tab.pojo.TbUserExample;
import com.tab.pojo.TbUserExample.Criteria;
import com.tab.user.jedisclient.JedisClient;
import com.tab.user.service.LoginService;

/**
 * 用户登录Service
 */
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private TbUserMapper userMapper;
	@Autowired
	private JedisClient jedisClient;
	@Value("${SESSION_KEY}")
	private String SESSION_KEY;
	@Value("${SESSION_EXPIE}")
	private Integer SESSION_EXPIE;
	
	@Override
	public TabResult login(String username, String password) {
		// 1、根据用户名查询用户信息
		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		//查询条件
		criteria.andUsernameEqualTo(username);
		List<TbUser> list = userMapper.selectByExample(example);
		if (list == null || list.size() == 0) {
			return TabResult.build(300, "用户名不存在");
		}
		//取用户信息
		TbUser user = list.get(0);
		// 2、密码校验需要进行md5加密。
		if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword())) {
			return TabResult.build(400, "密码不正确");
		}
		// 3、生成token
		String token = UUID.randomUUID().toString();
		// 4、把用户信息写入redis
		user.setPassword(null);
		jedisClient.set(SESSION_KEY + ":" + token, JsonUtils.objectToJson(user));
		//设置Session的有效期
		jedisClient.expire(SESSION_KEY + ":" + token, SESSION_EXPIE);
		// 5、返回token
		return TabResult.ok(token);
	}

	/**
	 * 根据token查询用户
	 * <p>Title: checkUser</p>
	 * <p>Description: </p>
	 * @param token
	 * @return
	 * @see com.taotao.user.service.LoginService#checkUser(java.lang.String)
	 */
	@Override
	public TabResult checkUser(String token) {
		//到redis中查询用户信息
		String json = jedisClient.get(SESSION_KEY + ":" + token);
		//判断结果是否为空
		if (StringUtils.isNotBlank(json)) {
			//转换成java对象
			TbUser user = JsonUtils.jsonToPojo(json, TbUser.class);
			//重置过期时间
			jedisClient.expire(SESSION_KEY + ":" + token, SESSION_EXPIE);
			return TabResult.ok(user);
		}
		//Session已经过期
		return TabResult.build(201, "用户已经失效");
	}
	/**
	 * 用户退出
	 */
	@Override
	public TabResult signout(String token) {
		// TODO Auto-generated method stub
		//重置过期时间(为0,删除用户缓存)
		jedisClient.expire(SESSION_KEY + ":" + token, 0);
		return TabResult.ok();
	}

}
