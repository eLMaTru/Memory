package com.afm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.afm.model.User;

@Controller
@SessionAttributes(value={"user"}, types = {User.class})
public class LogInController {

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String getlogIn() {

		return "login";
	}


	@RequestMapping(value="/loginFailed", method = RequestMethod.GET)
	public String loginFailed(ModelMap model){
		model.addAttribute("error", "true");
		model.addAttribute("modalValue", 1);
		return "home";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(Model model){
		
		return "redirect:home.html";
		
	}
	
	@RequestMapping(value="/403", method = RequestMethod.GET)
	public String erro403(){
		return "403";
	}
	String path ="error";
	@RequestMapping(value="/404", method = RequestMethod.GET)
	public String erro404(Model model){
		model.addAttribute("error", "erroreeeeeeeeeeeeee");
		return "/404";
	}
	
}
