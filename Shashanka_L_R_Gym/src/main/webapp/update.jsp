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
      max-width: 1500px;
      background-color: rgba(255, 255, 255, 0.8);
      padding: 30px;
      border-radius: 10px;
      overflow-x: auto;
    }

    table {
      width: 100%;
      table-layout: auto;
      border-collapse: collapse;
      background-color: #343a40;
      color: #fff;
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

    .btn-update {
      width: 100%;
      background-color: #007bff;
      color: white;
      border: none;
      padding: 5px;
      border-radius: 5px;
    }

    .btn-update:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <nav class="navbar navbar-dark bg-dark fixed-top">
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

  <div class="background-image"></div>
  <div class="overlay"></div>

  <div class="container">
    <h3 class="text-center text-dark">Registered Details</h3>
     <form method="GET" action="getreglist" class="mb-3">
          <div class="input-group">
            <input type="text" class="form-control" name="search" placeholder="Search by any field" value="${param.search}">
            <button type="submit" class="btn btn-primary">Filter</button>
          </div>
        </form>

    <c:choose>
      <c:when test="${not empty successMessage}">
        <div class="alert alert-success mt-2">${successMessage}</div>
      </c:when>
      <c:when test="${not empty errorMessage}">
        <div class="alert alert-danger mt-2">${errorMessage}</div>
      </c:when>
    </c:choose>

    <c:if test="${not empty registrationentityforupdate}">
      <table id="registrationTable" class="table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Package</th>
            <th>Trainer</th>
            <th>Amount</th>
            <th>Amount Paid</th>
            <th>Balance</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="register" items="${registrationentityforupdate}" varStatus="status">
            <tr>
              <form action="Regdataupdateaction" method="POST">
                <input type="hidden" name="id" value="${register.id}" />
                <td>${register.name}</td>
                <td>
                  <input type="email" name="email" value="${register.email}" class="form-control mb-2" readonly placeholder="Email" />
                </td>
                <td>
                  <input type="text" name="phoneNumber" value="${register.phoneNumber}" class="form-control mb-2" readonly placeholder="Phone Number" />
                </td>
                <td>
                  <select name="PackageName" class="form-control mb-2 package" onchange="updateAmountAndBalance(this)">
                    <option value="Silver" ${register.packageName == 'Silver' ? 'selected' : ''}>Silver</option>
                    <option value="Premium" ${register.packageName == 'Premium' ? 'selected' : ''}>Premium</option>
                  </select>
                </td>
                <td>
                  <input type="text" name="trainer" value="${register.trainer}" class="form-control mb-2" placeholder="Trainer" />
                </td>
                <td>
                  <input type="number" name="amount" value="${register.amount}" class="form-control mb-2 amount" readonly />
                </td>

                <td>
                  <input type="number" name="amountpaid" value="${register.amountpaid}" class="form-control mb-2 amountpaid" placeholder="Amount Paid" step="0.01" oninput="updateBalance(this)" />
                </td>

                <td>
                  <input type="number" name="balance" value="${register.balance}" class="form-control mb-2 balance" readonly />
                </td>
                <td>
                  <button type="submit" class="btn-update">Update</button>
                  <a href="showregupdetails?id=${register.id}" class="btn btn-secondary btn-sm ms-2">View</a>
                </td>
              </form>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:if>
  </div>

  <script>
    function updateAmountAndBalance(selectElement) {
      const row = selectElement.closest('tr');
      const packageName = selectElement.value;
      const amountField = row.querySelector('.amount');
      const amountPaidField = row.querySelector('.amountpaid');
      const balanceField = row.querySelector('.balance');

      let amount = 0;

      if (packageName === 'Silver') {
        amount = 5000;
      } else if (packageName === 'Premium') {
        amount = 10000;
      }

      amountField.value = amount;
      const paid = parseFloat(amountPaidField.value || 0);
      balanceField.value = amount - paid;
    }

    function updateBalance(amountPaidInput) {
      const row = amountPaidInput.closest('tr');
      const amountField = row.querySelector('.amount');
      const balanceField = row.querySelector('.balance');

      const totalAmount = parseFloat(amountField.value || 0);
      const paid = parseFloat(amountPaidInput.value || 0);
      balanceField.value = totalAmount - paid;
    }
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
