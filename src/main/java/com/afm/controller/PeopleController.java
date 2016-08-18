
package com.afm.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afm.model.Address;
import com.afm.model.Category;
import com.afm.model.Mail;
import com.afm.model.People;
import com.afm.model.PhoneNumber;
import com.afm.model.User;
import com.afm.service.PeopleService;
import com.afm.service.UserService;

@Controller
public class PeopleController {

	@Autowired
	private PeopleService peopleService;
	@Autowired
	private UserService userService;
	@SuppressWarnings("unused")
	private int var;

	@RequestMapping(value = "addPeople", method = RequestMethod.GET)
	public String getPeople(@ModelAttribute("people") People people, @ModelAttribute("phone")PhoneNumber number, 
			@ModelAttribute("address")Address address, @ModelAttribute("mail")Mail mail,
			Model model, Principal pri) {
	
		
		return "addPeople";
	}
	
	@RequestMapping(value = "addPeople", method = RequestMethod.POST)
	public String savePeople(@Valid@ModelAttribute("people")People people, BindingResult result, 
			@ModelAttribute("phone")PhoneNumber phone, @ModelAttribute("address")Address address, 
			@ModelAttribute("mail")Mail mail, User user, Model model,  HttpSession session, Principal pri) {
System.out.println(phone.getNumber() + phone.getCategory() );
		if (!result.hasErrors()) {
			
			if(people.getImg().isEmpty() == false){
			people.setId(null);
			user = userService.getOneUser(pri.getName());
			people.setUser(user);
			try {
				peopleService.savePeople(people);
				peopleService.savePhoneNumber(phone);
				peopleService.saveAddress(address);
				peopleService.saveMail(mail);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			}
			else{
				user = userService.getOneUser(pri.getName());
				people.setUser(user);
				people.setId(null);
				try {
					peopleService.savePeople(people);
					peopleService.savePhoneNumber(phone);
					peopleService.saveAddress(address);
					peopleService.saveMail(mail);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			            	
			return "redirect:userView.html";

		}

		return "addPeople";
	}
	

	
	@RequestMapping(value="peopleDelete", params={"id"}, method = RequestMethod.GET)
	public String deletePeople(@RequestParam(value="id")int id){
	       	peopleService.deletePeople(id);
		return "redirect:userView.html";
	}

	@RequestMapping(value="/peopleUpdate", params={"id"}, method = RequestMethod.GET)
	public String getUpdatePeople(@ModelAttribute("people")People people,@RequestParam(value="id")int id, Model model){
		model.addAttribute("id", id);
		System.out.println(id + " get people update");
		return "peopleUpdate";
	}
	
	@RequestMapping(value="/peopleUpdate",  method = RequestMethod.POST)
	public String updatePeople(@Valid@ModelAttribute("people")People people, BindingResult result,  Model model, HttpSession session,
			Principal pri, User user, @RequestParam(value="id")Long id){
	     
		if(!result.hasErrors()){
		if(people.getImg().isEmpty() == false){
			user = userService.getOneUser(pri.getName());
			people.setUser(user);
			try {
				peopleService.savePeople(people);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			}
			else{
				user = userService.getOneUser(pri.getName());
				people.setUser(user);
				try {
					peopleService.savePeople(people);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	    System.out.println("aqui es el bobo: " + user.getId() + people.getId() );
		return "redirect:savedPeople.html";}
		else{
			return "peopleUpdate";
		}
	}
	
	@RequestMapping(value="/category", method = RequestMethod.GET)
	public @ResponseBody List<Category> getUsers(){
		
		return userService.findAllCategory();
	}
}
