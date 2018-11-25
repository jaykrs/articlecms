package com.article.cms.service;

import java.util.List;

import com.article.cms.model.Article;

public interface ArticleService {

	public List<Article> getAllArticle();
	
	public Article findArticleById(int id);
	
	public void addArticle(Article article);
	
	public void saveArticle(Article article);
	
	public boolean deleteArticle(int id);
	
}
