package com.article.cms.service;

import java.util.List;

import com.article.cms.model.ArticleFile;

public interface ArticleFileService {

	public List<ArticleFile> getAllArticleFiles();
	
	public ArticleFile findArticleFileById(int articleFileId);
	
	public void addArticleFile(ArticleFile articleFile);
	
	public void saveArticleFile(ArticleFile articleFile);
	
	public boolean deleteArticleFile(int articleFileId);
	
}
