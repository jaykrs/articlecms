package com.article.cms.dao;

import java.util.List;


import com.article.cms.model.User;

public interface UserDao {

	public List<User> listUsers();
	public User getUserById(int id);
	public User getUserByUserId(String uid);
	public void addUser(User user);
	public void updateUser(User user);
	public void deleteUser(int id);
	public boolean activateUser(String email,String pwd);
	public User authenticateUser(String email,String pwd);
	
}
