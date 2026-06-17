package com.employee.repository;

import java.util.List;
import java.util.Map;
import java.util.HashMap; // 🟢 HashMap ke liye import
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.employee.model.Employee;
import com.employee.model.Admin;

@Repository
public class EmployeeRepositoryImpl implements EmployeeRepository {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public void save(Employee employee) {
        sessionFactory.getCurrentSession().saveOrUpdate(employee); 
    }

    @Override
    public List<Employee> getAllEmployees() {
        return sessionFactory.getCurrentSession().createQuery("from Employee", Employee.class).list();
    }
    
    @Override
    public void deleteEmployee(int empId) {
        Session session = sessionFactory.getCurrentSession();
        Employee emp = session.get(Employee.class, empId);
        if (emp != null) {
            session.delete(emp);
        }
    }

    @Override
    public Employee getEmployeeById(int empId) {
        return sessionFactory.getCurrentSession().get(Employee.class, empId);
    }

    @Override
    public void updateEmployee(Employee employee) {
        sessionFactory.getCurrentSession().update(employee); 
    }
    
    @Override
    public Admin loginAdmin(String username, String password) {
        String hql = "from Admin where username = :user and password = :pass";
        try {
            return sessionFactory.getCurrentSession()
                          .createQuery(hql, Admin.class)
                          .setParameter("user", username)
                          .setParameter("pass", password)
                          .uniqueResult(); 
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 1. Total Employee Count (Native SQL)
    @Override
    public long getTotalEmployeeCount() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "SELECT COUNT(*) FROM employees"; 
        Object result = session.createNativeQuery(sql).uniqueResult();
        return result != null ? ((Number) result).longValue() : 0L;
    }

    // 2. Total Salary Budget (Native SQL)
    @Override
    public double getTotalSalaryBudget() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "SELECT SUM(salary) FROM employees";
        Object result = session.createNativeQuery(sql).uniqueResult();
        return result != null ? ((Number) result).doubleValue() : 0.0;
    }

    // 3. Department-wise Breakdown (HQL - Group By)
    @Override
    public Map<String, Long> getDepartmentCount() {
        Session session = sessionFactory.getCurrentSession();
        // HQL Query jo department wise group karegi
        List<Object[]> results = session.createQuery("select e.department, count(e) from Employee e group by e.department").list();
        
        Map<String, Long> report = new HashMap<>();
        for (Object[] row : results) {
            // row[0] is Department Name, row[1] is the Count
            report.put((String) row[0], (Long) row[1]);
        }
        return report;
    }
}