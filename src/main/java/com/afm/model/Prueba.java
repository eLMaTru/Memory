package com.afm.model;

import org.hibernate.validator.constraints.Range;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Component
public class Prueba {

   
    @Range(min =1, max = 120, message ="el bobo esta aqui")
	private int age;
	private String img;
	
	private CommonsMultipartFile fichero;
	 
	public CommonsMultipartFile getFichero() {
		return fichero;
	}
 
	public void setFichero(CommonsMultipartFile fichero) {
		this.fichero = fichero;
	}	
	
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	

}
