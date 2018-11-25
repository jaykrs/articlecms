package com.article.cms.service;

import java.util.List;

import com.article.cms.exception.UserException;
import com.article.cms.model.User;

public interface UserService {

	public List<User> listUsers();
	public User getUserById(int id);
	public User getUserByUserId(String uid);
	public boolean addUser(User user) throws UserException;
	public void updateUser(User user);
	public boolean deleteUser(int id);
	public boolean activateUser(String email,String pwd);
	public User authenticateUser(String email,String pwd);
	public void resetPassword(String email);
}
