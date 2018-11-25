package com.article.cms.dao;

import java.util.List;

import com.article.cms.model.ArticleFile;

public interface ArticleFileDao {

	public List<ArticleFile> listArticleFiles();
	public ArticleFile getArticleFile(int id);
	public void addArticleFile(ArticleFile articleFile);
	public void updateArticleFile(ArticleFile articleFile);
	public boolean deleteArticleFile(int articleFileId);
}
