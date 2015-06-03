package com.etran.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Inteceptors extends HandlerInterceptorAdapter {

	private Logger logger = Logger.getLogger(this.getClass());

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		outRequest(request);

		if ("false".equals("true")) {
			response.sendRedirect(request.getContextPath());
			return false;
		}
		return true;
	}

	private void outRequest(HttpServletRequest req) {
		StringBuffer url = new StringBuffer(req.getRequestURI());
		String queryString = req.getQueryString();
		if (!StringUtils.isNull(queryString)) {
			url.append("?").append(queryString);
		}
		logger.debug("requestUrl : \t "+url.toString());
	}

}
