package com.article.cms.dao.impl;

import java.util.List;


import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.article.cms.dao.AbstractDao;
import com.article.cms.dao.ArticleDao;
import com.article.cms.model.Article;

@Repository(value = "articleDao")
public class ArticleDaoImpl extends AbstractDao<Integer, Article> implements ArticleDao{

	
	@SuppressWarnings("unchecked")
	public List<Article> listArticles() {
		List<Article> list;
		list = getSession().createCriteria(Article.class).list();
				return list;
	}

	public Article getArticle(int id) {
		return (Article) getSession().createCriteria(Article.class).add(Restrictions.eq("id", new Long(id))).uniqueResult();
		
	}

	public void addArticle(Article article) {
		getSession().persist(article);
	}

	public void updateArticle(Article article) {
		getSession().saveOrUpdate(article);
	}

	public boolean deleteArticle(int id) {
		boolean t = false;
		getArticle(id);
		getSession().delete(getArticle(id)); t = true;
		return t;
	}

}
