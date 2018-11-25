package com.article.cms.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


public class AbstractDao<PK extends Serializable, T> {

	@SuppressWarnings("unused")
	private Class<T> presistanceClass;
	
	@SuppressWarnings("unchecked")
	public AbstractDao(){
		this.presistanceClass = 
				(Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
	}
		@Autowired
	    private SessionFactory sessionFactory;
		
		public Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
	
}
