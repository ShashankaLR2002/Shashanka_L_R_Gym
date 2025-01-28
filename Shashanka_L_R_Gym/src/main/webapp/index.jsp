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
        .top-buttons {
            position: absolute;
            top: 20px;
            right: 20px; /* Aligns the buttons to the right side */
            display: flex;
            gap: 10px;
        }
        .btn {
            border-radius: 20px;
            padding: 10px 20px;
            font-weight: bold;
        }
    </style>
    <title>Admin Login</title>
</head>
<body>
    <div class="top-buttons">
        <a href="userlogin.jsp" class="btn btn-light">User Login</a>
        <a href="adminlogin.jsp" class="btn btn-light">Admin Login</a>
    </div>
</body>
</html>
