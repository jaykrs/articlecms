package com.article.cms.dao.impl;

import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.article.cms.dao.AbstractDao;
import com.article.cms.dao.UserDao;
import com.article.cms.model.User;

@Repository(value = "userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao{

	Base64 base64 = new Base64();
	
	@SuppressWarnings("unchecked")
	public List<User> listUsers() {
		List<User> list;
		list = getSession().createCriteria(User.class).list();
				return list;
	}

	public User getUserById(int id) {
		return (User) getSession().createCriteria(User.class).add(Restrictions.eq("id", new Long(id))).uniqueResult();

	}

	public User getUserByUserId(String uid) {
		return (User) getSession().createCriteria(User.class).add(Restrictions.eq("userName", uid)).uniqueResult();
	}

	public void addUser(User user) {
		user.setPassword(new String(base64.encode(user.getPassword().getBytes())));
		getSession().save(user);
		
	}

	public void updateUser(User user) {
		user.setPassword(new String(base64.encode(user.getPassword().getBytes())));
		getSession().saveOrUpdate(user);
		
	}

	public void deleteUser(int id) {
		getSession().delete(getUserById(id));
	}

	public User authenticateUser(String email, String pwd) {
		User user = null;
		user = (User) getSession().createCriteria(User.class)
				.add(Restrictions.eq("email", email)).add(Restrictions.eq("password", pwd))
				.uniqueResult();
	
		return user;
	}

	public boolean activateUser(String email, String pwd) {
		User user = null;
		user = (User) getSession().createCriteria(User.class)
				.add(Restrictions.eq("email", email)).add(Restrictions.eq("password", pwd))
				.uniqueResult();
		if(null != user){
			if(!user.isActive()){
			user.setActive(true);
			getSession().saveOrUpdate(user);
			return true;
			}
		}
		return false;
	}

}
