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

        .error-message {
            color: red;
            font-size: 0.875em;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
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
                                     <a class="nav-link text-white" href="trainersAllotmentact">Trainer Allotments</a>
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
            <c:choose>
                <c:when test="${not empty successMessage}">
                    <div class="alert alert-success text-center">
                        <c:out value="${successMessage}" />
                    </div>
                </c:when>
                <c:when test="${not empty errorMessage}">
                    <div class="alert alert-danger text-center">
                        <c:out value="${errorMessage}" />
                    </div>
                </c:when>
            </c:choose>

            <form action="enquirysave" method="post" onsubmit="return validateForm()">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required oninput="validateName()" onblur="validateName()">
                        <div id="nameError" class="error-message"></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required oninput="validateEmail()" onblur="validateEmail()">
                        <div id="emailError" class="error-message"></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="area" class="form-label">Area</label>
                        <input type="text" class="form-control" id="area" name="area" placeholder="Enter your area" required oninput="validateArea()" onblur="validateArea()">
                        <div id="areaError" class="error-message"></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="phone" name="phonenumber" placeholder="Enter your phone number" required oninput="validatePhone()" onblur="validatePhone()">
                        <div id="phoneError" class="error-message"></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="distance" class="form-label">Distance</label>
                        <input type="number" class="form-control" id="distance" name="distance" placeholder="Enter distance in kilometers" required oninput="validateDistance()" onblur="validateDistance()">
                        <div id="distanceError" class="error-message"></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="age" class="form-label">Age</label>
                        <input type="number" class="form-control" id="age" name="age" placeholder="Enter your age" required oninput="validateAge()" onblur="validateAge()">
                        <div id="ageError" class="error-message"></div>
                    </div>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function validateName() {
            const name = document.getElementById('name').value;
            const nameError = document.getElementById('nameError');
            if (name.trim().length < 4) {
                nameError.textContent = 'Name must be at least 4 characters long.';
                return false;
            } else {
                nameError.textContent = '';
                return true;
            }
        }

        function validateEmail() {
            const email = document.getElementById('email').value;
            const emailError = document.getElementById('emailError');
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const allowedDomains = ['gmail.com', 'yahoo.com', 'outlook.com', 'hotmail.com', 'edu', 'org', 'info', 'net'];

            if (!emailPattern.test(email)) {
                emailError.textContent = 'Please enter a valid email address.';
                return false;
            }

            const domain = email.split('@')[1];
            if (!allowedDomains.some(allowedDomain => domain.includes(allowedDomain))) {
                emailError.textContent = 'Email must be from a valid domain ';
                return false;
            } else {
                emailError.textContent = '';
                return true;
            }
        }

        function validateArea() {
            const area = document.getElementById('area').value;
            const areaError = document.getElementById('areaError');
            const areaPattern = /^[A-Za-z\s]+$/; // Only letters and spaces allowed

            if (!areaPattern.test(area)) {
                areaError.textContent = 'Area must contain only letters ';
                return false;
            } else {
                areaError.textContent = '';
                return true;
            }
        }

        function validatePhone() {
            const phone = document.getElementById('phone').value;
            const phoneError = document.getElementById('phoneError');
            const phonePattern = /^\d{10}$/;
            if (!phonePattern.test(phone)) {
                phoneError.textContent = 'Please enter a valid 10-digit phone number.';
                return false;
            } else {
                phoneError.textContent = '';
                return true;
            }
        }

        function validateDistance() {
            const distance = document.getElementById('distance').value;
            const distanceError = document.getElementById('distanceError');
            if (distance <= 0) {
                distanceError.textContent = 'Distance must be greater than 0.';
                return false;
            } else {
                distanceError.textContent = '';
                return true;
            }
        }

        function validateAge() {
            const age = document.getElementById('age').value;
            const ageError = document.getElementById('ageError');
            if (age <= 0 || age > 120) {
                ageError.textContent = 'Please enter a valid age.';
                return false;
            } else {
                ageError.textContent = '';
                return true;
            }
        }

        function validateForm() {
            const isNameValid = validateName();
            const isEmailValid = validateEmail();
            const isAreaValid = validateArea();
            const isPhoneValid = validatePhone();
            const isDistanceValid = validateDistance();
            const isAgeValid = validateAge();

            return isNameValid && isEmailValid && isAreaValid && isPhoneValid && isDistanceValid && isAgeValid;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>