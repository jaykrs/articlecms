package com.article.cms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.article.cms.dao.AbstractDao;
import com.article.cms.dao.ArticleFileDao;
import com.article.cms.model.ArticleFile;
@Repository(value = "articleFileDao")
public class ArticleFileDaoImpl extends AbstractDao<Integer, ArticleFile> implements ArticleFileDao{

	@SuppressWarnings("unchecked")
	public List<ArticleFile> listArticleFiles() {
		List<ArticleFile> list;
		list = getSession().createCriteria(ArticleFile.class).list();
				return list;
	}

	public ArticleFile getArticleFile(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void addArticleFile(ArticleFile articleFile) {
		getSession().save(articleFile);
		
	}

	public void updateArticleFile(ArticleFile articleFile) {
		// TODO Auto-generated method stub
		
	}

	public boolean deleteArticleFile(int articleFileId) {
		// TODO Auto-generated method stub
		return false;
	}

}
