package com.pablo.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pablo.model.Contact;
import com.pablo.service.ContactManager;


/**
 * Handles requests for the application home page.
 */
@Controller
public class NavigationController {

	private static final Logger LOG = LoggerFactory.getLogger(NavigationController.class);

	@Autowired
	private ContactManager contactManager;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		Locale locale = new Locale("en_US");
		LOG.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );
		
		List<Contact> contacts = contactManager.getContacts();
		model.addAttribute("contacts", contacts);
		
		return "index";
	}


}