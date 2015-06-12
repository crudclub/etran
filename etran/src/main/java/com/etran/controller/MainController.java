package com.etran.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.etran.entity.TransBill;
import com.etran.entity.User;
import com.etran.service.TransBillService;
import com.etran.service.UserService;

@Controller
public class MainController {
	
	private static Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TransBillService transBillService;
	
	//不加produces的话返回中文乱码
	@RequestMapping("/user/main")
	public String view(HttpServletRequest req,HttpServletResponse resp) throws UnsupportedEncodingException {
		
		//req.setCharacterEncoding("utf-8");
//		return new String("你好".getBytes(), "ISO-8859-1");
//		String newName = new String(name.getBytes("utf-8"),"ISO8859_1");
//		log.info("没有重新编码之前的名字是:"+name);
//		log.info("重新编码之后的名字是:"+newName);
		
		log.info("进入到按名字查询的方法中...");
		return "/main/main";
	}
	
	@RequestMapping("/user/insertUser")
	public User insert() {
		return userService.insertUser();
	}
	
	//跳转到运单录入
	@RequestMapping("/addBill")
	public String addBill() {
		return "/main/addBill";
	}
	
	//跳转到运单录入
	@RequestMapping("/bill")
	public String turnBill() {
		return "/main/bill";
	}
	
	
	//跳转到登录页面
	@RequestMapping("/login")
	public String login() {
		return "/before/login";
	}
}
