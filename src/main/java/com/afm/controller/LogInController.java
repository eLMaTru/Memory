package com.afm.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.afm.model.Login;
import com.afm.model.User;
import com.afm.service.PeopleService;
import com.afm.service.UserService;

@Controller
@SessionAttributes(value={"user"}, types = {User.class})
public class LogInController {

	@Autowired
	private UserService userService;
	@Autowired
	private PeopleService peopleService;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String getlogIn(@ModelAttribute("login") Login login, Model model) {

		
		return "login";
	}


	@RequestMapping(value="/loginFailed", method = RequestMethod.GET)
	public String loginFailed(ModelMap model){
		model.addAttribute("error", "true");
		
		return "login";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(Model model){
		
		return "redirect:index.jsp";
		
	}
	
	@RequestMapping(value="/403", method = RequestMethod.GET)
	public String erro403(){
		return "403";
	}
	
}
