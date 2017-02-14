package com.afm.service;

import java.util.List;

import com.afm.model.Address;
import com.afm.model.Mail;
import com.afm.model.People;
import com.afm.model.PeopleReport;
import com.afm.model.PhoneNumber;
import com.afm.model.User;

public interface PeopleService {
	
	

	People savePeople(People people) ;

    People getPeople();
    
    void savePhone(PhoneNumber phoneNumber, People people);
	
	 void saveAddress(Address address, People people);
		
	 void saveMail(Mail mails, People people);
    	 
	 List<PeopleReport> getPeopleReport();

	void delete(Long id);

	List<People> findAllPeopleByUserInSession(String name, String paginer);
	
	People findOne(Long id);

}
