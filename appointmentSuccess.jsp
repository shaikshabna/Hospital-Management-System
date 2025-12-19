<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #4CAF50, #1dbf73);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        animation: fadeIn 1.5s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    .box {
        text-align: center;
        background: #fff;
        padding: 40px;
        width: 420px;
        border-radius: 18px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        animation: popUp 1s ease forwards;
        transform: scale(0.8);
        opacity: 0;
    }

    @keyframes popUp {
        to { transform: scale(1); opacity: 1; }
    }

    .tick {
        font-size: 60px;
        color: #4CAF50;
        animation: tickPop 0.6s ease-out;
    }

    @keyframes tickPop {
        0% { transform: scale(0); opacity: 0; }
        100% { transform: scale(1); opacity: 1; }
    }

    .success-text {
        font-size: 24px;
        font-weight: 600;
        margin-top: 15px;
    }

    .btn-home {
        margin-top: 25px;
        padding: 12px 20px;
        background: #4CAF50;
        border: none;
        color: white;
        font-size: 17px;
        border-radius: 10px;
        cursor: pointer;
        transition: 0.3s;
        text-decoration: none;
        display: inline-block;
    }

    .btn-home:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 20px rgba(0,0,0,0.25);
    }
</style>

</head>
<body>
<%
    com.model.AppointmentModel patient = (com.model.AppointmentModel) request.getAttribute("pId");
%>
<div class="box">
    <div class="tick">✔</div>
    <p>Patient ID: <%= patient.getPatient_id() %></p>
    <div class="success-text">
        Appointment Booked Successfully!
    </div>
    

    
    <form action="index.html" method="post">
    <input type="hidden" name="patient_id" value="<%= patient.getPatient_id() %>">
    <button class="btn-home">ok</button>
    </form>
    
</div>

</body>
</html>
