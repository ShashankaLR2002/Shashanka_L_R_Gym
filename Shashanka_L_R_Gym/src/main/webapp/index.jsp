<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('https://i.ibb.co/SJ4J9Hm/3685cce6-14c2-454c-836f-22bace48038b.jpg') center/cover no-repeat;
        }

        .logo-container {
            position: absolute;
            top: 20px;
            left: 20px;
        }
        .logo-container img {
            height: 50px; /* Adjust as needed */
        }

        .top-buttons {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            gap: 10px;
        }
        .btn {
            border-radius: 20px;
            padding: 10px 20px;
            font-weight: bold;
        }

        .gym-name {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            text-align: center;
            font-size: 3rem;
            font-weight: bold;
            color: white;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
        }
    </style>
    <title>Admin Login</title>
</head>
<body>
    <div class="logo-container">
        <img src="https://www.shutterstock.com/image-vector/fitness-gym-logo-icons-sport-260nw-1661439190.jpg" alt="Logo">
    </div>

    <h1 class="gym-name">Iron Beast Fitness</h1>

    <div class="top-buttons">
        <a href="userlogin.jsp" class="btn btn-light">User Login</a>
        <a href="adminlogin.jsp" class="btn btn-light">Admin Login</a>
    </div>
</body>
</html>
