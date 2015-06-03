package com.etran.utils;

import java.util.Random;

public class RandomUtils {
	private static Random r = new Random();

	public static String randomWithLength(int length) {
		StringBuffer buffer = new StringBuffer();
		while (buffer.length() < length) {
			buffer.append(r.nextInt(10));
		}
		return buffer.toString();
	}

	public static int nextInt(int i) {
		return r.nextInt(i);
	}

	
}
