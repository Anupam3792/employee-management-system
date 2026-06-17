<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Employees - EMS PRO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body, html {
            margin: 0; padding: 0; min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(-45deg, #0f2027, #203a43, #2c5364, #003366);
            background-size: 400% 400%;
            animation: gradientAnimation 12s ease infinite;
        }
        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .navbar {
            background: rgba(0, 0, 0, 0.3) !important;
            backdrop-filter: blur(10px);
        }
        .table-wrapper {
            padding: 100px 20px 50px; /* Navbar ke liye top padding badha di */
            display: flex; justify-content: center;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.95); 
            backdrop-filter: blur(15px); 
            border-radius: 15px; 
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.4); 
            width: 100%; max-width: 1100px;
            padding: 30px;
        }
        .btn-logout {
            border: 1px solid #ff4b2b;
            color: #ff4b2b;
        }
        .btn-logout:hover {
            background: #ff4b2b;
            color: white;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top shadow-sm">
      <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold fs-4" href="${pageContext.request.contextPath}/">
            <i class="fa-solid fa-microchip me-2"></i>EMS PRO
        </a>
        <div class="collapse navbar-collapse">
          <ul class="navbar-nav ms-auto align-items-center">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Dashboard</a></li>
            <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/display">View List</a></li>
            
            <c:choose>
                <c:when test="${not empty sessionScope.adminUser}">
                    <li class="nav-item ms-3">
                        <span class="text-info fw-bold">
                            <i class="fa-solid fa-user-tie me-1"></i> Hi, ${sessionScope.adminUser.username}
                        </span>
                    </li>
                    <li class="nav-item ms-3">
                        <a class="nav-link btn btn-sm btn-logout px-3" href="${pageContext.request.contextPath}/logout">
                            <i class="fa-solid fa-right-from-bracket me-1"></i> Logout
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item ms-3">
                        <a class="nav-link btn btn-sm btn-outline-info px-3" href="${pageContext.request.contextPath}/login">
                            <i class="fa-solid fa-lock me-1"></i> Admin Login
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
          </ul>
        </div>
      </div>
    </nav>

    <div class="table-wrapper">
        <div class="glass-card">
            
            <c:if test="${not empty msg}">
                <div class="alert alert-success alert-dismissible fade show shadow-sm mb-4" role="alert">
                    <i class="fa-solid fa-circle-check me-2"></i> ${msg}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <h3 class="mb-4 text-center fw-bold" style="color: #003366;">
                <i class="fa-solid fa-users me-2"></i> Employee Directory
            </h3>
            
            <div class="table-responsive">
                <table class="table table-hover table-bordered text-center align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>Emp ID</th>
                            <th>Name</th>
                            <th>Department</th>
                            <th>Salary (₹)</th>
                            <th>Actions</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="emp" items="${empList}">
                            <tr>
                                <td class="fw-bold text-primary">#${emp.empId}</td>
                                <td>${emp.name}</td>
                                <td><span class="badge bg-info text-dark px-3">${emp.department}</span></td>
                                <td class="fw-bold">₹ ${emp.salary}</td>
                                
                                <td>
                                    <a href="${pageContext.request.contextPath}/searchEmployee?empId=${emp.empId}" class="btn btn-sm btn-outline-primary me-1" title="View Details">
                                        <i class="fa-solid fa-eye"></i>
                                    </a>
                                    
                                    <c:if test="${not empty sessionScope.adminUser}">
                                        <a href="${pageContext.request.contextPath}/edit/${emp.empId}" class="btn btn-sm btn-warning me-1" title="Edit">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </a>
                                        
                                        <a href="${pageContext.request.contextPath}/delete/${emp.empId}" 
                                           class="btn btn-sm btn-danger" 
                                           title="Delete"
                                           onclick="return confirm('Pakka delete karna hai?')">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </c:if>
                                    
                                    <c:if test="${empty sessionScope.adminUser}">
                                        <span class="text-muted ms-2" title="Admin access required for more actions">
                                            <i class="fa-solid fa-lock" style="font-size: 0.8rem;"></i>
                                        </span>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty empList}">
                            <tr>
                                <td colspan="5" class="text-muted py-4">
                                    <i class="fa-solid fa-folder-open fa-2x mb-2 d-block"></i>
                                    No records found in the database.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>