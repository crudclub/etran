package com.etran.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;

public class CharsetUtils extends StringHttpMessageConverter {
	private static final MediaType utf8 = new MediaType("text", "plain", Charset.forName("UTF-8"));

	@Override
	protected MediaType getDefaultContentType(String dumy) {
		return utf8;
	}

	public static String ConvertToString(InputStream inputStream, String encode) throws UnsupportedEncodingException {
		InputStreamReader inputStreamReader = new InputStreamReader(inputStream, encode);
		BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
		StringBuilder result = new StringBuilder();
		String line = null;
		try {
			while ((line = bufferedReader.readLine()) != null) {
				result.append(line + "\n");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inputStreamReader.close();
				inputStream.close();
				bufferedReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result.toString();
	}

	public static String ConvertToString(InputStream inputStream) {
		try {
			return ConvertToString(inputStream, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
