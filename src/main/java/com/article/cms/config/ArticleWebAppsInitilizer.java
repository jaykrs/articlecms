package com.article.cms.config;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class ArticleWebAppsInitilizer implements WebApplicationInitializer {

	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(ArticleConfiguration.class);
		ServletRegistration.Dynamic sr = servletContext.addServlet("dispatcher", new DispatcherServlet(ctx));
		sr.addMapping("/");
		
		sr.setLoadOnStartup(0);
		//sr.setMultipartConfig(ctx.getBean(MultipartConfigElement.class));
	}

}
