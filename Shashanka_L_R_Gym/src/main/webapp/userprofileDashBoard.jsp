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
            background: #f7f9fc;
            margin: 0;
            padding: 0;
        }
        .profile-container {
            max-width: 800px;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
        }


        .profile-picture img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #007bff;
        }

        .form-section {
            border-top: 1px solid #e9ecef;
            padding-top: 20px;
            margin-top: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: none;
        }
    </style>
    <title>User Profile</title>
</head>

<body>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid d-flex align-items-center">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="d-flex align-items-center ms-auto">
                <c:if test="${not empty imageName}">
                    <img src="${pageContext.request.contextPath}/uploads/${imageName}" alt="Profile Picture" class="rounded-circle me-2" width="40" height="40" style="object-fit: cover;">
            </c:if>

                <span class="navbar-text text-white">
                    Welcome, <c:out value="${Loggedinuser.name}" />
                </span>

            </div>
        </div>
    </nav>

    <div class="offcanvas offcanvas-start bg-dark text-white" tabindex="-1" id="offcanvasMenu" aria-labelledby="offcanvasMenuLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasMenuLabel">Menu</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="list-unstyled">
                <li><a href="/dashboard" class="text-white text-decoration-none d-block py-2">Dashboard</a></li>
                <li><a href="userprofileact" class="text-white text-decoration-none d-block py-2">Profile</a></li>
                <li><a href="viewdetails" class="text-white text-decoration-none d-block py-2">Viewdetails</a></li>
                <li><a href="" class="text-white text-decoration-none d-block py-2">TrainerAllotments</a></li>
                <li><a href="/logout" class="text-white text-decoration-none d-block py-2">Logout</a></li>

            </ul>
            </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>


</html>
