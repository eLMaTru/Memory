package com.afm.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonManagedReference;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Component
@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue 
	
	private Long id;
	@NotEmpty
    private String fullName;
	private CommonsMultipartFile img;
	private String rutaImg;
	@NotEmpty
	private String userName;
	@NotEmpty
	private String email;
	@NotEmpty
	private String password;
	private boolean enabled;
	
	@JsonManagedReference
	@OneToMany(mappedBy="user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	List<People> people = new ArrayList<People>();
	@JsonManagedReference
	@OneToMany(mappedBy="user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	List<Authorities> authorities = new ArrayList<Authorities>();
	
	
	
	public List<Authorities> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(List<Authorities> authorities) {
		this.authorities = authorities;
	}
	public List<People> getPeople() {
		return people;
	}
	public void setPeople(List<People> people) {
		this.people = people;
	}
	
	
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	
	
	
} 
