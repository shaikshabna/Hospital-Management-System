<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    com.model.DoctorModel doctor = (com.model.DoctorModel)session.getAttribute("loggedInDoctor");

    if(doctor == null){
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #4e54c8, #8f94fb);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        animation: fadeIn 1.5s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .dashboard-container {
        background: white;
        width: 420px;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0px 8px 25px rgba(0,0,0,0.2);
        text-align: center;
        animation: slideUp 1.2s ease;
    }

    @keyframes slideUp {
        from { transform: translateY(30px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    h1 {
        color: #333;
    }

    .doctor-info {
        background: #f6f6ff;
        padding: 15px;
        border-radius: 10px;
        margin-bottom: 20px;
        border-left: 5px solid #4e54c8;
    }

    .buttons {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    button {
        padding: 12px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        transition: transform 0.2s, background 0.3s;
    }

    .logout-btn {
        background: #ff6b6b;
        color: white;
    }

    .logout-btn:hover {
        background: #ff4757;
        transform: scale(1.05);
    }

    .view-btn {
        background: #4e54c8;
        color: white;
    }

    .view-btn:hover {
        background: #6a6ef7;
        transform: scale(1.05);
    }

</style>
</head>
<body>

<div class="dashboard-container">

    <h1>👨‍⚕️ Welcome, <%= doctor.getDname() %></h1>

    <div class="doctor-info">
        <p><strong>Doctor ID:</strong> <%= doctor.getDoctorId() %></p>
        <p><strong>Specialization:</strong> <%= doctor.getSpecialization() %></p>
    </div>

    <div class="buttons">

        <form action="DoctorAppointmentListController" method="post">
            <input type="hidden" name="doctor_id" value="<%= doctor.getDoctorId() %>">
            <button class="view-btn" type="submit">View Appointments</button>
        </form>

        <form action="DoctorLogoutServlet" method="post">
            <button class="logout-btn" type="submit">Logout</button>
        </form>

    </div>

</div>

</body>
</html>
