package com.employee.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.employee.model.Employee;
import com.employee.service.EmployeeService;

@Controller
public class EmployeeController {
    
    @Autowired
    private EmployeeService service;

    // 1. Home Page (Dashboard with Stats & Department Insights)
    @GetMapping("/")
    public String home(Model model) {
        long count = service.getTotalEmployeeCount();
        double salary = service.getTotalSalaryBudget();
        
        // 📊 Department-wise count data fetch kar rahe hain
        Map<String, Long> deptStats = service.getDepartmentCount();
        
        System.out.println("---------- DASHBOARD DEBUG ----------");
        System.out.println("Total Count: " + count);
        System.out.println("Total Salary: " + salary);
        System.out.println("Department Stats: " + deptStats);
        System.out.println("-------------------------------------");

        model.addAttribute("testMsg", "ACTIVE"); // For testing EL
        model.addAttribute("totalCount", count);
        model.addAttribute("totalSalary", salary);
        model.addAttribute("deptStats", deptStats); 
        
        return "index";   
    }

    // 2. Add Employee Form
    @GetMapping("/add")
    public String getAddemployeeForm(HttpSession session) {
        if (session.getAttribute("adminUser") == null) return "redirect:/login"; 
        return "add-employee";
    }
    
    // 3. Save Record
    @PostMapping("/save")
    public String saveEmployeeRecord(@ModelAttribute Employee employee, HttpSession session, RedirectAttributes ra) {
        if (session.getAttribute("adminUser") == null) return "redirect:/login";
        service.saveEmployee(employee);
        ra.addFlashAttribute("msg", "Employee saved successfully!");
        return "redirect:/display"; 
    }

    // 4. View All Records
    @GetMapping("/display")
    public String displayEmployees(Model model) {
        model.addAttribute("empList", service.getAllEmployees());
        return "display"; 
    }

    // 5. Delete Record
    @GetMapping("/delete/{id}")
    public String deleteEmployeeRecord(@PathVariable("id") int id, HttpSession session, RedirectAttributes ra) {
        if (session.getAttribute("adminUser") == null) return "redirect:/display";
        service.deleteEmployee(id);
        ra.addFlashAttribute("msg", "Deleted successfully!");
        return "redirect:/display"; 
    }
    
    // 6. Edit Form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model, HttpSession session) {
        if (session.getAttribute("adminUser") == null) return "redirect:/login";
        model.addAttribute("employee", service.getEmployeeById(id)); 
        return "edit-employee"; 
    }

    // 7. Update Record
    @PostMapping("/update")
    public String updateEmployeeRecord(@ModelAttribute Employee employee, HttpSession session, RedirectAttributes ra) {
        if (session.getAttribute("adminUser") == null) return "redirect:/display";
        service.updateEmployee(employee);
        ra.addFlashAttribute("msg", "Updated!");
        return "redirect:/display"; 
    }

    // 8. Search Page
    @GetMapping("/search")
    public String showSearchPage() { return "search-employee"; }

    // 9. Search Logic
    @PostMapping("/searchEmployee")
    public String searchEmployee(@RequestParam("empId") int id, Model model) {
        Employee employee = service.getEmployeeById(id);
        if (employee != null) model.addAttribute("employee", employee); 
        else model.addAttribute("msg", "Not found!"); 
        return "search-employee"; 
    }
}