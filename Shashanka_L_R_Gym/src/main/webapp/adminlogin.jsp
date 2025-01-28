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
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('https://i.ibb.co/SJ4J9Hm/3685cce6-14c2-454c-836f-22bace48038b.jpg') center/cover no-repeat;
        }
        .form-container {
            max-width: 400px;
            background: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 10px;
            color: #fff;
        }
        .form-label { font-weight: bold; }
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
    </style>
    <title>Admin Login</title>
</head>
<body>
    <div class="form-container">
        <h3 class="text-center">Admin Login</h3>
        <form action="adminlogin" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control" required onchange="onEmail()">
                <div id="displayemail" style="color: grey; margin-top: 10px;"></div>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>

            </div>
            <button type="submit" class="btn btn-primary w-100">Sign In</button>
        </form>
    </div>
    <script>

    function onEmail() {
      var email = document.getElementById('email');
      emailvalue = email.value;

      if (!emailvalue.includes('@gmail.com') && !emailvalue.includes('@yahoo.com') &&
          !emailvalue.includes('@outlook.com') && !emailvalue.includes('@hotmail.com') &&
          !emailvalue.includes('.edu') && !emailvalue.includes('.org') &&
          !emailvalue.includes('.info') && !emailvalue.includes('.net')) {
        document.getElementById("displayemail").innerHTML = "Enter a valid email address.";
        ajaxValidationStatus.email = false;
        validateForm();
        return;
      } else {
        document.getElementById("displayemail").innerHTML = "";
      }

      var xhttp = new XMLHttpRequest();
      xhttp.open("GET", "http://localhost:8080/Xworkz_CommonModule_Shashank/email/" + emailvalue, true);
      xhttp.send();

      xhttp.onload = function() {
        if (this.status === 200) {
          document.getElementById("displayemail").innerHTML = this.responseText;
          ajaxValidationStatus.email = this.responseText.trim() === "";
        } else {
          ajaxValidationStatus.email = false;
        }
        validateForm();
      };

      xhttp.onerror = function() {
        ajaxValidationStatus.email = false;
        validateForm();
      };
    }

    </script>
</body>
</html>
