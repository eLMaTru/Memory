package com.afm.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.afm.model.Address;
import com.afm.model.Mail;
import com.afm.model.People;
import com.afm.model.PeopleReport;
import com.afm.model.PhoneNumber;
import com.afm.repository.PeopleJpaRepository;
import com.afm.repository.PeopleRepository;

@Service("peopleService")
public class PeopleServiceImpl implements PeopleService {

	private static final String DEFAULT_FILE1 = "img/avatar-hombre.png";
	private static final String DEFAULT_FILE2 = "img/avatar-mujer1.png";

	@Autowired
	private PeopleRepository peopleRepository;
	@Autowired
	private PeopleJpaRepository peopleJpaRepository;
	@Autowired
	private People people;
	@SuppressWarnings("rawtypes")
	private Iterator it;

	public People getPeople() {
		return people;
	}

	@Transactional
	public People savePeople(People people) {
        if(people.getGender().equals("M")){
		people.setRutaImg(DEFAULT_FILE1);
        }else{
        	people.setRutaImg(DEFAULT_FILE2);
        }
		peopleJpaRepository.save(people);

		return people;
	}

	@Transactional
	public void savePhone(PhoneNumber phone, People people) {
		List<PhoneNumber> phoneList = new ArrayList<PhoneNumber>();
		if (phone.getIdp() == null) {
			StringTokenizer token = new StringTokenizer(phone.getNumber());
			StringTokenizer token2 = new StringTokenizer(phone.getCategoryPh());

			while (token.hasMoreTokens()) {
				PhoneNumber p = new PhoneNumber();
				p.setNumber(token.nextToken(","));
				p.setCategoryPh(token2.nextToken(","));
				phoneList.add(p);
			}
		} else {
			StringTokenizer token = new StringTokenizer(phone.getNumber());
			StringTokenizer token2 = new StringTokenizer(phone.getCategoryPh());
			StringTokenizer token3 = new StringTokenizer(phone.getIdp());

			while (token.hasMoreTokens()) {
				PhoneNumber p = new PhoneNumber();
				if (token3.hasMoreTokens() == true) {
					p.setNumber(token.nextToken(","));
					p.setCategoryPh(token2.nextToken(","));
					p.setIdPhoneNumber(Long.valueOf(token3.nextToken(",")));

				} else {
					p.setNumber(token.nextToken(","));
					p.setCategoryPh(token2.nextToken(","));
				}
				phoneList.add(p);
			}
		}

		it = phoneList.iterator();
		while (it.hasNext()) {
			PhoneNumber phoneNumber = (PhoneNumber) it.next();
			phoneNumber.setPeople(people);
			peopleRepository.savePhoneNumber(phoneNumber);
		}
	}

	@Transactional
	public void saveAddress(Address address, People people) {
		List<Address> addressList = new ArrayList<Address>();
		if(address.getIda() == null){
		StringTokenizer token = new StringTokenizer(address.getStreet());
		StringTokenizer token2 = new StringTokenizer(address.getCity());
		StringTokenizer token3 = new StringTokenizer(address.getState());
		StringTokenizer token4 = new StringTokenizer(address.getCategoryA());
		
		while (token.hasMoreTokens()) {
			Address a = new Address();
			a.setStreet(token.nextToken(","));
			a.setCity(token2.nextToken(","));
			a.setState(token3.nextToken(","));
			a.setCategoryA(token4.nextToken(","));
			addressList.add(a);
		}
		}
		else{
			StringTokenizer token = new StringTokenizer(address.getStreet());
			StringTokenizer token2 = new StringTokenizer(address.getCity());
			StringTokenizer token3 = new StringTokenizer(address.getState());
			StringTokenizer token4 = new StringTokenizer(address.getCategoryA());
			StringTokenizer token5 = new StringTokenizer(address.getIda());

			while (token.hasMoreTokens()) {
				Address a = new Address();
				if(token5.hasMoreTokens() == true){
					a.setStreet(token.nextToken(","));
					a.setCity(token2.nextToken(","));
					a.setState(token3.nextToken(","));
					a.setCategoryA(token4.nextToken(","));
					a.setIdAddress(Long.valueOf(token5.nextToken(",")));
				}
				else{
					a.setStreet(token.nextToken(","));
					a.setCity(token2.nextToken(","));
					a.setState(token3.nextToken(","));
					a.setCategoryA(token4.nextToken(","));
				}
				addressList.add(a);
			}	
			}
		it = addressList.iterator();
		while (it.hasNext()) {
			Address addresss = (Address) it.next();
			addresss.setPeople(people);
			peopleRepository.saveAddress(addresss);
		}
	}

	@Transactional
	public void saveMail(Mail mail, People people) {
		List<Mail> mailList = new ArrayList<Mail>();
		if(mail.getIdm() == null){
		StringTokenizer token = new StringTokenizer(mail.getEmail());
		StringTokenizer token2 = new StringTokenizer(mail.getCategoryM());

		while (token.hasMoreTokens()) {
			Mail m = new Mail();
			m.setEmail(token.nextToken(","));
			m.setCategoryM(token2.nextToken(","));
			mailList.add(m);
		}
		}
		else{
			StringTokenizer token = new StringTokenizer(mail.getEmail());
			StringTokenizer token2 = new StringTokenizer(mail.getCategoryM());
			StringTokenizer token3 = new StringTokenizer(mail.getIdm());

			while (token.hasMoreTokens()) {
				Mail m = new Mail();
				if(token3.hasMoreTokens() == true){
				m.setEmail(token.nextToken(","));
				m.setCategoryM(token2.nextToken(","));
				m.setIdMail(Long.valueOf(token3.nextToken(",")));
				}
				else{
					m.setEmail(token.nextToken(","));
					m.setCategoryM(token2.nextToken(","));
				}
				mailList.add(m);
			}	
		}

		it = mailList.iterator();
		while (it.hasNext()) {
			Mail mails = (Mail) it.next();
			mails.setPeople(people);
			peopleRepository.saveMail(mails);
		}
	}

	public List<PeopleReport> getPeopleReport() {
		return peopleRepository.getPeopleReport();
	}

	@Transactional
	public void delete(Long id) {
		peopleJpaRepository.delete(id);
	
	}

	public List<People> findAllPeopleByUserInSession(String username, String paginer) {

		return peopleRepository.findAllPeopleByUserInSession(username, paginer);
	}

	public People findOne(Long id) {
		return peopleJpaRepository.findOne(id);
	}

}// cierre clase