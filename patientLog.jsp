<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Login</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>

    body {
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #74ebd5, #ACB6E5);
        background-size: 300% 300%;
        animation: bgAnimation 8s ease infinite;
    }

    @keyframes bgAnimation {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    .login-box {
        width: 350px;
        background: #fff;
        padding: 30px 35px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        animation: fadeIn 1s ease forwards;
        opacity: 0;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(25px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
        font-weight: 600;
    }

    label {
        font-size: 14px;
        color: #555;
        font-weight: 500;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 8px 0 15px 0;
        border-radius: 8px;
        border: 1px solid #ccc;
        outline: none;
        transition: 0.3s;
    }

    input:focus {
        border-color: #74ebd5;
        box-shadow: 0 0 5px #74ebd5;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 16px;
        border-radius: 8px;
        transition: 0.3s;
    }

    button:hover {
        background: #45a049;
        transform: translateY(-2px);
    }

    .register-link {
        margin-top: 15px;
        text-align: center;
        font-size: 14px;
    }

    .register-link a {
        text-decoration: none;
        color: #007bff;
        font-weight: 600;
    }

    .register-link a:hover {
        text-decoration: underline;
    }

</style>
</head>

<body>

    <div class="login-box">
        <h2>Patient Login</h2>

        <form action="PatientLog" method="post">

            <label>User Name</label>
            <input type="text" name="username" required />

            <label>Password</label>
            <input type="password" name="password" required />

            <button type="submit">Login</button>
        </form>

        <div class="register-link">
            Don't have an account? <a href="patientReg.html">Register Now</a>
        </div>
    </div>

</body>
</html>
