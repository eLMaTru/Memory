
package com.afm.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.afm.model.Authorities;
import com.afm.model.User;
import com.afm.service.AuthoritiesService;
import com.afm.service.PeopleService;
import com.afm.service.UserService;
import com.afm.util.MailSend;

@Controller
@SessionAttributes("userr")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private AuthoritiesService authoritiesService;
	@Autowired
	private PeopleService peopleService;
	@Autowired
	JavaMailSender mailSender;
	
	
	@RequestMapping(value = "hello", method = RequestMethod.GET)
	public String hello() {

		return "hello";
	}
	
	@RequestMapping(value = "signIn", method = RequestMethod.GET)
	public String signIn(@ModelAttribute("user") User user) {

		return "signIn";
	}

	@RequestMapping(value = "signIn", method = RequestMethod.POST)
	public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, MailSend mail) {

		if (!result.hasErrors()) {
		int res =	userService.checkUser(user);
		if(res == 1 || res == 2 || res == 3){
           model.addAttribute("res", res);
           return "signIn";
		}
			userService.save(user);
			authoritiesService.save(user);

			mail.sendMail(mailSender, user.getEmail());
            model.addAttribute("modal", 1);
            model.addAttribute("name", user.getFullName());
            model.addAttribute("email", user.getEmail());
			return "home";
		} else {
			int res =	userService.checkUser(user);
			if(res == 1 || res == 2 || res == 3){
	           model.addAttribute("res", res);
			}
			return "signIn";
		}

	}

	@RequestMapping(value = "userUpdate", params = { "id" }, method = RequestMethod.GET)
	public String updateUser(@RequestParam(value = "id") Long id, @ModelAttribute("user") User user, Model model,
			Principal pri, @ModelAttribute("authorities") Authorities auth) {

		user = userService.findOne(id);
		auth = user.getAuthorities().get(0);
		user.setPassword(null);
		model.addAttribute("user", user);
		model.addAttribute("authorities", auth);
		model.addAttribute("id", id);

		return "userUpdate";
	}

	@RequestMapping(value = "userUpdate", params = { "id" }, method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("user") User user, BindingResult result,
			@RequestParam(value = "id") Long id, Model model, @ModelAttribute("authorities") Authorities auth) {
System.out.println(auth.getauthority() + " "+ id+ " "+ user.getId());
		if (result.hasErrors()) {
			return "userUpdate";
		} else {

		User u	= userService.findOne(id);
		 userService.userUpdate(user, u.getUserName());
			Authorities aut = u.getAuthorities().get(0);
			aut.setauthority(auth.getauthority());
			authoritiesService.save(aut, user);

			return "redirect:adminView.html";
		}
	}

	@RequestMapping(value = "userDelete", params = { "id" }, method = RequestMethod.GET)
	public String deleteUser(@RequestParam(value = "id") int id, Model model) {

		if (id == 0) {

			return "redirect:adminView.html";
		}
		userService.delete(id);
		return "redirect:adminView.html";
	}

	@RequestMapping(value = "userView", method = RequestMethod.GET)
	public String getUserView(Model model, Principal pri, User userr, HttpSession session) {
		userr = (User) session.getAttribute("userr");
		if (userr == null) {
			userr = userService.findOneByUsername(pri.getName());
		}
		model.addAttribute("name", userr.getFullName());
		model.addAttribute("people", peopleService.findAllPeopleByUserInSession(userr.getUserName(), "cero"));
		model.addAttribute("userr", userr);
		return "userView";
	}

	@RequestMapping(value = "/pagination", method = RequestMethod.GET)
	public String paginationPeople(Model model, Principal pri, User user, @RequestParam("paginer") String paginer,
			HttpSession session) {

		user = (User) session.getAttribute("userr");
		if (user == null) {
			user = userService.findOneByUsername(pri.getName());
		}
		model.addAttribute("name", user.getFullName());
		model.addAttribute("people", peopleService.findAllPeopleByUserInSession(user.getUserName(), paginer));
		model.addAttribute("userr", user);
		return "userView";
	}

	@RequestMapping(value = "/savedPeople", method = RequestMethod.GET)
	public String getSavePeople(Model model, Principal pri) {

		model.addAttribute("people", peopleService.findAllPeopleByUserInSession(pri.getName(), "cero"));
		model.addAttribute("peopleReport", peopleService.getPeopleReport());
		return "savedPeople";
	}

	@RequestMapping(value = "/useredit", method = RequestMethod.GET)
	public String getUserEdit(@ModelAttribute("user") User user, Principal pri, Model model, HttpSession session, MailSend m) {
         
		User u = (User) session.getAttribute("userr");
		if (u == null) {
			u = userService.findOneByUsername(pri.getName());
		}
		if(m.isNumeric(u.getUserName()) == true){
			model.addAttribute("isNumeric", 1);
		}
		user.setPassword(null);
		model.addAttribute("user", u);
		model.addAttribute("password", 2);
		return "useredit";
	}

	@RequestMapping(value = "/useredit", method = RequestMethod.POST)
	public String postUserEdit(@Valid @ModelAttribute("user") User user, BindingResult result, Principal pri,
			Authorities auth, User u, Model model, HttpSession session, MailSend m) {

		u = (User) session.getAttribute("userr");
		if (u == null) {
			u = userService.findOneByUsername(pri.getName());
		}
		
		if (result.hasErrors()) {
			if(user.getPassword() == null){
			model.addAttribute("password", 1);
			}
			else if(m.isNumeric(u.getUserName()) == true){
				model.addAttribute("isNumeric", 1);
				}
			return "useredit";
		} else {
		
			u = userService.userUpdate(user, u.getUserName());
			user.setId(u.getId());
			auth = u.getAuthorities().get(0);
			authoritiesService.save(auth, user);
			model.addAttribute("userr", u);
			model.addAttribute("name", u.getFullName());
			model.addAttribute("people", peopleService.findAllPeopleByUserInSession(u.getUserName(), "cero"));
			return "userView";
		}

	}
	
	@RequestMapping(value ="/forgot", method = RequestMethod.POST)
	public @ResponseBody String forgot(HttpServletRequest res, MailSend mail){
		
		 String email = res.getParameter("email");
		 String result = userService.checkEmail(email);
		 if(result.equals("true")){
	         		 mail.sendMailforgot(mailSender, email);
		 }
		return result;
	}
	
	@SuppressWarnings("static-access")
	@RequestMapping(value ="/get-new-password", method = RequestMethod.GET)
	public String getpassword(Model model, @RequestParam("WMW")String eemail, MailSend mail) throws Exception{

		String email = mail.Desencriptar(eemail.replace(" ", "+"));
		email = email.substring(6, email.length());
		String x = userService.checkEmail(email);
		if(x.equals("true")){
			model.addAttribute("email", email);
			model.addAttribute("getpassword", 1);
		return "home";
		}
		return "home";
	}
	
	@RequestMapping(value ="/get-new-password", method = RequestMethod.POST)
	public @ResponseBody String getpasswordpost(HttpServletRequest res, User user){
		
        String email = res.getParameter("email");
        String password = res.getParameter("password");	
        user = userService.findOneByEmail(email);
        user.setPassword(password);
        userService.save(user);
		return "true";
	}
	
	@RequestMapping(value ="/fblogin", method = RequestMethod.POST)
	public @ResponseBody String fbLogin(User user, HttpServletRequest request, Model model){
		
		String cv = "$#$#"+request.getParameter("cv")+"$#$#";
		user.setFullName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setUserName(request.getParameter("nick"));
		user.setPassword(cv);
		if(userService.checkUser(user) == 0){
			userService.save(user);	
			authoritiesService.save(user);
		}
		String data = "{\"nick\":\""+user.getUserName()+"\",\"cv\":\""+ cv +"\"}";
		return data;
	}
	
}
