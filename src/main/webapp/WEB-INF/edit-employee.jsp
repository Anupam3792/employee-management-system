<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee - EMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Tumhari glassmorphism wali purani CSS yahan copy kar lena */
    </style>
</head>
<body style="background: linear-gradient(-45deg, #0f2027, #2c5364);">

<div class="container mt-5">
    <div class="card p-4 mx-auto" style="max-width: 500px; background: rgba(255,255,255,0.9);">
        <h3 class="text-center mb-4">Edit Employee Record</h3>
        
        <form action="${pageContext.request.contextPath}/update" method="post">
            <input type="hidden" name="empId" value="${employee.empId}">

            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="name" class="form-control" value="${employee.name}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Department</label>
                <select name="department" class="form-select">
                    <option value="IT" ${employee.department == 'IT' ? 'selected' : ''}>IT</option>
                    <option value="HR" ${employee.department == 'HR' ? 'selected' : ''}>HR</option>
                    <option value="Finance" ${employee.department == 'Finance' ? 'selected' : ''}>Finance</option>
                    <option value="Marketing" ${employee.department == 'Marketing' ? 'selected' : ''}>Marketing</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Salary</label>
                <input type="number" name="salary" class="form-control" value="${employee.salary}">
            </div>

            <button type="submit" class="btn btn-primary w-100 shadow-sm">Update Record</button>
            <a href="${pageContext.request.contextPath}/display" class="btn btn-link w-100 mt-2 text-decoration-none">Cancel</a>
        </form>
    </div>
</div>

</body>
</html>