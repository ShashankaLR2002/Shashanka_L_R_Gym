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
      flex-direction: column;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      background-color: #f0f2f5;
    }
    header {
      width: 100%;
      background-color: #343a40;
      color: #fff;
    }
    h1 {
      font-size: 2rem;
      text-align: center;
    }
    .form-container {
      max-width: 400px;
      background: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }
    .form-label {
      font-weight: bold;
    }
  </style>
</head>
<body>
  <header class="py-3 mb-4">
    <h1>Admin Login</h1>
  </header>
  <div class="container form-container">
    <h3 class="text-center mb-4">Sign In</h3>
    <form action="adminlogin" method="post">
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" id="email" name="email" required class="form-control">
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" id="password" name="password" required class="form-control">
      </div>
      <button type="submit" class="btn btn-primary w-100">Sign In</button>
    </form>
  </div>
</body>
</html>
