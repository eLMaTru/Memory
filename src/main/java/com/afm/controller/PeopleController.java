
package com.afm.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.afm.model.Mail;
import com.afm.model.People;
import com.afm.model.PeopleReport;
import com.afm.model.PhoneNumber;
import com.afm.model.User;
import com.afm.service.PeopleService;
import com.afm.service.UserService;
import com.afm.util.JsonConverter;

@Controller
public class PeopleController {

	@Autowired
	private PeopleService peopleService;
	@Autowired
	private UserService userService;
	@SuppressWarnings("unused")
	private int var;
	private JsonConverter json = new JsonConverter();

	@RequestMapping(value = "addPeople", method = RequestMethod.GET)
	public String getPeople(@ModelAttribute("people") People people, @ModelAttribute("phone")PhoneNumber number, 
			@ModelAttribute("address")Address address, @ModelAttribute("mail")Mail mail,
			Model model, Principal pri) {
	
		
		return "addPeople";
	}
	
	@RequestMapping(value = "addPeople", method = RequestMethod.POST)
	public String savePeople(@Valid@ModelAttribute("people")People people, BindingResult result, 
			@ModelAttribute("phone")PhoneNumber phone, @ModelAttribute("address")Address address, 
			@ModelAttribute("mail")Mail mail, User user, Model model,  HttpSession session, Principal pri,
			JsonConverter json) {

		if (!result.hasErrors()) {
			
			people.setIdPeople(null);
			user = (User) session.getAttribute("userr");
			if (user == null) {
				user = userService.findOneByUsername(pri.getName());
			}
			people.setUser(user);
				peopleService.savePeople(people);
				peopleService.savePhone(phone, people);
				peopleService.saveAddress(address, people);
				peopleService.saveMail(mail, people);
			            	
			return "redirect:userView.html";

		}

		return "addPeople";
	}
	

	
	@RequestMapping(value="peopleDelete", method = RequestMethod.POST)
	public String deletePeople(HttpServletRequest res){
		Long id = Long.parseLong(res.getParameter("id"));
	       	peopleService.delete(id);
		return "redirect:userView.html";
	}

	@RequestMapping(value="/peopleUpdate", params={"id"}, method = RequestMethod.GET)
	public String getUpdatePeople(@ModelAttribute("people")People people,@RequestParam(value="id")Long id, 
			@ModelAttribute("phone")PhoneNumber phone, @ModelAttribute("address")Address address, 
			@ModelAttribute("mail")Mail mail, User user, Model model,  HttpSession session, Principal pri){
	
		people = peopleService.findOne(id);
		User us = people.getUser();
		user = (User) session.getAttribute("userr");
		if (user == null) {
			user = userService.findOneByUsername(pri.getName());
		}
		if(user.getId() != us.getId()){
			return "redirect:userView.html";
		}
		
		model.addAttribute("people", people);
		
		model.addAttribute("sizePhone", people.getPhoneNumbers().size());
		model.addAttribute("sizeAddress", people.getAddresses().size());
		model.addAttribute("sizeMail", people.getMails().size());
		
		model.addAttribute("phones", people.getPhoneNumbers());
		model.addAttribute("addresss", people.getAddresses());
		model.addAttribute("mails", people.getMails());
		
        List<String> jsonPhone = json.convertToArrayJsonString(people.getPhoneNumbers());
        model.addAttribute("jsonPhone", jsonPhone);
	
		return "peopleUpdate";
	}
	
	@RequestMapping(value="/peopleUpdate",params={"idPeople"},  method = RequestMethod.POST)
	public String updatePeople(@Valid@ModelAttribute("people")People people, BindingResult result, 
			@ModelAttribute("phone")PhoneNumber phone, @ModelAttribute("address")Address address, 
			@ModelAttribute("mail")Mail mail, User user, Model model,  HttpSession session, Principal pri, @RequestParam(value="idPeople")Long idPeople){

		if(!result.hasErrors()){
			user = (User) session.getAttribute("userr");
			if (user == null) {
				user = userService.findOneByUsername(pri.getName());
			}
			people.setUser(user);
			
			
				peopleService.savePeople(people);
				peopleService.savePhone(phone, people);
			peopleService.saveAddress(address, people);
				peopleService.saveMail(mail, people);
				return "redirect:userView.html";}
		else{
			return "peopleUpdate";
		}
	}
	
	@RequestMapping(value="/category", method = RequestMethod.GET)
	public @ResponseBody List<PeopleReport> getUsers(){
		//return userService.findAllUsers();
	return peopleService.getPeopleReport();
	}
}
