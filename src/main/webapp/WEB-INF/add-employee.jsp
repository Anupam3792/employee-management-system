<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee - EMS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* 1. Moving Gradient Background on Body */
        body, html {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            
            background: linear-gradient(-45deg, #0f2027, #203a43, #2c5364, #003366);
            background-size: 400% 400%;
            animation: gradientAnimation 12s ease infinite;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Wrapper to center the form BELOW the navbar */
        .form-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: calc(100vh - 76px); 
            padding: 20px;
        }

        /* 2. Glassmorphism Card */
        .glass-card {
            background: rgba(255, 255, 255, 0.85); 
            backdrop-filter: blur(15px); 
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.5); 
            border-radius: 8px; 
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.4); 
            width: 100%;
            max-width: 550px;
            padding: 40px;
        }

        .glass-header {
            text-align: center;
            margin-bottom: 30px;
            color: #003366;
            border-bottom: 2px solid rgba(0, 51, 102, 0.1);
            padding-bottom: 15px;
        }

        /* 3. Square Inputs */
        .form-control, .form-select, .input-group-text {
            border-radius: 4px; 
            border: 1px solid #ced4da;
            background-color: rgba(255, 255, 255, 0.9); 
        }

        .form-control:focus, .form-select:focus {
            border-color: #003366;
            box-shadow: none;
            border-width: 2px;
            background-color: #fff;
        }

        .input-group-text { color: #6c757d; }
        
        .form-control:focus + .input-group-text, 
        .input-group:focus-within .input-group-text {
            color: #003366;
            border-color: #003366;
            border-width: 2px;
        }

        /* 4. Square Buttons */
        .btn-primary {
            background-color: #003366;
            border-color: #003366;
            border-radius: 4px;
            padding: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background-color: #001f3f;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }
        
        .btn-outline-secondary {
            border-radius: 4px;
            padding: 12px;
            background: rgba(255, 255, 255, 0.6);
            border-color: #6c757d;
        }
        .btn-outline-secondary:hover {
            background: #6c757d;
            color: white;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
      <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold fs-4" href="${pageContext.request.contextPath}/">EMS</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center">
            
            <li class="nav-item px-2">
              <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
            </li>

            <li class="nav-item px-2">
              <a class="nav-link" href="${pageContext.request.contextPath}/add">Add Employee</a>
            </li>

            <li class="nav-item px-2">
              <a class="nav-link" href="${pageContext.request.contextPath}/display">View Employees</a>
            </li>

            <li class="nav-item dropdown px-2">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                Manage
              </a>
              <ul class="dropdown-menu dropdown-menu-end shadow">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/search">Search Emp</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/update">Update Emp</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/delete">Delete Emp</a></li>
              </ul>
            </li>

          </ul>
        </div>
      </div>
    </nav>

    <div class="form-wrapper">
        <div class="glass-card">
            <div class="glass-header">
                <h3 class="mb-0 fw-bold"><i class="fa-solid fa-user-plus me-2"></i> Register Employee</h3>
            </div>
            
            <form action="${pageContext.request.contextPath}/save" method="post">
                
                <div class="input-group mb-4">
                    <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                    <div class="form-floating flex-grow-1">
                        <input type="text" name="name" class="form-control" id="empName" placeholder="Full Name" required>
                        <label for="Name">Full Name</label>
                    </div>
                </div>

                <div class="input-group mb-4">
                    <span class="input-group-text"><i class="fa-solid fa-id-badge"></i></span>
                    <div class="form-floating flex-grow-1">
                        <input type="text" name="empId" class="form-control" id="empId" placeholder="Employee ID" required>
                        <label for="eId">Employee ID</label>
                    </div>
                </div>

                <div class="input-group mb-4">
                    <span class="input-group-text"><i class="fa-solid fa-building"></i></span>
                    <div class="form-floating flex-grow-1">
                        <select name="department" class="form-select" id="empDept">
                            <option value="IT">Information Technology</option>
                            <option value="HR">Human Resources</option>
                            <option value="Finance">Finance</option>
                            <option value="Marketing">Marketing</option>
                        </select>
                        <label for="department]">Department</label>
                    </div>
                </div>

                <div class="input-group mb-5">
                    <span class="input-group-text"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                    <div class="form-floating flex-grow-1">
                        <input type="number" name="salary" class="form-control" id="empSalary" placeholder="Annual Salary">
                        <label for="salery">Annual Salary</label>
                    </div>
                </div>

                <div class="row g-2">
                    <div class="col-sm-8">
                        <button type="submit" class="btn btn-primary w-100 shadow-sm">
                            <i class="fa-solid fa-check me-2"></i> Save Record
                        </button>
                    </div>
                    <div class="col-sm-4">
                        <a href="${pageContext.request.contextPath}/display" class="btn btn-outline-secondary w-100">
                            Cancel
                        </a>
                    </div>
                </div>
                
            </form>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>