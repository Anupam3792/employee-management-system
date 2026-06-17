<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EMS PRO - Premium Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --glass: rgba(255, 255, 255, 0.05);
            --glass-border: rgba(255, 255, 255, 0.1);
            --neon-blue: #00d2ff;
            --neon-green: #00ff88;
        }

        body, html {
            margin: 0; padding: 0; min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            background: #0f172a; /* Deep Dark Blue */
            background-image: 
                radial-gradient(at 0% 0%, rgba(0, 210, 255, 0.15) 0px, transparent 50%),
                radial-gradient(at 100% 100%, rgba(0, 255, 136, 0.1) 0px, transparent 50%);
            color: white;
            overflow-x: hidden;
        }

        .navbar {
            background: rgba(15, 23, 42, 0.8) !important;
            backdrop-filter: blur(15px);
            border-bottom: 1px solid var(--glass-border);
        }

        .hero-section { padding: 140px 0 60px; }

        /* ✨ Glassmorphism Cards */
        .stat-card {
            background: var(--glass);
            backdrop-filter: blur(20px);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            padding: 40px 20px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-12px);
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(255, 255, 255, 0.3);
        }

        /* 🔵 Workforce Glow */
        .workforce-card:hover { box-shadow: 0 20px 40px rgba(0, 210, 255, 0.2); }
        .workforce-card i { color: var(--neon-blue); text-shadow: 0 0 20px rgba(0, 210, 255, 0.5); }

        /* 🟢 Monthly Payroll Glow */
        .payroll-card { border-top: 4px solid var(--neon-green); }
        .payroll-card:hover {
            box-shadow: 0 20px 40px rgba(0, 255, 136, 0.2);
            background: linear-gradient(135deg, rgba(0, 255, 136, 0.05), rgba(255, 255, 255, 0.05));
        }
        .payroll-card i { color: var(--neon-green); text-shadow: 0 0 20px rgba(0, 255, 136, 0.5); }
        .payroll-amount { font-size: 2.8rem; letter-spacing: -1px; color: var(--neon-green); }

        /* 🏢 Dept Badges */
        .dept-chip {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            padding: 6px 14px;
            border-radius: 12px;
            font-size: 0.85rem;
            transition: 0.3s;
        }
        .dept-chip:hover { background: var(--neon-blue); color: #0f172a; border-color: var(--neon-blue); font-weight: 600; }

        /* 🚀 Action Buttons (Purana Style: Bada Icon, Hover Zoom) */
        .action-btn {
            background: var(--glass);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            padding: 30px 20px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            text-decoration: none;
            color: white;
            display: block;
            text-align: center;
        }
        .action-btn i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: var(--neon-blue);
            transition: transform 0.4s ease;
        }
        .action-btn:hover {
            transform: translateY(-10px) scale(1.03);
            background: rgba(0, 210, 255, 0.1);
            border-color: var(--neon-blue);
            box-shadow: 0 15px 30px rgba(0, 210, 255, 0.2);
            color: white;
        }
        .action-btn:hover i {
            transform: scale(1.2) rotate(5deg);
        }

        .status-pill {
            background: rgba(0, 210, 255, 0.1);
            color: var(--neon-blue);
            padding: 4px 16px;
            border-radius: 50px;
            border: 1px solid rgba(0, 210, 255, 0.3);
            font-size: 0.8rem;
            font-weight: 600;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
      <div class="container px-4">
        <a class="navbar-brand fw-bold fs-4" href="${pageContext.request.contextPath}/">
            <i class="fa-solid fa-bolt-lightning me-2 text-info"></i>EMS <span class="text-info">PRO</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item d-none d-lg-block"><span class="status-pill me-3"><i class="fa-solid fa-circle-check me-1"></i> ${testMsg}</span></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/display">View List</a></li>
                
                <c:choose>
                    <c:when test="${not empty sessionScope.adminUser}">
                        <li class="nav-item ms-3"><span class="text-info fw-bold"><i class="fa-solid fa-user-tie me-1"></i> Hi, ${sessionScope.adminUser.username}</span></li>
                        <li class="nav-item ms-3"><a class="btn btn-sm btn-outline-danger px-3" href="${pageContext.request.contextPath}/logout">Logout</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item ms-3"><a class="btn btn-sm btn-outline-info px-3" href="${pageContext.request.contextPath}/login">Admin Login</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
      </div>
    </nav>
    <div class="container hero-section text-center">
        <h1 class="display-4 fw-bold mb-2">Employee Management <span class="text-info">System</span></h1>
        <p class="text-secondary mb-5">Real-time data synchronization with your local workforce</p>

        <div class="row g-4 mb-5 justify-content-center">
            <div class="col-lg-5">
                <div class="stat-card workforce-card h-100">
                    <i class="fa-solid fa-users-viewfinder fa-3x mb-3"></i>
                    <h2 class="display-4 fw-bold">${totalCount}</h2>
                    <p class="text-uppercase small tracking-widest opacity-50">Total Active Workforce</p>
                    <div class="d-flex flex-wrap justify-content-center gap-2 mt-4">
                        <c:forEach items="${deptStats}" var="dept">
                            <div class="dept-chip">${dept.key}: ${dept.value}</div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="stat-card payroll-card h-100">
                    <i class="fa-solid fa-receipt fa-3x mb-3"></i>
                    <h2 class="payroll-amount fw-bold">₹${totalSalary}</h2>
                    <p class="text-uppercase small tracking-widest opacity-50">Monthly Payroll Budget</p>
                    <div class="mt-4 mx-auto" style="max-width: 200px;">
                        <div class="progress" style="height: 8px; background: rgba(255,255,255,0.05); border-radius: 10px;">
                            <div class="progress-bar" style="width: 100%; background: linear-gradient(90deg, #00ff88, #00d2ff);"></div>
                        </div>
                        <p class="small text-secondary mt-2">Disbursement Status: <span class="text-success">Ready</span></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-4 justify-content-center mt-3">
            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/add" class="action-btn">
                    <i class="fa-solid fa-user-plus"></i>
                    <h5 class="fw-bold mb-1">Add Member</h5>
                    <p class="small opacity-75 mb-0">Hire new talent</p>
                </a>
            </div>
            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/display" class="action-btn">
                    <i class="fa-solid fa-users-gear"></i>
                    <h5 class="fw-bold mb-1">Manage Staff</h5>
                    <p class="small opacity-75 mb-0">View & Edit records</p>
                </a>
            </div>
            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/search" class="action-btn">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <h5 class="fw-bold mb-1">Smart Search</h5>
                    <p class="small opacity-75 mb-0">Find by ID instantly</p>
                </a>
            </div>
        </div>
    </div>

    <script src="https://