package com.pablo.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "contact")
public class Contact implements Serializable {

	/**
	 * Constructor for the object contact to be stored
	 * @param firstname
	 * @param lastname
	 * @param address
	 * @param email
	 * @param phone
	 */
	public Contact(String firstname, String lastname, String address, String email, String phone) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.address = address;
		this.email = email;
		this.phone = phone;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long contact_id;
	
	@Column(name = "firstname")
	private String firstname;

	@Column(name = "lastname")
	private String lastname;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "phone")
	private String phone;
	
	protected Contact(){
		
	}
	
	public long getContact_id() {
		return contact_id;
	}

	public void setContact_id(long contact_id) {
		this.contact_id = contact_id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Override
	public String toString() {
		return String.format("Contact[id=%d, firstname='%s', lastname='%s']", contact_id, firstname, lastname);
	}
	

}
