package com.employee.repository;

import java.util.List;
import java.util.Map; // 🟢 Import added
import com.employee.model.Employee;
import com.employee.model.Admin;

public interface EmployeeRepository {
    void save(Employee employee);
    List<Employee> getAllEmployees();
    void deleteEmployee(int empId);
    Employee getEmployeeById(int empId);
    void updateEmployee(Employee employee);
    
    Admin loginAdmin(String username, String password);
    
    // Stats Methods
    long getTotalEmployeeCount();
    double getTotalSalaryBudget();
    
    // 📊 Naya Method: Department wise count ke liye
    Map<String, Long> getDepartmentCount(); 
}