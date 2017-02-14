package com.afm.repository;

import java.util.List;

import com.afm.model.Comment;
import com.afm.model.User;

public interface UserRepository {

	User findOneByUsername(String username);
	
	List<User> findAllUsers();

	Comment saveComment(Comment c);
	
	List<Comment> findAllComment();

	void dComment(Long id);

	User findOneByEmail(String email);

}
