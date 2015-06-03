package com.etran.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class ExceptionUtil implements HandlerExceptionResolver {
	protected Logger logger = Logger.getLogger(this.getClass());

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		logger.debug(ex);
		ModelMap modelMap = new ModelMap();
		modelMap.put("e", ex.getStackTrace());
		modelMap.put("ex", ex.getClass().getName());
		modelMap.put("exMsg", ex.getMessage());
		return new ModelAndView("/common/500", modelMap);
	}

}
