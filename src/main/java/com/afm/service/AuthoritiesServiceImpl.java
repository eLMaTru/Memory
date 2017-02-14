package com.afm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.afm.model.Authorities;
import com.afm.model.User;
import com.afm.repository.AuthoritiesJpaRepository;
import com.afm.repository.AuthoritiesRepository;

@Service("authoritiesService")
public class AuthoritiesServiceImpl implements AuthoritiesService{
	
	@Autowired
	private AuthoritiesRepository authoritiesRepository;
   
	@Transactional
	public Authorities save(User user) {
	    Authorities authorities = new Authorities();    	
		authorities.setUsername(user.getUserName());
		authorities.setauthority("ROLE_USER");
		authorities.setUser(user);
		authoritiesRepository.saveauth(authorities);
		return authorities;
	}
    @Transactional
	public Authorities save(Authorities auth, User user) {
      
		auth.setUsername(user.getUserName());
        auth.setUser(user);
       authoritiesRepository.saveauth(auth);
        return auth;
	}

}
