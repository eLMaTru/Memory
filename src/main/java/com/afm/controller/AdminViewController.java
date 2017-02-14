package com.afm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afm.model.Comment;
import com.afm.model.User;
import com.afm.service.UserService;
import com.afm.util.JsonConverter;

@Controller
public class AdminViewController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "adminView", method = RequestMethod.GET)
	public String getAdminView(Model model) {

		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		model.addAttribute("comments", userService.findAllComment());
		return "adminView";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String getHome(Model model, HttpSession session, HttpServletRequest http) {

		return "home";
	}

	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public @ResponseBody String comment(Model model, HttpSession session, HttpServletRequest http,
			JsonConverter json) {

		String name = http.getParameter("name");
		String message = http.getParameter("message");
		userService.saveComment(name, message);
		List<Comment> comments = userService.findAllComment();
		List<String> jsonComments = json.commentToJsonArray(comments);
		return jsonComments.toString();
	}

	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	public @ResponseBody String getComment(Model model, HttpSession session, HttpServletRequest http, JsonConverter json) {
		
		List<Comment> comments = userService.findAllComment();
		List<String> jsonComments = json.commentToJsonArray(comments);
		return jsonComments.toString();
	}

	@RequestMapping(value="dComment", method = RequestMethod.POST)
	public String dComment(HttpServletRequest request){
		
		System.out.println("dcoment dcoment");
		String id = request.getParameter("id");
		userService.dComment(Long.parseLong(id));
		return "redirect:adminView.html";
	}
}
