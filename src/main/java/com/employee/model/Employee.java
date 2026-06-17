package com.employee.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="employees")
public class Employee {

    @Id
    private int empId; // JSP form mein id yahi hai

    @Column(length = 30, nullable = false)
    private String name;

    @Column(length = 30, nullable = false)
    private String department;

    @Column(nullable = false)
    private int salary; // Spelling fix ki hai (salery -> salary)

    public int getEmpId() { return empId; }
    public void setEmpId(int empId) { this.empId = empId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public int getSalary() { return salary; }
    public void setSalary(int salary) { this.salary = salary; }
}