package com.poly.repositories;

import com.poly.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CustomerRepository extends JpaRepository<Customer,Long> {

  Customer findByEmailLike(String email);

  Customer findByPhoneLike(String phone);
}
