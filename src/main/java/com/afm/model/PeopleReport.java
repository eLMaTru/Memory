package com.afm.model;

public class PeopleReport {
	
	private Long peopleId;
	private String peopleName;
	private String peopleLastName;
	private int peopleAge;
	private String phoneNumberCategory;
	private String phoneNumberNumber;
	private String addressCategory;
	private String addressStreet;
	private String addressCity;
	private String addressState;
	private String mailCategory;
	private String mailEmail;

	
	public PeopleReport(Long id, String name, String lastName, int age, String nCategory, String number, String aCategory,
			String street, String city, String state, String mCategory, String email){

		this.peopleId = id;
		this.peopleName = name;
		this.peopleLastName = lastName;
		 this.peopleAge = age;
		this.phoneNumberCategory = nCategory;
		 this.phoneNumberNumber = number;
		 this.addressCategory = aCategory;
		 this.addressStreet = street;
		 this.addressCity = city;
		 this.addressState = state;
		 this.mailCategory = mCategory;
		this.mailEmail = email;
	}
	
	public PeopleReport(){}
	
	public String getPeopleName() {
		return peopleName;
	}
	public void setPeopleName(String peopleName) {
		this.peopleName = peopleName;
	}
	public String getpeopleLastName() {
		return peopleLastName;
	}
	public void setpeopleLastName(String peopleLastName) {
		this.peopleLastName = peopleLastName;
	}
	public int getPeopleAge() {
		return peopleAge;
	}
	public void setPeopleAge(int peopleAge) {
		this.peopleAge = peopleAge;
	}
	public String getPhoneNumberCategory() {
		return phoneNumberCategory;
	}
	public void setPhoneNumberCategory(String phoneNumberCategory) {
		this.phoneNumberCategory = phoneNumberCategory;
	}
	public String getPhoneNumberNumber() {
		return phoneNumberNumber;
	}
	public void setPhoneNumberNumber(String phoneNumberNumber) {
		this.phoneNumberNumber = phoneNumberNumber;
	}
	public String getAddressCategory() {
		return addressCategory;
	}
	public void setAddressCategory(String addressCategory) {
		this.addressCategory = addressCategory;
	}
	public String getAddressStreet() {
		return addressStreet;
	}
	public void setAddressStreet(String addressStreet) {
		this.addressStreet = addressStreet;
	}
	public String getAddressCity() {
		return addressCity;
	}
	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}
	public String getAddressState() {
		return addressState;
	}
	public void setAddressState(String addressState) {
		this.addressState = addressState;
	}
	public String getMailCategory() {
		return mailCategory;
	}
	public void setMailCategory(String mailCategory) {
		this.mailCategory = mailCategory;
	}
	public String getMailEmail() {
		return mailEmail;
	}
	public void setMailEmail(String mailEmail) {
		this.mailEmail = mailEmail;
	}

	public Long getPeopleId() {
		return peopleId;
	}

	public void setPeopleId(Long peopleId) {
		this.peopleId = peopleId;
	}
	
	
	

}
