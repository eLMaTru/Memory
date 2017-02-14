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
@Table(name="address")
public class Address {
	
	
	
	@Id
	@GeneratedValue
	private Long idAddress;
	private String ida;
	@NotEmpty
	private String categoryA;
	@NotEmpty
	private String street;
	@NotEmpty
	private String city; 
	@NotEmpty
	private String state;
	@JsonBackReference
	@ManyToOne
	private People people;
	
	
	public People getPeople() {
		return people;
	}
	public void setPeople(People people) {
		this.people = people;
	}
	
	public Long getIdAddress() {
		return idAddress;
	}
	public void setIdAddress(Long id_address) {
		this.idAddress = id_address;
	}
	public String getCategoryA() {
		return categoryA;
	}
	public void setCategoryA(String category) {
		this.categoryA = category;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIda() {
		return ida;
	}
	public void setIda(String idaddress) {
		this.ida = idaddress;
	}

	

}
