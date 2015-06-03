package com.etran.service;

import com.etran.entity.User;

public interface UserService {

	public User findUserByName(String name) ;
	
	public User insertUser();
}
