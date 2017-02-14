package com.afm.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;

@Entity
@Table(name  = "authorities")
public class Authorities {
	
	@Id
	@GeneratedValue
	private Long idAuthorities;
	private String username;
	private String authority;
    
	@ManyToOne
	@JsonBackReference
    private User user;
	public Long getId() {
		return idAuthorities;
	}
	public void setId(Long id_authorities) {
		this.idAuthorities = id_authorities;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getauthority() {
		return authority;
	}
	public void setauthority(String authority) {
		this.authority = authority;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
    
    

}
