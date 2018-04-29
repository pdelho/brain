package com.pablo.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pablo.model.Contact;

@Repository(value = "contactDAO")
public class JPAContactDAO implements ContactDAO{
	
    private EntityManager em = null;

    /*
     * Sets the entity manager.
     */
    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }

    @Transactional(readOnly = true)
	public Contact getContactById(long id) {
		return em.find(Contact.class, id);
	}
    
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Contact> getContactList() {
    	return em.createQuery("SELECT p FROM Contact p ORDER BY p.contact_id").getResultList();
	}

    @Transactional(readOnly = false)
	public void saveContact(Contact contact) {
    	em.merge(contact);
	}

    @Transactional(readOnly = false)
	public void deleteContact(Contact contact) {
    	// If we don't merge first, it has a temporal transactional object
		em.remove(em.merge(contact));	
	}

}
