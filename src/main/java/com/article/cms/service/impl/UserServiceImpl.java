package com.article.cms.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.article.cms.dao.UserDao;
import com.article.cms.exception.UserException;
import com.article.cms.model.User;
import com.article.cms.service.UserService;

@Repository(value = "userService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;

	public List<User> listUsers() {
		return userDao.listUsers();
	}

	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public User getUserByUserId(String uid) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean addUser(User user) throws UserException{
	User usr = null;
		usr = userDao.getUserByUserId(user.getUserName());	
	if(null == usr) {
		userDao.addUser(user);
		return true;
	}
	else
		throw new UserException("User already exist with " +user.getUserName()) ;
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}

	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean activateUser(String userid, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	public User authenticateUser(String email, String pwd) {
		return userDao.authenticateUser(email, pwd);
	}

	public void resetPassword(String email) {
		// TODO Auto-generated method stub
		
	}
}
