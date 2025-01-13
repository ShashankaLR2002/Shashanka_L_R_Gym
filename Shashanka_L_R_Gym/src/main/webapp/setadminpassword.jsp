<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      background-color: #f0f2f5;
    }
    .form-container {
      max-width: 400px;
      padding: 30px;
      background: #ffffff;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }
    h3 {
      font-weight: 600;
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }
    .form-label {
      font-weight: bold;
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="container form-container">
    <h3>Set Your Password</h3>
    <form action="adminpasswordset" method="post">
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" id="email" name="email" value="${Loggedinadmin.email}" readonly required class="form-control">
      </div>
      <div class="mb-3">
        <label for="newPassword" class="form-label">Password</label>
        <input type="password" id="password" name="newPassword" required class="form-control">
      </div>
      <button type="submit" class="btn btn-primary w-100">Set Password</button>
    </form>
  </div>
</body>
</html>
