package com.afm.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.afm.model.Comment;
import com.afm.model.User;

@Repository("userRepository")
public class UserRepositoryImpl implements UserRepository {

	@PersistenceContext
	private EntityManager em;

	public User findOneByUsername(String userName) {
		Query query = em.createQuery("select u from User u where userName= '"+userName +"'");
        User user = (User) query.getSingleResult();
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
       
		Query query = em.createQuery("select u from User u where id between 2 and 100000000");
		List<User> users = query.getResultList();
		return users;
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> findAllComment(){
		Query query = em.createQuery("select c from Comment c ");
		List<Comment> comments = query.getResultList();
		return comments;
	}

	public Comment saveComment(Comment c) {
           if(c.getId() == null){
        	   em.persist(c);
        	   em.flush();
           }else{
        	   em.merge(c);
           }
		return c;
	}

	public void dComment(Long id) {
          Query query = em.createQuery("select c from Comment c where id="+id);
          Comment c = (Comment) query.getSingleResult();
          em.remove(c);
	}

	public User findOneByEmail(String email) {
           Query query = em.createQuery("select c from User c where email='"+email+"' ");   
           User user = (User) query.getSingleResult();
		return user;
	}
	


}
