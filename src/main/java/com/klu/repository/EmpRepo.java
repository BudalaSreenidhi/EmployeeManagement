package com.klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klu.entity.Employee;

@Repository
public interface EmpRepo extends JpaRepository<Employee, Integer>{

}
