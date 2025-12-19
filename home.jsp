<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.model.DoctorModel, com.model.PatientModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Doctors</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #7F7FD5, #86A8E7, #91EAE4);
        background-size: 300% 300%;
        animation: bgAnimation 10s ease infinite;
        margin: 0;
        padding: 0;
    }

    @keyframes bgAnimation {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    h1 {
        text-align: center;
        color: white;
        margin-top: 30px;
        font-size: 35px;
        animation: fadeInDown 1s ease;
    }

    p {
        text-align: center;
        color: #f2f2f2;
        font-size: 18px;
        margin-top: -10px;
        animation: fadeIn 1s ease;
    }

    .top-buttons {
        text-align: center;
        margin-top: 20px;
    }

    .btn {
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        margin: 10px;
        transition: 0.3s ease;
        color: white;
    }

    .logout {
        background: #ff4d4d;
    }

    .logout:hover {
        background: #ff2a2a;
        transform: translateY(-3px);
    }

    .view-app {
        background: #2ecc71;
    }

    .view-app:hover {
        background: #27ae60;
        transform: translateY(-3px);
    }

    .doctor-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin: 50px auto;
        gap: 30px;
        max-width: 1200px;
    }

    .doctor-card {
        width: 260px;
        padding: 20px;
        border-radius: 20px;
        background: #ffffffcc;
        backdrop-filter: blur(5px);
        box-shadow: 0 6px 25px rgba(0,0,0,0.15);
        text-align: center;
        transform: translateY(20px);
        opacity: 0;
        animation: fadeInUp 0.8s forwards;
        transition: 0.3s ease;
    }

    .doctor-card:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 35px rgba(0,0,0,0.25);
    }

    .doctor-avatar {
        width: 90px;
        height: 90px;
        border-radius: 50%;
        background: linear-gradient(135deg, #6dd5ed, #2193b0);
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto 15px;
        font-size: 38px;
        color: white;
        box-shadow: 0 3px 10px rgba(0,0,0,0.2);
    }

    .doctor-name {
        font-size: 20px;
        font-weight: bold;
        color: #333;
    }

    .doctor-specialization {
        color: #555;
        margin-top: 5px;
        font-size: 15px;
    }

    .doctor-mobile {
        color: #777;
        margin-top: 10px;
        font-size: 14px;
    }

    .book-btn {
        display: block;
        padding: 10px 20px;
        background: #3498db;
        color: white;
        border-radius: 10px;
        text-decoration: none;
        margin-top: 15px;
        transition: 0.3s ease;
    }

    .book-btn:hover {
        background: #2980b9;
        transform: translateY(-3px);
    }

    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(25px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes fadeInDown {
        from { opacity: 0; transform: translateY(-25px); }
        to { opacity: 1; transform: translateY(0); }
    }

</style>
</head>
<body>

<%
    com.model.PatientModel patient = (com.model.PatientModel)session.getAttribute("loggedInPatient");
%>

<h1>Welcome, <%= patient.getUserName() %> 👋</h1>
<p>Patient ID: <%= patient.getPatient_id() %></p>

<div class="top-buttons">
    <form action="LogoutServletCon" method="post" style="display:inline;">
        <button class="btn logout">Logout</button>
    </form>
    
    <form action="PatientAppointmentListController" method="post" style="display:inline;">
        <input type="hidden" name="patient_id" value="<%=patient.getPatient_id()%>">
        <button class="btn view-app">View Appointments</button>
    </form>
</div>

<div class="doctor-container">
<%
    List<DoctorModel> doctors = (List<DoctorModel>) request.getAttribute("doctorList");

    if (doctors != null && !doctors.isEmpty()) {
        double delay = 0;

        for (DoctorModel d : doctors) {
%>

    <div class="doctor-card" style="animation-delay: <%= delay %>s;">
        <div class="doctor-avatar">👨‍⚕️</div>
        <div class="doctor-name"><%= d.getDname() %></div>
        <div class="doctor-specialization"><%= d.getSpecialization() %></div>
        <div class="doctor-mobile">📞 <%= d.getMobile() %></div>

        <a class="book-btn" 
           href="appointmentForm.jsp?doctor_id=<%= d.getDoctorId() %>&patient_id=<%= patient.getPatient_id() %>">
            Book Appointment
        </a>
    </div>

<%
            delay += 0.15;
        }
    } else {
%>
    <p style="color:white; font-size:20px;">No doctors available right now.</p>
<%
    }
%>
</div>

</body>
</html>
