package com.afm.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.afm.model.Address;
import com.afm.model.Mail;
import com.afm.model.People;
import com.afm.model.PeopleReport;
import com.afm.model.PhoneNumber;
import com.afm.model.User;
import com.afm.repository.PeopleRepository;

@Service("peopleService")
public class PeopleServiceImpl implements PeopleService {
	
	private static final String FILE_lOCATION = "/home/anderson/workspace/Memory/src/main/webapp/img/";
	private static final String DEFAULT_FILE = "/home/anderson/workspace/Memory/src/main/webapp/img/user.png";

	@Autowired
	private PeopleRepository peopleRepository;
	@Autowired
	private People people;
	@SuppressWarnings("rawtypes")
	private Iterator it;

	public People holdPeople(People people) {
		this.people = people;
		return people;
	}

	public People getPeople() {
		return people;
	}


	@Transactional
	public People savePeople(People people) throws Exception {
		
		if(people.getImg().isEmpty() == false){
			CommonsMultipartFile uploaded = people.getImg();
			File localFile = new File(FILE_lOCATION + uploaded.getOriginalFilename());
			FileOutputStream os = null;
			try {

				os = new FileOutputStream(localFile);
				os.write(uploaded.getBytes());

			} finally {
				if (os != null) {
					try {
						os.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			people.setImg(null);
			people.setRutaImg(FILE_lOCATION + uploaded.getOriginalFilename());
			peopleRepository.savePeople(people);
		}else{
			people.setImg(null);
			people.setRutaImg(DEFAULT_FILE);
			peopleRepository.savePeople(people);
		}

		return people;
	}
	

	

	@Transactional
	public void savePhoneNumber(PhoneNumber phone) {
		
List<PhoneNumber> phoneList = new ArrayList<PhoneNumber>();
			StringTokenizer token = new StringTokenizer(phone.getNumber());
			StringTokenizer token2 = new StringTokenizer(phone.getCategory());
			
			while (token.hasMoreTokens()) {
				PhoneNumber p = new PhoneNumber();
				p.setNumber(token.nextToken(","));
				p.setCategory(token2.nextToken(","));
				phoneList.add(p);
			}
		 
		it = phoneList.iterator();
		while (it.hasNext()) {
			PhoneNumber phoneNumber = (PhoneNumber) it.next();
			phoneNumber.setPeople(getLastPeopleSaved());
			peopleRepository.savePhoneNumber(phoneNumber);
		}
	}

	@Transactional
	public void saveAddress(Address address) {
		
List<Address> addressList = new ArrayList<Address>();
			StringTokenizer token = new StringTokenizer(address.getStreet());
			StringTokenizer token2 = new StringTokenizer(address.getCity());
			StringTokenizer token3 = new StringTokenizer(address.getState());
			StringTokenizer token4 = new StringTokenizer(address.getCategory());
			
			while (token.hasMoreTokens()) {
				Address a = new Address();
				a.setStreet(token.nextToken(","));
				a.setCity(token2.nextToken(","));
				a.setState(token3.nextToken(","));
				a.setCategory(token4.nextToken(","));
				addressList.add(a);
			}
		 
		it = addressList.iterator();
		while (it.hasNext()) {
			Address addresss = (Address) it.next();
			addresss.setPeople(getLastPeopleSaved());
			peopleRepository.saveAddress(addresss);
		}
	}

	@Transactional
	public void saveMail(Mail mail) {
		
		List<Mail> mailList = new ArrayList<Mail>();
			StringTokenizer token = new StringTokenizer(mail.getEmail());
			StringTokenizer token2 = new StringTokenizer(mail.getCategory());

			while(token.hasMoreTokens()){
            	Mail m = new Mail();
            	m.setEmail(token.nextToken(","));
            	m.setCategory(token2.nextToken(","));
            	mailList.add(m);
            }
		
		it = mailList.iterator();
		while (it.hasNext()) {
			Mail mails = (Mail) it.next();
			mails.setPeople(getLastPeopleSaved());
			peopleRepository.saveMail(mails);
		}
	}

	public People getLastPeopleSaved() {
		people = peopleRepository.findAllPeoples().get((peopleRepository.findAllPeoples().size() - 1));
		return people;
	}

	public List<PeopleReport> getPeopleReport() {
		return peopleRepository.getPeopleReport();
	}

	@Transactional
	public void deletePeople(int id) {
		peopleRepository.deletePeople(id);
	}



	public List<User> unTroo() {
		List<User> users = new ArrayList<User>();
		Iterator<User> it = peopleRepository.unTroo().iterator();
		while (it.hasNext()) {
			User user = it.next();
			users.add(user);
		}
		return users;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<People> getAllPeople(String name) {
		List peoples = new ArrayList();
		Iterator it = peopleRepository.getAllPeople(name).iterator();

		while (it.hasNext()) {
			People people = (People) it.next();
			people.setRutaImg(people.getRutaImg().substring(47, people.getRutaImg().length()));
			peoples.add(people);
		}
		
return peoples;
	
	}

public void saveFullPeople(PhoneNumber phone, Address address, Mail mail) {

		
		if (phone != null) {
			
			List<PhoneNumber> phoneList = new ArrayList<PhoneNumber>();
			StringTokenizer token = new StringTokenizer(phone.getNumber());
			StringTokenizer token2 = new StringTokenizer(phone.getCategory());
			
			while (token.hasMoreTokens()) {
				PhoneNumber p = new PhoneNumber();
				p.setNumber(token.nextToken(","));
				p.setCategory(token2.nextToken(","));
				phoneList.add(p);
			}
			//savePhoneNumber(phoneList);
		}

		if (address != null) {
			
			List<Address> addressList = new ArrayList<Address>();
			StringTokenizer token = new StringTokenizer(address.getStreet());
			StringTokenizer token2 = new StringTokenizer(address.getCity());
			StringTokenizer token3 = new StringTokenizer(address.getState());
			StringTokenizer token4 = new StringTokenizer(address.getCategory());
			
			while (token.hasMoreTokens()) {
				Address a = new Address();
				a.setStreet(token.nextToken(","));
				a.setCity(token2.nextToken(","));
				a.setState(token3.nextToken(","));
				a.setCategory(token4.nextToken(","));
				addressList.add(a);
			}
			//saveAddress(addressList);
		}
		if (mail != null) {
			
			List<Mail> mailList = new ArrayList<Mail>();
			StringTokenizer token = new StringTokenizer(mail.getEmail());
			StringTokenizer token2 = new StringTokenizer(mail.getCategory());

			while(token.hasMoreTokens()){
            	Mail m = new Mail();
            	m.setEmail(token.nextToken(","));
            	m.setCategory(token2.nextToken(","));
            	mailList.add(m);
            }
			//saveMail(mailList);

		}
		else{
			System.out.println("todo esta nulo Lol");
		}

	}


	

}//cierre clase
