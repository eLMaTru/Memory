package com.afm.repository;

import java.util.List;

import com.afm.model.Address;
import com.afm.model.Mail;
import com.afm.model.People;
import com.afm.model.PeopleReport;
import com.afm.model.PhoneNumber;
import com.afm.model.User;

public interface PeopleRepository {
	
	People savePeople(People people);

	List<People> findAllPeoples();
	
	Mail saveMail(Mail mail);
	
	Address saveAddress(Address address);
	
	PhoneNumber savePhoneNumber(PhoneNumber phoneNumber);
	
	List<PeopleReport> getPeopleReport();

	void deletePeople(int id);

	List<People> findAllPeople(Long userId);

	List<User> unTroo();

	List<People> getAllPeople(String name);
}
