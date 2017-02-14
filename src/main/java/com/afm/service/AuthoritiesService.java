package com.afm.service;

import com.afm.model.Authorities;
import com.afm.model.User;

public interface AuthoritiesService {
	
	Authorities save( User user);
	Authorities save(Authorities auth, User user);

}
