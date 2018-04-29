package com.pablo.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pablo.model.Contact;
import com.pablo.service.ContactManager;

@Controller
public class ContactsController {

	@Autowired
	private ContactManager contactManager;


	/**
	 * READ ALL Contacts
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/contacts", method = RequestMethod.GET)
	public String Contacts(Model model) {		
		List<Contact> contacts = contactManager.getContacts();
		model.addAttribute("contacts", contacts);
		return "contact/all";

	}

	// To register a Contact, first you get the form
	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/contact/add", method = RequestMethod.GET)
	public String addContact(Model model) {
		return "contact/add";

	}

	/**
	 * SAVE a Contact
	 * @param contact
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	public String saveContact(@Validated Contact contact, Model model) {

		boolean existContact = false;
		if (contactManager.getContactById(contact.getContact_id()) != null) existContact = true;
		if(!existContact){
			// Create a new one and save it
			Contact newContact = new Contact (contact.getFirstname(), contact.getLastname(), contact.getAddress(), contact.getEmail(), contact.getPhone());
			// Save it
			contactManager.saveContact(newContact);		
		} else {
			Contact updatedContact = contactManager.getContactById(contact.getContact_id());
			updatedContact.setFirstname(contact.getFirstname());
			updatedContact.setLastname(contact.getLastname());
			updatedContact.setAddress(contact.getAddress());
			updatedContact.setEmail(contact.getEmail());
			updatedContact.setPhone(contact.getPhone());
			contactManager.saveContact(updatedContact);
		}
		

		// Get all Contactss and render them
		List<Contact> contacts = contactManager.getContacts();
		model.addAttribute("contacts", contacts);
		return "contact/all";

	}

	// To update or read a Contact, first we get a form with the details of the Contact
	@RequestMapping(value = "/contact/{id}", method = RequestMethod.GET)
	public String ContactForm(@PathVariable int id, Model model) {
		Contact existingContact = contactManager.getContactById(id);
		model.addAttribute("contact", existingContact);
		return "contact/details";

	}
	
	// To delete a Contact
	@RequestMapping(value = "/contact/delete/{id}", method = RequestMethod.GET)
	public String ContactDeleteForm(@PathVariable int id, Model model) {
		Contact deletedContact = contactManager.getContactById(id);
		contactManager.deleteContact(deletedContact);
		// Get all Contacts and render them
		List<Contact> contacts = contactManager.getContacts();
		model.addAttribute("contacts", contacts);
		return "contact/all";

	}
}
