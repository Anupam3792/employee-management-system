package com.employee.service;

import java.util.List;
import java.util.Map; // 🟢 Department Stats ke liye Map import
import com.employee.model.Employee;
import com.employee.model.Admin;

public interface EmployeeService {
    
    // 1. Employee Management Methods
    void saveEmployee(Employee employee);
    List<Employee> getAllEmployees();
    void deleteEmployee(int empId);
    Employee getEmployeeById(int empId);
    void updateEmployee(Employee employee);
    
    // 2. Admin Authentication Method (Login Logic)
    Admin loginAdmin(String username, String password); 
    
    // 3. Analytics & Stats Methods (Dashboard ke liye)
    long getTotalEmployeeCount();
    double getTotalSalaryBudget();
    
    // 📊 Naya Method: Department-wise employees count dikhane ke liye
    Map<String, Long> getDepartmentCount(); 
}