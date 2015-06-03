package com.etran.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.etran.entity.User;
@Transactional
public interface  UserRepository  extends  CrudRepository <User, Long>{
	
	public User findByName(String name);
}
