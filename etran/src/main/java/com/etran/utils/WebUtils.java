package com.etran.utils;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.springframework.util.StreamUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class WebUtils {
	public static String ajaxBaiduAuto(String input) throws MalformedURLException, IOException {
		String url = "http://suggestion.baidu.com/su?wd=%s";
		url = String.format(url, URLEncoder.encode(input, "utf-8"));
		HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
		String str = CharsetUtils.ConvertToString(connection.getInputStream(), "GBK");
		str = str.substring(17, str.length() - 3);
		JSONObject json = JSONObject.parseObject(str);
		JSONArray result = json.getJSONArray("s");
		return result.toString();
	}

	public static String postUrl(String url, String body) throws Exception {

		String responseBody = null;
		URLConnection urlConnection = null;
		urlConnection = openUrlConnect(url);
		// 获取URLConnection对象对应的输出流
		urlConnection.setRequestProperty("Accept-Charset", "utf-8");
		urlConnection.setRequestProperty("accept", "*/*");
		urlConnection.setRequestProperty("connection", "Keep-Alive");
		urlConnection
				.setRequestProperty("user-agent", "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36");
		urlConnection.setRequestProperty("Pragma:", "no-cache");
		urlConnection.setRequestProperty("Cache-Control", "no-cache");
		urlConnection.setRequestProperty("Content-Type", "text/xml");
		PrintWriter out = new PrintWriter(new OutputStreamWriter(urlConnection.getOutputStream(), "utf-8"));
		// 发送请求参数
		out.write(new String(body.getBytes("UTF-8")));
		out.flush();
		// 接受报文体信息
		byte[] bytes = StreamUtils.copyToByteArray(urlConnection.getInputStream());
		if (bytes == null || bytes.length == 0) {
			System.out.println("响应内容为空");
		}
		responseBody = new String(bytes, "utf-8");
		return responseBody;

	}

	private static URLConnection openUrlConnect(String urlString) throws Exception {

		URLConnection urlConnection = null;
		try {
			URL url = new URL(urlString);
			urlConnection = url.openConnection();
			urlConnection.setConnectTimeout(600 * 1000);// 连接超时600s
			urlConnection.setReadTimeout(30 * 1000);// 读取超时30s
			urlConnection.setDoOutput(true);
			urlConnection.setDoInput(true);
			urlConnection.setUseCaches(false);
		} catch (Exception e) {
			throw new Exception("URL无法连接 " + urlString);
		}
		return urlConnection;
	}

}
