package com.afm.service;

import java.util.List;

import com.afm.model.Address;
import com.afm.model.Mail;
import com.afm.model.People;
import com.afm.model.PeopleReport;
import com.afm.model.PhoneNumber;
import com.afm.model.User;

public interface PeopleService {
	
	void saveFullPeople(PhoneNumber phone, Address address, Mail mail);
	
	List<User> unTroo();

	People savePeople(People people) throws Exception;


    People getPeople();
    
    People getLastPeopleSaved();
    
   
    
    
    
    
    
    void savePhoneNumber(PhoneNumber phoneNumber);
	
	 void saveAddress(Address address);
		
	 void saveMail(Mail mails);
    	 
	 List<PeopleReport> getPeopleReport();

	void deletePeople(int id);


	List<People> getAllPeople(String name);
}
