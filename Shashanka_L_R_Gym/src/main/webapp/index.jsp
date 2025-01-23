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
      background-image: url('https://i.ibb.co/SJ4J9Hm/3685cce6-14c2-454c-836f-22bace48038b.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }
    header {
      width: 100%;
      background-color: rgba(0, 0, 0, 0.8);
      color: #fff;
    }
    h1 {
      font-size: 2rem;
      text-align: center;
      font-weight: bold;
      text-transform: uppercase;
    }
    .form-container {
      max-width: 400px;
      background: rgba(0, 0, 0, 0.8);
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
    }
    .form-container h3 {
      color: #fff;
      font-weight: bold;
      text-align: center;
    }
    .form-label {
      color: #ddd;
      font-weight: bold;
    }
    .form-control {
      background: rgba(255, 255, 255, 0.1);
      color: #fff;
      border: 1px solid #ddd;
    }
    .form-control:focus {
      background: rgba(255, 255, 255, 0.2);
      border-color: #007bff;
      color: #fff;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
      font-weight: bold;
      text-transform: uppercase;
    }
    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }
  </style>
</head>
<body>
  <header class="py-3 mb-4">
    <h1>Admin Login</h1>
  </header>
  <div class="container form-container">
    <h3>Sign In</h3>
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
