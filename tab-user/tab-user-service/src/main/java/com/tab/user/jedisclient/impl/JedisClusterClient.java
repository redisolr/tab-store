package com.tab.user.jedisclient.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.tab.user.jedisclient.JedisClient;

import redis.clients.jedis.JedisCluster;

public class JedisClusterClient implements JedisClient {

	@Autowired
	private JedisCluster jedisCluster;
	
	@Override
	public String set(String key, String value) {
		String string = jedisCluster.set(key, value);
		return string;
	}

	@Override
	public String get(String key) {
		return jedisCluster.get(key);
	}

	@Override
	public Long hset(String key, String item, String value) {
		return jedisCluster.hset(key, item, value);
	}

	@Override
	public String hget(String key, String item) {
		return jedisCluster.hget(key, item);
	}

	@Override
	public Long incr(String key) {
		return jedisCluster.incr(key);
	}

	@Override
	public Long decr(String key) {
		return jedisCluster.decr(key);
	}

	@Override
	public Long expire(String key, int second) {
		return jedisCluster.expire(key, second);
	}

	@Override
	public Long ttl(String key) {
		return jedisCluster.ttl(key);
	}

	@Override
	public Long hdel(String key, String item) {
		return jedisCluster.hdel(key, item);
	}

}
