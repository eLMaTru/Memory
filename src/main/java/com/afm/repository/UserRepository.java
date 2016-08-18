package com.afm.repository;

import java.util.List;

import com.afm.model.Authorities;
import com.afm.model.User;

public interface UserRepository {
	
	User saveUser(User user);
	
	List<User> findAllUser();
	
	void delete(int  id);

	

	User getOneUser(String username);

	void saveAuthority(Authorities aut);

}
