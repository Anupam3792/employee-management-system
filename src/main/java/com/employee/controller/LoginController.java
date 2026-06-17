package com.employee.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.employee.model.Admin;
import com.employee.service.EmployeeService;

@Controller
public class LoginController {

    @Autowired
    private EmployeeService service;

    // 1. Login Page dikhane ke liye
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; 
    }

    // 2. Login Process karne ke liye
    @PostMapping("/loginAdmin")
    public String loginAdmin(@RequestParam("username") String user, 
                             @RequestParam("password") String pass, 
                             HttpSession session, Model model) {
        
        Admin admin = service.loginAdmin(user, pass);
        
        if (admin != null) {
            session.setAttribute("adminUser", admin); // Session mein user save kiya
            return "redirect:/"; // Home page par bhej diya
        } else {
            model.addAttribute("error", "Invalid Username or Password!");
            return "login"; // Wapas login par error ke saath
        }
    }

    // 3. Logout karne ke liye
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Session khatam
        return "redirect:/login";
    }
}