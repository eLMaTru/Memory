package com.afm.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Component
@JsonIgnoreProperties
@Entity
@Table(name="phoneNumber")
public class PhoneNumber {
	
	@Id
	@GeneratedValue
	private Long idPhoneNumber;
	private String idp;
	@NotEmpty
	private String categoryPh;
    @NotEmpty
	private String number;
	@JsonBackReference
	@ManyToOne
	private People people;
	
	
	public People getPeople() {
		return people;
	}
	public void setPeople(People people) {
		this.people = people;
	}
	
	public Long getIdPhoneNumber() {
		return idPhoneNumber;
	}
	public void setIdPhoneNumber(Long id_phonenumber) {
		this.idPhoneNumber = id_phonenumber;
	}
	public String getCategoryPh() {
		return categoryPh;
	}
	public void setCategoryPh(String category) {
		this.categoryPh = category;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getIdp() {
		return idp;
	}
	public void setIdp(String idp) {
		this.idp = idp;
	}
	
	

}
