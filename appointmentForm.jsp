<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #74ebd5, #ACB6E5);
        margin: 0;
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

    .form-container {
        background: #fff;
        padding: 40px 45px;
        width: 420px;
        border-radius: 18px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.18);
        animation: popUp 0.9s ease forwards;
        opacity: 0;
        transform: translateY(40px) scale(0.95);
        position: relative;
        overflow: hidden;
    }

    @keyframes popUp {
        to { opacity: 1; transform: translateY(0) scale(1); }
    }

    .form-container:hover {
        box-shadow: 0 15px 30px rgba(0,0,0,0.25);
        transform: scale(1.02);
    }

    .header {
        background: linear-gradient(to right, #4CAF50, #1dbf73);
        padding: 12px 0;
        text-align: center;
        color: white;
        font-size: 22px;
        border-radius: 10px;
        margin-bottom: 25px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        animation: slideDown 1s ease;
    }

    @keyframes slideDown {
        from { transform: translateY(-25px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    .input-group {
        margin-top: 20px;
        position: relative;
    }

    .input-group input {
        width: 100%;
        padding: 12px 10px;
        border-radius: 10px;
        border: 1px solid #ccc;
        outline: none;
        font-size: 15px;
        transition: 0.3s ease;
    }

    .input-group input:focus {
        border-color: #4CAF50;
        box-shadow: 0 0 8px rgba(76,175,80,0.5);
    }

    .input-group label {
        position: absolute;
        top: -10px;
        left: 10px;
        background: #fff;
        padding: 0 6px;
        font-size: 13px;
        color: #4CAF50;
        font-weight: bold;
        animation: floatLabel 0.8s ease;
    }

    @keyframes floatLabel {
        from { opacity: 0; transform: translateY(5px); }
        to { opacity: 1; transform: translateY(0); }
    }

    button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 10px;
        margin-top: 25px;
        font-size: 17px;
        font-weight: bold;
        color: white;
        cursor: pointer;
        background: linear-gradient(to right, #4CAF50, #1dbf73);
        transition: 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    button:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 20px rgba(0,0,0,0.25);
    }

    button:active {
        transform: scale(0.95);
    }

    /* Button Ripple Effect */
    button::after {
        content: "";
        position: absolute;
        background: rgba(255,255,255,0.4);
        width: 0;
        height: 0;
        border-radius: 50%;
        left: var(--x);
        top: var(--y);
        transform: translate(-50%, -50%);
        transition: width 0.5s ease, height 0.5s ease;
    }
    button:active::after {
        width: 200px;
        height: 200px;
    }
</style>

<script>
    // Button ripple animation
    document.addEventListener("DOMContentLoaded", () => {
        document.querySelector("button").addEventListener("click", function(e){
            let rect = this.getBoundingClientRect();
            this.style.setProperty('--x', e.clientX - rect.left + "px");
            this.style.setProperty('--y', e.clientY - rect.top + "px");
        });
    });
</script>

</head>
<body>

    <div class="form-container">

        <div class="header">Book Appointment</div>

        <form action="AppointmentFormController" method="post">
            <input type="hidden" name="patient_id" value="<%= request.getParameter("patient_id") %>">
            <input type="hidden" name="doctor_id" value="<%= request.getParameter("doctor_id") %>">

            <div class="input-group">
                <label>Appointment Date</label>
                <input type="date" name="appointment_date" required>
            </div>

            <div class="input-group">
                <label>Appointment Time</label>
                <input type="time" name="appointment_time" required>
            </div>

            <div class="input-group">
                <label>Patient Name</label>
                <input type="text" name="pname" required>
            </div>

            <div class="input-group">
                <label>Age</label>
                <input type="number" name="age" required>
            </div>

            <div class="input-group">
                <label>Mobile Number</label>
                <input type="number" name="mobile" required>
            </div>

            <div class="input-group">
                <label>Disease</label>
                <input type="text" name="pdiseas" required>
            </div>

            <button type="submit">Book Now</button>
        </form>

    </div>

</body>
</html>
