package com.pablo.service;

import java.io.Serializable;
import java.util.List;

import com.pablo.model.Contact;

/**
 * Service layer, calls DAO
 * @author pablo
 *
 */

public interface ContactManager extends Serializable{
	
	public Contact getContactById(long id);
	
    public List<Contact> getContacts();
    
    public void saveContact(Contact contact);
    
    public void deleteContact(Contact contact);

}
