package com.afm.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.afm.model.Authorities;
import com.afm.model.User;

@Repository("userRepository")
public class UserRepositoryImpl implements UserRepository {

	@PersistenceContext
	private EntityManager em;

	public User saveUser(User user) {

		if(user.getId() == null){
		em.persist(user);
		em.flush();
		}
		else{
			em.merge(user);
		}
		return user;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<User> findAllUser() {
		Query query = em.createQuery("select u from User u");
		List users = query.getResultList();
		return users;

	}

	public void delete(int id) {
			Query query = em.createQuery("select u from User u where id="+id);
            User user = (User) query.getSingleResult();
			System.out.println("se quiere borrar a "+ id +" "+ user.getUserName());
			em.remove(user);
			em.close();
			System.out.println("se a borrarado "+ user.getUserName());
			
		
	}

	public User getOneUser(String userName) {
		Query query = em.createQuery("select u from User u where userName= '"+userName +"'");
        User user = (User) query.getSingleResult();
		return user;
	}

	public void saveAuthority(Authorities aut) {

		em.persist(aut);
		em.flush();
	}

	

}
