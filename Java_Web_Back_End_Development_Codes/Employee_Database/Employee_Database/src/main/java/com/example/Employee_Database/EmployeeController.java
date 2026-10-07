package com.example.Employee_Database;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employees")
public class EmployeeController {
    private final EmployeeService employeeSerivce;

    public EmployeeController(EmployeeService employeeSerivce) {
        this.employeeSerivce = employeeSerivce;
    }

    @PostMapping("/save")
    public String saveEmployee(@ModelAttribute ("employee") Employee employee) {
        employeeSerivce.save(employee);

        // Enforces the Post/Redirect/Get (PRG) pattern by returning HTTP 302 redirect
        return "redirect:/employees/list";
    }
}
