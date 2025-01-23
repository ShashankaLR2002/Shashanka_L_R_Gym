<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enquiry Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: url('https://i.ibb.co/SJ4J9Hm/3685cce6-14c2-454c-836f-22bace48038b.jpg') no-repeat center center fixed;
            background-size: cover;
            padding-top: 56px; /* Space for the fixed navbar */
        }

        .card {
            width: 100%;
            max-width: 600px;
            background-color: rgba(0, 0, 0, 0.75);
            color: #fff;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
        }

        .card-header {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .form-control,
        .form-select {
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
            border: 1px solid #ddd;
        }

        .form-control::placeholder,
        .form-select {
            color: #ccc;
        }

        .form-control:focus,
        .form-select:focus {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
            box-shadow: none;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <!-- Hamburger Menu -->
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <span class="navbar-text text-white ms-auto">
                Welcome, <c:out value="${Loggedinadmin.name}" />
            </span>
        </div>
    </nav>

    <div class="offcanvas offcanvas-start bg-dark text-white" tabindex="-1" id="offcanvasMenu" aria-labelledby="offcanvasMenuLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasMenuLabel">Menu</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link text-white" href="enquiryAct">Enquiries</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="followupAct">Follow-ups</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="registrationAct">Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="Regupdateact">Update</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="enquiredlistviewing">Enquired Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="logoutAct">Logout</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-header text-center">
            <h4>Enquiry Form</h4>
        </div>
        <div class="card-body">
            <form action="enquirysave" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required onchange="onname()">
                            <div id="displayName" style="color: grey; margin-top: 10px;"></div>

                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="area" class="form-label">Area</label>
                        <input type="text" class="form-control" id="area" name="area" placeholder="Enter your area" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="phone" name="phonenumber" placeholder="Enter your phone number" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="distance" class="form-label">Distance</label>
                        <input type="number" class="form-control" id="distance" name="distance" placeholder="Enter distance in kilometers" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="age" class="form-label">Age</label>
                        <input type="number" class="form-control" id="age" name="age" placeholder="Enter your age" required>
                    </div>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
    <script>

    function onname() {
         var name = document.getElementById('name');
         var namevalue = name.value;

         if (namevalue.trim().length < 4) {
           document.getElementById("displayName").innerHTML = "Name must be at least 4 characters long.";
           ajaxValidationStatus.name = false;
           validateForm();
           return;
         } else {
           document.getElementById("displayName").innerHTML = "";
         }

         var xhttp = new XMLHttpRequest();
         xhttp.open("GET", "http://localhost:8080/Xworkz_CommonModule_Shashank/name/" + namevalue, true);
         xhttp.send();

         xhttp.onload = function() {
           if (this.status === 200) {
             document.getElementById("displayName").innerHTML = this.responseText;
             ajaxValidationStatus.name = this.responseText.trim() === "";
           } else {
             ajaxValidationStatus.name = false;
           }
           validateForm();
         };

         xhttp.onerror = function() {
           ajaxValidationStatus.name = false;
           validateForm();
         };
       }

      </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
