package com.afm.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.afm.model.User;
import com.afm.service.PeopleService;
import com.afm.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private PeopleService peopleService;

	@RequestMapping(value = "signIn", method = RequestMethod.GET)
	public String signIn(@ModelAttribute("user") User user) {

		return "signIn";
	}

	@RequestMapping(value = "signIn", method = RequestMethod.POST)
	public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result) {

		if (!result.hasErrors()) {
				if(user.getImg().isEmpty() == false){
				try {
					userService.saveUser(user);
				} catch (Exception e) {
					e.printStackTrace();
					return "No se ha podido grabar el fichero";
				}
				}
				else{
					try {
						userService.saveUser(user);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				userService.saveAuthority();
			return "redirect:index.jsp";
		}
		else {

			return "signIn";
		}

	}

	@RequestMapping(value = "userUpdate", params = { "id" }, method = RequestMethod.GET)
	public String updateUser(@RequestParam(value = "id") int id, @ModelAttribute("user") User user, Model model) {

		model.addAttribute("id", id);

		return "userUpdate";
	}

	@RequestMapping(value = "userUpdate", params = { "id" }, method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("user") User user, BindingResult result,
			@RequestParam(value = "id") int id, Model model) {

		if (result.hasErrors()) {
			System.out.println(result.hasErrors());
			return "userUpdate";
		} else {

			try {
				user.setId((long) id);
				userService.saveUser(user);
			} catch (Exception e) {
				e.printStackTrace();
				return "No se ha podido grabar el fichero";
			}
		}
		return "redirect:adminView.html";
	}

	@RequestMapping(value = "userDelete", params = { "id" }, method = RequestMethod.GET)
	public String deleteUser(@RequestParam(value = "id") int id, Model model) {

		if (id == 0) {

			return "redirect:adminView.html";
		}
		userService.deleteUser(id);
		return "redirect:adminView.html";
	}

	@RequestMapping(value = "userView", method = RequestMethod.GET)
	public String getUserView(Model model, Principal pri) {
		  
		return "userView";
	}
	
	@RequestMapping(value = "/savedPeople", method = RequestMethod.GET)
	public String getSavePeople(Model model, Principal pri) {
		  
		model.addAttribute("people", peopleService.getAllPeople(pri.getName()));
		model.addAttribute("peopleReport", peopleService.getPeopleReport());
		return "savedPeople";
	}
	

}
