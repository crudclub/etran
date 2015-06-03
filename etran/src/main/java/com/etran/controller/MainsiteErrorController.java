package com.etran.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;



@Controller
public class MainsiteErrorController implements ErrorController,HandlerExceptionResolver{

	private static Logger log = LoggerFactory.getLogger(MainsiteErrorController.class);
	
	private static final String ERROR_PATH = "/error";
	 
	 @RequestMapping(value=ERROR_PATH)
	    public String handleError(){
	        return "common/404";
	    }
	 
	 public String getErrorPath() {
	  return ERROR_PATH;
	 }

	 @Override
		public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
			log.info("异常堆栈信息:"+ex.getStackTrace());
			log.info("出错了:"+ex.getMessage());
			ex.printStackTrace();
			ModelMap modelMap = new ModelMap();
			int status = HttpStatus.INTERNAL_SERVER_ERROR.value();
			modelMap.put("s", status);
			modelMap.put("sr", HttpStatus.valueOf(status).getReasonPhrase());
			modelMap.put("e", ex.getStackTrace());
			modelMap.put("ex", ex.getClass().getName());
			modelMap.put("exMsg", ex.getMessage());
			return new ModelAndView("/common/500", modelMap);
		}


		@RequestMapping(value = "${error.path:/error}", produces = "text/html")
		public String error(Model model, HttpServletRequest request, HttpServletResponse response) {
			model.addAttribute("s", response.getStatus());
			model.addAttribute("sr", HttpStatus.valueOf(response.getStatus()).getReasonPhrase());
			return "/common/error";
		}

		@RequestMapping(value = "${error.path:/error}", produces = "application/json")
		@ResponseBody
		public String ajaxError(HttpServletRequest request, HttpServletResponse response) {
			JSONObject json = new JSONObject();
			json.put("status", response.getStatus());
			return json.toString();
		}

	 
}
