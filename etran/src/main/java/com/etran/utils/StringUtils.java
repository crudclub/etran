package com.etran.utils;

import com.alibaba.fastjson.JSONObject;


public class StringUtils {

	public static boolean isNull(String str) {
		return isNull(str, false);
	}

	public static boolean isNull(String str, boolean isTrim) {
		return str == null || (isTrim ? str.trim().isEmpty() : str.isEmpty());
	}

	public static String defaultTableName(String className) {
		StringBuffer buffer = new StringBuffer();
		boolean isFirst = true;
		for (char c : className.toCharArray()) {
			if (isFirst) {
				buffer.append(Character.toLowerCase(c));
				isFirst = false;
				continue;
			}
			if (Character.isUpperCase(c)) {
				buffer.append('_').append(Character.toLowerCase(c));
				continue;
			}
			buffer.append(c);
		}
		return buffer.toString();
	}

	public static String htmlEsacpe(String s) {
		if (StringUtils.isNull(s))
			return s;
		s = s.replace("&", "&amp;");
		s = s.replace(" ", "&nbsp;");
		s = s.replace("\"", "&#34;");
		s = s.replace("'", "&#39;");
		s = s.replace("<", "&#60;");
		s = s.replace(">", "&#62;");
		return s;
	}

	public static JSONObject splitWith(String str, String splitStr) {
		JSONObject json = new JSONObject();

		if (StringUtils.isNull(str) || StringUtils.isNull(splitStr) || !str.contains(splitStr)) {
			return json;
		}
		String[] strs = str.split(splitStr);
		for (String s : strs) {
			if (!s.contains("=")) {
				continue;
			}
			String ss[] = s.split("=");
			if (ss.length == 1) {
				json.put(ss[0].toUpperCase(), "");
			} else {
				json.put(ss[0].toUpperCase(), ss[1]);
			}
		}
		return json;
	}


}
