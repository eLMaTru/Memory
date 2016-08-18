package com.afm.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Component
@JsonIgnoreProperties
@Entity
@Table(name="people")
public class People {
	
	@Id
	@GeneratedValue
	private Long id;
	@NotEmpty
	private String name;
	@NotEmpty
	private String lastName;
	@Range(min=1, max= 120)
	private int age;
	private CommonsMultipartFile img;
	private String rutaImg;
	@ManyToOne
	private User user;
    
	@OneToMany(mappedBy="people", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<PhoneNumber> phoneNumbers = new ArrayList<PhoneNumber>();
	@OneToMany(mappedBy="people", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Address> addresses = new ArrayList<Address>();
	@OneToMany(mappedBy="people", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Mail> mails = new ArrayList<Mail>();
	
	
	
	
	
	
	public List<PhoneNumber> getPhoneNumbers() {
		return phoneNumbers;
	}
	public void setPhoneNumbers(List<PhoneNumber> phoneNumbers) {
		this.phoneNumbers = phoneNumbers;
	}
	public List<Address> getAddresses() {
		return addresses;
	}
	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}
	public List<Mail> getMails() {
		return mails;
	}
	public void setMails(List<Mail> mails) {
		this.mails = mails;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public CommonsMultipartFile getImg() {
		return img;
	}
	public void setImg(CommonsMultipartFile img) {
		this.img = img;
	}
	public String getRutaImg() {
		return rutaImg;
	}
	public void setRutaImg(String rutaImg) {
		this.rutaImg = rutaImg;
	}
	
	
	
	
	


}
