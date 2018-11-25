package com.article.cms.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.article.cms.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping (value = {"/listalluser"}, method = RequestMethod.GET)
	public ModelAndView findAllUser(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		if(null != session.getAttribute("user")){
			mv.addObject("listUsers", userService.listUsers());
			mv.setViewName("user");
		}
		return mv;
	}
}
