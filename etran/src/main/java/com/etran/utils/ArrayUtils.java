package com.etran.utils;

import java.util.Arrays;
import java.util.List;

public class ArrayUtils {

	public static <T> List<T> arrayToList(T[] ts) {
		
		return Arrays.asList(ts);
		
	}

	public static <T> T[] listToArray(List<T> list) {
		return ObjectUtils.cast(list.toArray());
	}
	

}
