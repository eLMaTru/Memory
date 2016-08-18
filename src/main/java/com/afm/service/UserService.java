package com.afm.service;

import java.util.List;

import com.afm.model.Category;
import com.afm.model.User;

public interface UserService {
	
	User saveUser(User user)throws Exception;

	List<User> findAllUsers();
	
	void deleteUser(int id);
	
	User getOneUser(String username);


	List<Category> findAllCategory();


	void saveAuthority();
	

}
