package com.pablo.repository;

import java.util.List;

import com.pablo.model.Contact;

/**
 * DAO with CRUD functions
 * @author pablo
 *
 */

public interface ContactDAO {
	/**
	 * Get (read) an exercise by its id
	 * @param id
	 * @return
	 */
	public Contact getContactById(long id);

	/**
	 * Get all exercises
	 * @return
	 */
	public List<Contact> getContactList();

	/**
	 * Create or update an exercise
	 * @param contact
	 */
    public void saveContact(Contact contact);
    
    /**
     * Delete an exercise
     * @param contact
     */
    public void deleteContact(Contact contact);
    
}
