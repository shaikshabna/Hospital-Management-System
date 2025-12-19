<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient List</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            background-size: 300% 300%;
            animation: bgMove 10s ease infinite;
        }

        @keyframes bgMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 30px;
            font-size: 32px;
            animation: fadeDown 1s ease;
        }

        @keyframes fadeDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .table-container {
            width: 90%;
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            animation: fadeUp 1.2s ease;
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(25px); }
            to { opacity: 1; transform: translateY(0); }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        th {
            background: #4CAF50;
            color: white;
            padding: 12px;
            text-align: left;
            font-size: 17px;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            transition: background 0.3s ease;
        }

        tr:hover td {
            background: #f1f1f1;
        }

        .no-data {
            text-align: center;
            color: white;
            font-size: 20px;
            margin-top: 40px;
            animation: fadeDown 1s ease;
        }

        .btn {
            display: block;
            width: 250px;
            margin: 25px auto;
            padding: 12px;
            text-align: center;
            background: #007bff;
            color: white;
            border-radius: 10px;
            text-decoration: none;
            font-size: 18px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn:hover {
            background: #0056b3;
            transform: translateY(-3px);
        }
    </style>
</head>

<body>

    <h2>All Patients</h2>

    <!-- If no patient records exist -->
    <c:if test="${empty patientList}">
        <p class="no-data">No patient records found.</p>
    </c:if>

    <!-- If patient list exists -->
    <c:if test="${not empty patientList}">
        <div class="table-container">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Contact</th>
                    <th>Address</th>
                </tr>

                <c:forEach var="p" items="${patientList}">
                    <tr>
                        <td>${p.patientId}</td>
                        <td>${p.name}</td>
                        <td>${p.gender}</td>
                        <td>${p.dob}</td>
                        <td>${p.contact}</td>
                        <td>${p.address}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </c:if>

    <a href="patientForm.jsp" class="btn">Register New Patient</a>

</body>
</html>
