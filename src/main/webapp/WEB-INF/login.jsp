<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - EMS PRO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(-45deg, #0f2027, #2c5364);
            height: 100vh; display: flex; align-items: center; justify-content: center;
        }
        .login-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 40px; border-radius: 20px; width: 100%; max-width: 400px; color: white;
        }
        .form-control {
            background: rgba(255, 255, 255, 0.1) !important;
            border: 1px solid rgba(255, 255, 255, 0.3) !important;
            color: white !important;
        }
        .btn-login {
            background: linear-gradient(45deg, #00d2ff, #3a7bd5);
            border: none; color: white; font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="login-card shadow-lg text-center">
        <i class="fa-solid fa-lock-open fa-3x mb-3 text-info"></i>
        <h3 class="mb-4 fw-bold">Admin Portal</h3>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger py-2" style="font-size: 0.9rem;">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/loginAdmin" method="post">
            <div class="mb-3 text-start">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter username" required>
            </div>
            <div class="mb-4 text-start">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-login w-100 py-2">LOGIN</button>
        </form>
    </div>
</body>
</html>