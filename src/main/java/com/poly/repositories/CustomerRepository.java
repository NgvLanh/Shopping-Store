package com.poly.repositories;

import com.poly.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface CustomerRepository extends JpaRepository<Customer,Long> {

//  @Query("SELECT email,password from customers where email =?")
//  List<Customer> findAllByEmail(String email);
  Customer findByEmailLike(String email);

  Customer findByPhoneLike(String phone);
}
