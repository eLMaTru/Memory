package com.afm.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.afm.model.Authorities;
@Repository("authoritiesRepository")
public class AuthoritiesRepositoryImpl implements AuthoritiesRepository {
	
	@PersistenceContext
	EntityManager em;
	
	public Authorities saveauth(Authorities auth){
		if(auth.getId() == null){
			em.persist(auth);
			em.flush();
		}else{
			em.merge(auth);
		}
		
		return auth;
	}

}
