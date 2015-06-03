package com.etran.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.etran.entity.User;
import com.etran.service.UserService;

@RestController  
public class UserController {
	
	private static Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	
	//不加produces的话返回中文乱码
	@RequestMapping(value="/user/{name}",produces="text/html;charset=utf-8")
	@ResponseBody
	public String view(@PathVariable("name") String name,HttpServletRequest req,HttpServletResponse resp) throws UnsupportedEncodingException {
		
		//req.setCharacterEncoding("utf-8");
//		return new String("你好".getBytes(), "ISO-8859-1");
//		String newName = new String(name.getBytes("utf-8"),"ISO8859_1");
		log.info("没有重新编码之前的名字是:"+name);
//		log.info("重新编码之后的名字是:"+newName);
		
		log.info("进入到按名字查询的方法中...");
		return "welcome";
	}
	
	@RequestMapping("/user/insertUser")
	public User insert() {
		return userService.insertUser();
	}
	

}
