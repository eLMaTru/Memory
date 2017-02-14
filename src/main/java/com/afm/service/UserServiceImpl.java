package com.afm.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.afm.model.Category;
import com.afm.model.Comment;
import com.afm.model.User;
import com.afm.repository.UserJpaRepository;
import com.afm.repository.UserRepository;

@Service("userService")
public class UserServiceImpl implements UserService {

	private static final String DEFAULT_FILE = "img/user.png";
	@Autowired
	private UserRepository userRepository;
   @Autowired
   private UserJpaRepository userJpaRepository;
  
    
	@Transactional
	public User save(User user){
		BCryptPasswordEncoder bCry = new BCryptPasswordEncoder();
		String password = bCry.encode(user.getPassword());
		user.setPassword(password);
		user.setEnabled(true);
		user.setRutaImg(DEFAULT_FILE);
		userJpaRepository.save(user);
		
		return user;
	}
	
	

	

	@Transactional
	public void delete(int idUser) {

		userJpaRepository.delete((long) idUser);
	}


	public User findOneByUsername(String username) {
		         
	User	user = userRepository.findOneByUsername(username);
		return user;
	}

	public List<User> findAll() {
		return userJpaRepository.findAll();
	}
	
	public List<User> findAllUsers(){
		
		return userRepository.findAllUsers();
	}

	


	public User findOne(Long id) {
		return userJpaRepository.findOne(id);
	}





	public User userUpdate(User user, String username) {
        	User u = new User();
        	u = userRepository.findOneByUsername(username);
        	if(user.getPassword().equals("~0~")){
                    u.setEmail(user.getEmail());
                    u.setFullName(user.getFullName());
                    u.setUserName(user.getUserName());
        	}else{
        		BCryptPasswordEncoder bCry = new BCryptPasswordEncoder();
        		String password = bCry.encode(user.getPassword());
        		u.setPassword(password); 
        		u.setEmail(user.getEmail());
                 u.setFullName(user.getFullName());
                 u.setUserName(user.getUserName());
                 
        	}
    		userJpaRepository.save(u);
		return u;
	}




    @Transactional
	public Comment saveComment(String name, String message) {
          Comment c = new Comment();
		  c.setName(name);
		  c.setMessage(message);
          userRepository.saveComment(c);
          return c;
	}

	public List<User> findAllCategory() {
		List<Category> categories = new ArrayList<Category>();

		Category home = new Category();
		home.setCategory("HOME");
		categories.add(home);

		Category work = new Category();
		work.setCategory("WORK");
		categories.add(work);

		Category other = new Category();
		other.setCategory("OTHER");
		categories.add(other);

		return userJpaRepository.findAll();
	}





	public List<Comment> findAllComment() {
		return userRepository.findAllComment();
	}




    @Transactional
	public void dComment(Long id) {
		userRepository.dComment(id);
	}





	@SuppressWarnings("rawtypes")
	public int checkUser(User user) {
		int res =0;	
		Iterator it=	userJpaRepository.findAll().iterator();
	    while(it.hasNext()){
	    	User us = (User) it.next();
	    	
	    	if(user.getUserName().equals(us.getUserName()) && user.getEmail().equals(us.getEmail())){
	    		res = 3;
	    	}
	    	else if(user.getUserName().equals(us.getUserName()) && !user.getEmail().equals(us.getEmail())){
	    		res = 1;
	    	}
	    	else if(!user.getUserName().equals(us.getUserName()) && user.getEmail().equals(us.getEmail())){
	    		res = 2;
	    	}
	    	
	    }
	return res;
	}





	public String checkEmail(String email) {
		String result ="false";
		Iterator it = userJpaRepository.findAll().iterator();
		while(it.hasNext()){
			User user = (User) it.next();
			if(email.equalsIgnoreCase(user.getEmail() )){
				result = "true";
			}
		}
		return result;
	}





	public User findOneByEmail(String email) {
		return userRepository.findOneByEmail(email);
	}


}
