package com.ppcxy.common.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * @Author weep
 */
@Component
public class RedisUtil<K extends Serializable, T> {
	/**
	 * RedisTemplate是一个简化Redis数据访问的一个帮助类，
	 * 此类对Redis命令进行高级封装，通过此类可以调用ValueOperations和ListOperations等等方法。
	 */
	@Autowired
	private RedisTemplate<K, T> redisTemplate;
	
	/**
	 * 批量删除对应的value
	 *
	 * @param keys
	 */
	public void remove(final K... keys) {
		for (K key : keys) {
			remove(key);
		}
	}
	
	/**
	 * 批量删除key
	 *
	 * @param pattern
	 */
	public void removePattern(final K pattern) {
		Set<K> keys = redisTemplate.keys(pattern);
		if (keys.size() > 0)
			redisTemplate.delete(keys);
	}
	
	/**
	 * 删除对应的value
	 *
	 * @param key
	 */
	public void remove(final K key) {
		if (exists(key)) {
			redisTemplate.delete(key);
		}
	}
	
	/**
	 * @param key
	 * @return
	 */
	public boolean exists(final K key) {
		return redisTemplate.hasKey(key);
	}
	
	
	public List<T> getPattern(final K key) {
		List<T> result = null;
		ValueOperations<K, T> operations = redisTemplate.opsForValue();
		Set<K> keys = redisTemplate.keys(key);
		result = operations.multiGet(keys);
		return result;
	}
	
	public List<T> get(final Set<K> keys) {
		ValueOperations<K, T> operations = redisTemplate.opsForValue();
		List<T> result = operations.multiGet(keys);
		return result;
	}
	
	/**
	 * 读取缓存
	 *
	 * @param key
	 * @return
	 */
	public T get(final K key) {
		Object result = null;
		ValueOperations<K, T> operations = redisTemplate.opsForValue();
		result = operations.get(key);
		return (T) result;
	}
	
	/**
	 * @param key
	 * @param hashKey
	 * @return
	 * @Author zg
	 * @Date 2016年12月15日 上午11:28:46
	 */
	public T get(final K key, final String hashKey) {
		T result = null;
		HashOperations<K, String, T> operations = redisTemplate.opsForHash();
		result = operations.get(key, hashKey);
		return result;
	}
	
	/**
	 * 写入缓存
	 *
	 * @param key
	 * @param value
	 * @return
	 */
	public boolean set(final K key, T value) {
		boolean result = false;
		try {
			ValueOperations<K, T> operations = redisTemplate.opsForValue();
			operations.set(key, value);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * @param key
	 * @param hashKey
	 * @param value
	 * @return
	 * @Author Ron
	 */
	public boolean set(final K key, final String hashKey, T value) {
		boolean result = false;
		try {
			HashOperations<K, String, T> operations = redisTemplate.opsForHash();
			operations.put(key, hashKey, value);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 写入缓存
	 *
	 * @param key
	 * @param value
	 * @return
	 */
	public boolean set(final K key, T value, Long expireTime) {
		boolean result = false;
		try {
			ValueOperations<K, T> operations = redisTemplate.opsForValue();
			operations.set(key, value);
			redisTemplate.expire(key, expireTime, TimeUnit.SECONDS);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void convertAndSend(String topic, Object message) {
		
		redisTemplate.convertAndSend(topic, message);
	}
}
