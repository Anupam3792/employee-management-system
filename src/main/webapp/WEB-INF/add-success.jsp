<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success - EMS</title>

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

        /* Wrapper to center the content BELOW the navbar */
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
            max-width: 500px;
            padding: 50px 40px;
            text-align: center;
        }

        .success-icon {
            font-size: 5rem;
            color: #28a745;
            margin-bottom: 20px;
            animation: popIn 0.5s ease-out;
        }

        @keyframes popIn {
            0% { transform: scale(0); opacity: 0; }
            80% { transform: scale(1.1); }
            100% { transform: scale(1); opacity: 1; }
        }

        h2 {
            color: #003366;
            margin-bottom: 15px;
        }

        p.text-muted {
            font-size: 1.1rem;
            margin-bottom: 30px;
        }

        /* 3. Square Buttons */
        .btn-primary {
            background-color: #003366;
            border-color: #003366;
            border-radius: 4px;
            padding: 12px 20px;
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
            padding: 12px 20px;
            background: rgba(255, 255, 255, 0.6);
            border-color: #6c757d;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-outline-secondary:hover {
            background: #6c757d;
            color: white;
            transform: translateY(-2px);
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
            
            <i class="fa-solid fa-circle-check success-icon"></i>
            
            <h2 class="fw-bold">Success!</h2>
            
            <p class="text-muted">Employee record has been added successfully.</p>
            
            <div class="row g-3 mt-2">
                <div class="col-sm-6">
                    <a href="${pageContext.request.contextPath}/display" class="btn btn-outline-secondary w-100 shadow-sm">
                        <i class="fa-solid fa-list-ul me-2"></i> View All
                    </a>
                </div>
                <div class="col-sm-6">
                    <a href="${pageContext.request.contextPath}/add" class="btn btn-primary w-100 shadow-sm">
                        <i class="fa-solid fa-user-plus me-2"></i> Add Another
                    </a>
                </div>
            </div>

        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>