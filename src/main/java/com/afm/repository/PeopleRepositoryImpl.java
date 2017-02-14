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
	int num =0;
	public People savePeople(People people) {
		
		if(people.getIdPeople() == null){
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
		
		if(mail.getIdMail() == null){
			em.persist(mail);
			em.flush();
		}else{
			em.merge(mail);
			em.close();
		}
		return mail;
	}

	public Address saveAddress(Address address) {
		if(address.getIdAddress() == null){
			em.persist(address);
			em.flush();
		}else{
			em.merge(address);
			em.close();
		}
		return address;
	}

	public PhoneNumber savePhoneNumber(PhoneNumber phoneNumber) {
		if(phoneNumber.getIdPhoneNumber() == null){
			em.persist(phoneNumber);
			em.flush();
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
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<People> findAllPeopleByUserInSession(String name, String paginer) {
		if(paginer.equals("cero") ){num =0;}
		else if(paginer.equals("next")){num += 5;}
		else if(paginer.equals("back")){num -=  5;if(num < 0){num =0;}}
		
		Query query = em.createQuery("select u from User u  where userName= '"+ name +"' " );
		User user = (User) query.getSingleResult();
    	query = em.createQuery("select p from People p where user_id="+user.getId());
    	if(num >= query.getResultList().size()){num = query.getResultList().size() -5;if(num < 0){num = 0;}}
    	query.setFirstResult(num);
    	query.setMaxResults(5);
        List people = query.getResultList();
		
        return people;
	}


	
	

}
