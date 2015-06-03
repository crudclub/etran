package com.etran.utils;

import java.util.Arrays;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class Conventer {

	public static JSONObject mapArray2Json(Map<String, String[]> map) {
		JSONObject json = new JSONObject();
		if (map == null || map.isEmpty()) {
			return json;
		}
		for (String k : map.keySet()) {
			String[] values = map.get(k);
			if (values.length < 2) {
				json.put(k, values.length == 1 ? values[0] : "");
				continue;
			}
			JSONArray array = new JSONArray();
			array.addAll(Arrays.asList(values));
			json.put(k, array);
		}
		return json;
	}

}
