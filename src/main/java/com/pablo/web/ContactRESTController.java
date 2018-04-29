package com.pablo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.pablo.model.Contact;
import com.pablo.service.ContactManager;

 
@RestController
public class ContactRESTController
{
	
	@Autowired
	private ContactManager contactManager;
    
    @RequestMapping(value = "/ws/contact/{id}", method = RequestMethod.GET)
    public ResponseEntity<Contact> getUser(@PathVariable("id") long id) {
        System.out.println("Fetching User with id " + id);
        Contact user = contactManager.getContactById(id);
        if (user == null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<Contact>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Contact>(user, HttpStatus.OK);
    }
    
    
    @RequestMapping(value = "/ws/contact", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Void> createUser(@RequestBody @Validated Contact contact,  BindingResult result, UriComponentsBuilder ucBuilder) {
        if (result.hasErrors()) {
        	HttpHeaders headers = new HttpHeaders();
            return new ResponseEntity<Void>(headers, HttpStatus.NOT_ACCEPTABLE);
        } else {
        	System.out.println("Creating User " + contact.getFirstname());
            Contact newContact = new Contact();
            newContact.setFirstname(contact.getFirstname());
            newContact.setLastname(contact.getLastname());
            newContact.setAddress(contact.getAddress());
            newContact.setEmail(contact.getEmail());
            newContact.setPhone(contact.getPhone());
            
            contactManager.saveContact(newContact);
            
            HttpHeaders headers = new HttpHeaders();
            headers.setLocation(ucBuilder.path("/ws/contact/{id}").buildAndExpand(contact.getContact_id()).toUri());
            return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
        }
    	
    }
}