package com.etran.utils;

import com.alibaba.fastjson.JSONObject;

public final class CacheUtils {
	
	private CacheUtils() {
	}

	private static JSONObject jsonCache = new JSONObject();
	
	public static Object getCacheData(String cacheKey){
		return jsonCache.get(cacheKey);
	}
	
	static void flushCache(){
		
	}
	public static JSONObject getInstance(){
		return jsonCache;
	}
}
