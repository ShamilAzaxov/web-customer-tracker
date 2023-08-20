package com.luv2code.springdemo.dao;

import com.luv2code.springdemo.entity.Customer;
import com.luv2code.springdemo.service.CustomerService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

    @Autowired
    private SessionFactory factory;

    @Override
    public List<Customer> getCustomers() {

        //get the current hibernate session
        Session session = factory.getCurrentSession();

        //create a query
        Query<Customer> theQuery = session.createQuery("from Customer order by lastName", Customer.class);

        //execute query and get result list
        List<Customer> customers = theQuery.getResultList();

        System.out.println(customers);

        //return the result
        return customers;
    }

    @Override
    @Transactional
    public void saveCustomer(Customer theCustomer) {
        Session session = factory.getCurrentSession();

        session.saveOrUpdate(theCustomer);

    }

    @Override
    public Customer getCustomers(int theId) {

        //get the current hibernate session
        Session session = factory.getCurrentSession();

        //now retrieve/read from db using the primary key
//        Query<Customer> theQuery = session.createQuery("from Customer where id = " + theId);
        Customer tempCustomer = session.get(Customer.class, theId);

        return tempCustomer;
    }

    @Override
    public void deleteCustomer(int theId) {
        Session session = factory.getCurrentSession();

//        Query theQuery = session.createQuery("delete from Customer where id = :customerId");
//
//        theQuery.setParameter("customerId", theId);
//
//        theQuery.executeUpdate();

        session.delete(session.get(Customer.class, theId));
    }

    @Override
    public List<Customer> searchCustomers(String theSearchName) {

        Session session = factory.getCurrentSession();

        Query theQuery = null;

        if(theSearchName !=null && theSearchName.trim().length() > 0){
            theQuery = session.createQuery("from Customer where lower(firstName) like " +
                    ":theName or lower(lastName) like :theName", Customer.class);

            theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
        }

        else{
            theQuery = session.createQuery("from Customer ", Customer.class);
        }

        List<Customer> customers = theQuery.getResultList();

        return customers;
    }
}
