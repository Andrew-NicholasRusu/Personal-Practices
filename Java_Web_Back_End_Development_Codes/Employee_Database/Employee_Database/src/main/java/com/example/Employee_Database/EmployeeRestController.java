package com.example.Employee_Database;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController // Automatically maps to a JSON response
@RequestMapping("/api") // localhost:8080/api
public class EmployeeRestController {

    private final EmployeeService employeeService;

    public EmployeeRestController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/employees") // localhost:8080/api/employees
    public List<Employee> findAll() {
        return employeeService.findAll();
    }

    @GetMapping("/employees/{employeeId}") // localhost:8080/api/employees/1
    public Employee getEmployee(@PathVariable int employeeId) {
        return employeeService.findById(employeeId);
    }

    // PostMapping is used for creating new resources
    @PostMapping("/employees") // localhost:8080/api/employees
    public Employee addEmployee(@RequestBody Employee employee) {
        employee.setId(0); // Forces a save strategy rather than an update strategy
        return employeeService.save(employee);
    }

    // PutMapping is used for updating existing resources
    @PutMapping("/employees") // localhost:8080/api/employees
    public Employee updateEmployee(@RequestBody Employee employee) {
        return employeeService.save(employee);
    }

    // DeleteMapping is used for deleting resources
    @DeleteMapping
    public String deleteEmployee(@PathVariable int employeeId) {
        Employee tempEmployee = employeeService.findById(employeeId);
        if (tempEmployee == null) {
            throw new RuntimeException("Employee id not found - " + employeeId);
        }
        employeeService.deleteById(employeeId);
        return "Deleted Employee with id: " + employeeId + ".";
    }
}
