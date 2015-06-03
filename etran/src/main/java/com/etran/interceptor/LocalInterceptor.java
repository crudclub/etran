package com.etran.interceptor;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;
import com.etran.common.constants.Constants;
import com.etran.utils.Conventer;

public class LocalInterceptor extends HandlerInterceptorAdapter {

	private static Logger log = LoggerFactory.getLogger(LocalInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		log.info("进入到preHandle");
		preParams(request);
		preURL(request);
		return true;
	}

	protected void preURL(HttpServletRequest request) {
		String queryString = request.getQueryString();
		String URL = request.getRequestURL().toString();
		String fullRequestURL = URL + (StringUtils.isEmpty(queryString) ? "" : ("?" + queryString));
		log.info("request :<-- " + fullRequestURL + "--> param <-- " + request.getAttribute(Constants.JSONPARAMS));
		request.setAttribute(Constants.FULL_REQ_URL, fullRequestURL);
	}

	protected void preParams(HttpServletRequest request) throws IOException {
		if (param(request)) {
			return;
		}
		stream(request);
	}

	private boolean param(HttpServletRequest request) {
		Map<String, String[]> params = request.getParameterMap();
		if (params == null || params.isEmpty()) {
			return false;
		}
		JSONObject jsonParams = Conventer.mapArray2Json(params);
		request.setAttribute(Constants.JSONPARAMS, jsonParams);
		return true;
	}

	private void stream(HttpServletRequest request) throws IOException {
		String streamKey = "";
		JSONObject json = new JSONObject();
		BufferedReader reader = request.getReader();
		String line = null;
		StringBuffer buffer = new StringBuffer();
		while ((line = reader.readLine()) != null) {
			buffer.append(line).append(Constants.NEXTLINE);
		}
		if (StringUtils.isBlank(buffer)) {
			request.setAttribute(Constants.JSONPARAMS, json.toString());
			return;
		}
		String body = buffer.toString();
		log.info(buffer.toString());
		if (StringUtils.contains(buffer, streamKey + "=")) {
			json = JSONObject.parseObject(StringUtils.substringAfter(body, streamKey + "="));
		} else {
			json = JSONObject.parseObject(body);
		}
		request.setAttribute(Constants.JSONPARAMS, json.toString());

	}

}
