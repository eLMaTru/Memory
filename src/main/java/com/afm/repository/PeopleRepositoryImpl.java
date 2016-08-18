package com.afm.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.afm.model.Address;
import com.afm.model.Mail;
import com.afm.model.People;
import com.afm.model.PeopleReport;
import com.afm.model.PhoneNumber;
import com.afm.model.User;

@Repository("peopleRepository")
public class PeopleRepositoryImpl implements PeopleRepository {

	@PersistenceContext
	private EntityManager em;
	
	public People savePeople(People people) {
		
		if(people.getId() == null){
			em.persist(people);
			em.flush();
		}else{
			em.merge(people);
		}
		em.close();
			return people;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<People> findAllPeople(Long userId) {

		Query query = em.createQuery("select p from People p where user_id="+userId);
		List people = query.getResultList();
		
		return people;
	}

	public Mail saveMail(Mail mail) {
		if(mail.getId() == null){
			em.persist(mail);
		}else{
			em.merge(mail);
			em.close();
		}
		return mail;
	}

	public Address saveAddress(Address address) {
		if(address.getId() == null){
			em.persist(address);
		}else{
			em.merge(address);
			em.close();
		}
		return address;
	}

	public PhoneNumber savePhoneNumber(PhoneNumber phoneNumber) {
		if(phoneNumber.getId() == null){
			em.persist(phoneNumber);
		}else{
			em.merge(phoneNumber);
			em.close();
		}
		return phoneNumber;
	}

	@SuppressWarnings("unchecked")
	public List<PeopleReport> getPeopleReport() {
		
		Query query = em.createQuery("select new com.afm.model.PeopleReport(p.id, p.name, p.lastName, p.age, pn.category, pn.number, a.category, a.street, a.city, a.state, m.category, m.email)"+
		"from People p, PhoneNumber pn, Address a, Mail m where p.id = pn.people.id and p.id = a.people.id and p.id = m.people.id");
		return query.getResultList();
	}

	public void deletePeople(int id) {

		Query query = em.createQuery("select p from People p where id="+id);
		People people = (People) query.getSingleResult();
		em.remove(people);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<People> findAllPeoples() {
		Query query = em.createQuery("select p from People p");
		List people = query.getResultList();
		return people;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<User> unTroo() {
		Query query = em.createQuery("select u from User u ");
		List users = query.getResultList();
		return users;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<People> getAllPeople(String name) {
	
		Query query = em.createQuery("select u from User u where userName= '"+name +"'" );
		User user = (User) query.getSingleResult();
    	query = em.createQuery("select p from People p where user_id="+user.getId());
        List people = query.getResultList();
		
        return people;
	}
	
	

}
