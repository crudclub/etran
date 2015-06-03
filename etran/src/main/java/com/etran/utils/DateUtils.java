package com.etran.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	public static String currentTime() {
		return currentTime(null);
	}

	public static String currentTime(String pattern) {
		try {
			return SimpleDateFormat.class.getConstructor(String.class).newInstance(StringUtils.isNull(pattern) ? "yyyy年MM月dd日 HH时mm分ss秒" : pattern)
					.format(Date.class.getConstructor(long.class).newInstance(System.currentTimeMillis()));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
