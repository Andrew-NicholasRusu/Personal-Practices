package com.example.Employee_Database;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
    // Derived method parsing: SELECT e FROM Employee e ORDER BY e.lastName ASC
    List<Employee> findAllByOrderByLastNameAsc();

    // Standard out-of-the-box JpaRepository query methods
    Optional<Employee> findById(Integer id);
    Employee save(Employee employee);
    void deleteById(Integer id);
}
