package com.etran.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.etran.entity.User;
import com.etran.repository.UserRepository;
import com.etran.service.UserService;

@Component("userService")
public class UserServiceImpl implements UserService {
	
	
	private static Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserRepository userRepository;
	
	public User findUserByName(String name) {
		User user = userRepository.findByName(name);
		if(user==null)
		{
			log.info("根据名字没有查询到该用户信息");
		}
		return user;
	}

	public User insertUser() {
		
		User user = new User();
		user.setName("样子");
		userRepository.save(user);
		return user;
	}

}
