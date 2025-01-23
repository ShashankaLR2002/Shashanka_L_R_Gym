<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Enquiries List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <style>
    body {
      min-height: 100vh;
      margin: 0;
      background-color: #212529;
      padding-top: 56px;
    }

    .background-image {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url('https://i.ibb.co/SJ4J9Hm/3685cce6-14c2-454c-836f-22bace48038b.jpg');
      background-size: cover;
      background-position: center;
      z-index: 0;
      opacity: 1;
    }

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.4);
      z-index: 1;
    }

    .container {
      position: relative;
      z-index: 2;
      max-width: 1200px;
      background-color: rgba(255, 255, 255, 0.8);
      padding: 30px;
      border-radius: 10px;
      box-shadow: none;
      overflow-x: auto;
    }

    table {
      width: 100%;
      table-layout: fixed;
      border-collapse: collapse;
      background-color: #343a40;
      color: #fff;
      max-height: 400px;
      overflow-y: auto;
    }

    th, td {
      text-align: center;
      padding: 10px;
      border: 1px solid #555;
    }

    th {
      background-color: #495057;
    }

    tr:hover {
      background-color: #6c757d;
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
          <a class="nav-link text-white" href="logoutAct">Logout</a>
        </li>
      </ul>
    </div>
  </div>

  <div class="background-image"></div>
  <div class="overlay"></div>

  <div class="container">
    <h3 class="text-center" style="color: #212529;">Enquired Details</h3>

    <table id="enquiryTable" class="table">
      <thead>
        <tr>
          <th>Enquiry ID</th>
          <th>Name</th>
          <th>Phone Number</th>
          <th>Area</th>
          <th>Enquired Date</th>
          <th>Enquired By</th>
          <th>Status</th>
          <th>Reason</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="enquiry" items="${enquiryList}" varStatus="status">
          <tr>
            <td>${enquiry.id}</td>
            <td>${enquiry.name}</td>
            <td>${enquiry.phonenumber}</td>
            <td>${enquiry.area}</td>
            <td>${enquiry.enquireddate}</td>
            <td>${enquiry.enquiredby}</td>
            <td>${enquiry.status}</td>
            <td>${enquiry.reason}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
