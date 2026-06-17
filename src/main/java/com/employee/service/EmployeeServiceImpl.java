package com.employee.service;

import java.util.List;
import java.util.Map; // 🟢 Import zaroori hai
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.employee.model.Employee;
import com.employee.model.Admin;
import com.employee.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    
    @Autowired
    private EmployeeRepository repository;

    @Override
    @Transactional
    public void saveEmployee(Employee employee) {
        repository.save(employee);
    }

    @Override
    @Transactional
    public List<Employee> getAllEmployees() {
        return repository.getAllEmployees();
    }
    
    @Override
    @Transactional
    public void deleteEmployee(int empId) {
        repository.deleteEmployee(empId);
    }

    @Override
    @Transactional
    public Employee getEmployeeById(int empId) {
        return repository.getEmployeeById(empId);
    }

    @Override
    @Transactional
    public void updateEmployee(Employee employee) {
        repository.updateEmployee(employee);
    }

    @Override
    @Transactional
    public Admin loginAdmin(String username, String password) {
        return repository.loginAdmin(username, password);
    }

    @Override
    @Transactional
    public long getTotalEmployeeCount() {
        return repository.getTotalEmployeeCount();
    }

    @Override
    @Transactional
    public double getTotalSalaryBudget() {
        return repository.getTotalSalaryBudget();
    }

    // 📊 Naya Method: Repository se department data fetch karne ke liye
    @Override
    @Transactional
    public Map<String, Long> getDepartmentCount() {
        return repository.getDepartmentCount();
    }
}