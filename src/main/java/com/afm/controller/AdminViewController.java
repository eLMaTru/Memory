package com.afm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.afm.model.User;
import com.afm.service.UserService;

@Controller
public class AdminViewController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "adminView", method = RequestMethod.GET)
	public String getAdminView(Model model) {

		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		return "adminView";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String getHome(Model model) {

		return "home";
	}
	

}
