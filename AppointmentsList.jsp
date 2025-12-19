<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.*, com.model.AppointmentModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Appointments</title>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            overflow-x: hidden;
        }

        h1 {
            text-align: center;
            color: #fff;
            margin-top: 30px;
            font-size: 40px;
            letter-spacing: 1px;
            animation: fadeInDown 1s ease;
            text-shadow: 0 3px 10px rgba(0,0,0,0.3);
        }

        .appointment-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 40px auto;
            gap: 30px;
            max-width: 1300px;
            padding-bottom: 50px;
        }

        /* 🌟 GLASS EFFECT CARD */
        .appointment-card {
            width: 300px;
            padding: 20px;
            border-radius: 20px;
            backdrop-filter: blur(15px);
            background: rgba(255, 255, 255, 0.25);
            border: 1px solid rgba(255, 255, 255, 0.35);
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            color: #fff;
            transform: translateY(30px);
            opacity: 0;
            animation: fadeInUp 0.8s ease forwards;
            transition: 0.3s ease-in-out;
        }

        /* ✨ Hover animation */
        .appointment-card:hover {
            transform: translateY(-12px) scale(1.03);
            box-shadow: 0 15px 35px rgba(0,0,0,0.35);
            background: rgba(255, 255, 255, 0.35);
        }

        .appointment-id {
            font-weight: bold;
            color: #ffe600;
            font-size: 18px;
            margin-bottom: 10px;
            text-shadow: 0 1px 3px rgba(0,0,0,0.4);
        }

        .appointment-detail {
            font-size: 15px;
            color: #fff;
            margin-bottom: 7px;
        }

        /* Status Colors */
        .status { font-weight: bold; }
        .status.pending { color: #ffcc00; }
        .status.completed { color: #00ff6a; }
        .status.cancelled { color: #ff4e4e; }

        /* 🌈 Button Neon Effect */
        .back-btn {
            display: block;
            margin: 30px auto;
            padding: 12px 25px;
            background: #4CAF50;
            color: white;
            border-radius: 30px;
            text-align: center;
            width: 260px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s ease;
            box-shadow: 0 0 10px #4CAF50;
        }

        .back-btn:hover {
            background: #45a049;
            box-shadow: 0 0 20px #45a049, 0 0 40px #45a049;
            transform: scale(1.05);
        }

        /* --- ANIMATIONS --- */
        @keyframes fadeInUp {
            0% { transform: translateY(40px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        @keyframes fadeInDown {
            0% { opacity: 0; transform: translateY(-30px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <h1>Your Appointments</h1>

    <div class="appointment-container">
        <%
            List<AppointmentModel> appointments = (List<AppointmentModel>) request.getAttribute("appointments");

            if (appointments != null && !appointments.isEmpty()) {
                int delay = 0;
                for (AppointmentModel a : appointments) {
        %>

            <div class="appointment-card" style="animation-delay: <%= delay %>s;">
                <div class="appointment-id">Appointment ID: <%= a.getAppointment_id() %></div>

                <div class="appointment-detail"><b>Doctor ID:</b> <%= a.getDoctor_id() %></div>
                <div class="appointment-detail"><b>Date:</b> <%= a.getAppointment_date() %></div>
                <div class="appointment-detail"><b>Time:</b> <%= a.getAppointment_time() %></div>
                <div class="appointment-detail"><b>Patient Name:</b> <%= a.getPname() %></div>
                <div class="appointment-detail"><b>Age:</b> <%= a.getAge() %></div>
                <div class="appointment-detail"><b>Mobile:</b> <%= a.getMobile() %></div>
                <div class="appointment-detail"><b>Disease:</b> <%= a.getPdiseas() %></div>

            </div>

        <%
                    delay += 0.1;
                }
            } else {
        %>

            <p style="text-align:center; color:#fff; font-size:20px;">No appointments found.</p>

        <%
            }
        %>
    </div>

</body>
</html>
