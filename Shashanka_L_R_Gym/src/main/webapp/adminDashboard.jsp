<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        body {
            min-height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
            background-image: url('https://i.ibb.co/SJ4J9Hm/3685cce6-14c2-454c-836f-22bace48038b.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.2rem;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <a class="navbar-brand" href="#">Admin Dashboard</a>

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
                    <a class="nav-link text-white" href="enquiryAct">Enquires</a>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>
