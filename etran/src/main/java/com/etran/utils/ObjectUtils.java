package com.etran.utils;

public class ObjectUtils {
	/**
	 * 强制类型转化，主要用于消除warning
	 * 
	 * @param obj
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T cast(Object obj) {
		return (T) obj;
	}

}
