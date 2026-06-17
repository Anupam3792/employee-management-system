<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Smart Search - EMS PRO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body, html {
            margin: 0; padding: 0; min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(-45deg, #0f2027, #203a43, #2c5364, #003366);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            color: white;
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

        .search-container {
            padding-top: 120px;
            display: flex;
            justify-content: center;
            padding-bottom: 50px;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.5);
        }

        .search-input {
            background: rgba(255, 255, 255, 0.05) !important;
            border: 1px solid rgba(255, 255, 255, 0.3) !important;
            color: white !important;
            border-radius: 10px 0 0 10px !important;
        }

        .search-input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .btn-search {
            border-radius: 0 10px 10px 0 !important;
            background: linear-gradient(45deg, #00d2ff, #3a7bd5);
            border: none;
            color: white;
            padding: 10px 25px;
            transition: 0.3s;
        }

        .btn-search:hover {
            opacity: 0.9;
            transform: scale(1.05);
        }

        .result-box {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 20px;
            margin-top: 30px;
            border-left: 5px solid #00d2ff;
        }

        .info-label {
            color: #00d2ff;
            font-weight: 600;
            font-size: 0.8rem;
            text-transform: uppercase;
        }

        .info-value {
            font-size: 1.1rem;
            margin-bottom: 15px;
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
          <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Dashboard</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/display">View List</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container search-container">
        <div class="glass-card text-center">
            <h2 class="mb-4 fw-bold"><i class="fa-solid fa-magnifying-glass me-2"></i> Smart Search</h2>
            <p class="text-info mb-4">Enter Employee ID to fetch real-time data</p>

            <form action="${pageContext.request.contextPath}/searchEmployee" method="post" class="input-group mb-3">
                <input type="number" name="empId" class="form-control search-input" placeholder="e.g. 101" required>
                <button type="submit" class="btn btn-search">
                    <i class="fa-solid fa-paper-plane"></i> Search
                </button>
            </form>

            <c:if test="${not empty msg}">
                <div class="alert alert-danger mt-4 bg-danger text-white border-0 py-2">
                    <i class="fa-solid fa-circle-exclamation me-2"></i> ${msg}
                </div>
            </c:if>

            <c:if test="${not empty employee}">
                <div class="result-box text-start">
                    <div class="row">
                        <div class="col-6">
                            <div class="info-label">Employee ID</div>
                            <div class="info-value">#${employee.empId}</div>
                        </div>
                        <div class="col-6">
                            <div class="info-label">Full Name</div>
                            <div class="info-value">${employee.name}</div>
                        </div>
                        <div class="col-6">
                            <div class="info-label">Department</div>
                            <div class="info-value"><span class="badge bg-info text-dark">${employee.department}</span></div>
                        </div>
                        <div class="col-6">
                            <div class="info-label">Salary</div>
                            <div class="info-value">₹ ${employee.salary}</div>
                        </div>
                    </div>
                    
                    <hr class="bg-light shadow-sm">
                    
                    <div class="d-flex justify-content-between mt-3">
                        <a href="${pageContext.request.contextPath}/edit/${employee.empId}" class="btn btn-sm btn-warning px-4 fw-bold">
                            <i class="fa-solid fa-pen-to-square me-1"></i> Edit Record
                        </a>
                        <a href="${pageContext.request.contextPath}/delete/${employee.empId}" 
                           class="btn btn-sm btn-outline-danger px-4"
                           onclick="return confirm('Confirm permanent deletion?')">
                            <i class="fa-solid fa-trash me-1"></i> Delete
                        </a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>