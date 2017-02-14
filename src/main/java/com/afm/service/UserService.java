package com.afm.service;

import java.util.List;

import com.afm.model.Comment;
import com.afm.model.User;

public interface UserService {
	
	User save(User user);

	List<User> findAll();
	
	void delete(int id);
	
	User findOneByUsername(String username);
User findOne(Long id);

	List<User> findAllCategory();

	List<User> findAllUsers();
	
	User userUpdate(User user, String username);

	Comment saveComment(String name, String message);
	
	List<Comment> findAllComment();

	void dComment(Long id);

	int checkUser(User user);

	String checkEmail(String email);

	User findOneByEmail(String email);
	
}
