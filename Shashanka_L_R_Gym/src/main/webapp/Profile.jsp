<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f7f9fc;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            margin-bottom: 30px;
        }

        .navbar-text {
            font-size: 16px;
        }

        .container {
            max-width: 800px;
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            border: 1px solid #ccc;
            margin-top: 50px;
        }

        .form-label {
            font-weight: bold;
        }

        input[type="text"], input[type="email"], input[type="tel"], input[type="file"] {
            font-size: 14px;
            padding: 10px;
            width: 100%;
        }

        #file-upload {
            display: none;
        }

        #file-name {
            font-size: 14px;
            color: #007bff;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary:hover {
            background-color: #e2e2e2;
        }

        @media (max-width: 767px) {
            .container {
                padding: 20px;
            }
        }

    </style>
</head>
<body>

    <!-- Navigation Bar (Copied from Follow-up Details) -->
    <nav class="navbar navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <span class="navbar-text text-white ms-auto">
                Welcome, <c:out value="${Loggedinuser.name}" />
            </span>
        </div>
    </nav>

    <div class="offcanvas offcanvas-start bg-dark text-white" tabindex="-1" id="offcanvasMenu" aria-labelledby="offcanvasMenuLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasMenuLabel">Menu</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body">
            <ul class="list-unstyled">
                <li><a href="ondashboard" class="text-white text-decoration-none d-block py-2">Dashboard</a></li>
                <li><a href="userprofileact" class="text-white text-decoration-none d-block py-2">Profile</a></li>
                <li><a href="viewdetails" class="text-white text-decoration-none d-block py-2">ViewDetails</a></li>
                <li><a href="/logout" class="text-white text-decoration-none d-block py-2">Logout</a></li>
            </ul>
        </div>
    </div>

    <div class="container">
        <form action="updateUserProfile" method="post" enctype="multipart/form-data" id="profileForm">
            <h2 class="mb-4">Basic Information</h2>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter full name" value="<c:out value='${Loggedinuser.name}'/>" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" value="<c:out value='${Loggedinuser.email}'/>" readonly>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="phoneNumber" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" value="<c:out value='${Loggedinuser.phoneNumber}'/>">
                </div>
            </div>

            <h3 class="mb-4">Additional Information</h3>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="age" class="form-label">Age</label>
                    <input type="text" class="form-control" id="age" name="age" placeholder="Enter age" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="gender" class="form-label">Gender</label>
                    <select class="form-select" id="gender" name="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="dob" class="form-label">Date of Birth</label>
                    <input type="date" class="form-control" id="dob" name="dob" required>
                </div>
            </div>

            <h3 class="mb-4">Emergency Contact</h3>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="emName" class="form-label">Emergency Contact Name</label>
                    <input type="text" class="form-control" id="emName" name="emName" placeholder="Enter emergency contact name" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="emContact" class="form-label">Emergency Contact Number</label>
                    <input type="tel" class="form-control" id="emContact" name="emContact" placeholder="Enter emergency contact number" required>
                </div>
            </div>

            <h3 class="mb-4">Health Information</h3>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="currentHeight" class="form-label">Current Height (cm)</label>
                    <input type="text" class="form-control" id="currentHeight" name="currentHeight" placeholder="Enter height in cm" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="currentWeight" class="form-label">Current Weight (kg)</label>
                    <input type="text" class="form-control" id="currentWeight" name="currentWeight" placeholder="Enter weight in kg" required>
                </div>
            </div>

            <div class="mb-4">
                <label for="file-upload" class="btn btn-secondary mb-2">Choose Profile Picture</label>
                <input id="file-upload" type="file" name="Img" class="d-none" accept="image/*" onchange="displayFileName(this)">
                <div id="file-name" class="file-name mt-2"></div>
            </div>

            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function displayFileName(input) {
            var fileName = input.files.length > 0 ? input.files[0].name : 'No file selected';
            document.getElementById('file-name').textContent = fileName;
        }
    </script>
</body>
</html>
