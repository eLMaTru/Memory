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
@Table(name="mail")
public class Mail {
	
	@Id
	@GeneratedValue
	private Long idMail;
	private String idm;
	@NotEmpty
	private String categoryM;
	@NotEmpty(message = "cant be no empty")
	private String email;
	@JsonBackReference
	@ManyToOne
	private People people;
	
	
	public People getPeople() {
		return people;
	}
	public void setPeople(People people) {
		this.people = people;
	}
	public Long getIdMail() {
		return idMail;
	}
	public void setIdMail(Long id_mail) {
		this.idMail = id_mail;
	}
	public String getCategoryM() {
		return categoryM;
	}
	public void setCategoryM(String category) {
		this.categoryM = category;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdm() {
		return idm;
	}
	public void setIdm(String idmail) {
		this.idm = idmail;
	}
	
	
	

}
