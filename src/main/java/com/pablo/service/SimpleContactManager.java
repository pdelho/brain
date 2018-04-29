package com.pablo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.pablo.model.Contact;
import com.pablo.repository.ContactDAO;

@Component
public class SimpleContactManager implements ContactManager {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
    private ContactDAO contactDAO;
	
	 public void setContactDao(ContactDAO contactDAO) {
	        this.contactDAO = contactDAO;	 
	 }


	 @Override
	 public Contact getContactById(long id) {
		 return contactDAO.getContactById(id);
	 }

	public List<Contact> getContacts() {
		return contactDAO.getContactList(); 
	}


	@Override
	public void saveContact(Contact contact) {
		contactDAO.saveContact(contact);
		
	}

	@Override
	public void deleteContact(Contact contact) {
		contactDAO.deleteContact(contact);
		
	}

}
