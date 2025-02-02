<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        body {
            background-color: #000;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
            position: relative;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            z-index: 1;
        }
        .container {
            background: rgba(0, 0, 0, 0.6);
            color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            max-width: 700px;
            width: 100%;
            z-index: 2;
            position: relative;
        }
        .header h3 {
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
            color: #fff;
        }
        label {
            font-size: 14px;
            font-weight: bold;
            color: #ccc;
        }
        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
            border: 1px solid #ddd;
        }
        .form-control::placeholder {
            font-size: 13px;
            color: #aaa;
        }
        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
            box-shadow: none;
        }
        .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .background-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://i.ibb.co/SJ4J9Hm/3685cce6-14c2-454c-836f-22bace48038b.jpg');
            background-size: cover;
            background-position: center;
            z-index: 0;
        }
        .error-message {
            color: red;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>

    <div class="container">
        <div class="header">
            <h3>Registration</h3>
        </div>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger mt-3">${errorMessage}</div>
        </c:if>
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success mt-3">${successMessage}</div>
        </c:if>
        <form action="register" method="post" onsubmit="return validateForm()">
            <div class="row g-3">
                <div class="col-md-6 form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required onchange="onName()">
                    <span id="displayName" class="error-message"></span>
                </div>

                <div class="col-md-6 form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required onchange="onEmail()">
                <div id="displayemail" class="error-message" style="color: grey; margin-top: 10px;"></div>
                </div>

                <div class="col-md-6 form-group">
                    <label for="gymName">Gym Name</label>
                    <input type="text" class="form-control" id="gymName" name="gymName" placeholder="Enter Gym Name" required>
                </div>

                <div class="col-md-6 form-group">
                    <label for="Package">Gym Package</label>
                    <select class="form-control" id="PackageName" name="PackageName" onchange="updatePackageAmount()" required>
                        <option value="" data-amount="0" style="color: black;">-- Select Package --</option>
                        <option value="Silver" style="color: black;" data-amount="5000">Silver - 5000</option>
                        <option value="Premium" style="color: black;" data-amount="10000">Premium - 10000</option>
                    </select>
                </div>

                <div class="col-md-6 form-group">
                    <label for="amount">Package Amount</label>
                    <input type="number" step="0.01" class="form-control" id="amount" name="amount" readonly required>
                </div>

                <div class="col-md-6 form-group">
                    <label for="discount">Discount (%)</label>
                    <input type="number" step="0.01" class="form-control" id="discount" name="discount" placeholder="Enter discount" required oninput="calculateFields()">
                </div>

                <div class="col-md-6 form-group">
                    <label for="balance">Balance</label>
                    <input type="number" step="0.01" class="form-control" id="balance" name="balance" readonly required>
                </div>

                <div class="col-md-6 form-group">
                    <label for="numInstallments">Number of Installments</label>
                    <select class="form-control" id="numInstallments" name="numInstallments" onchange="calculateFields()" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3" selected>3</option>
                    </select>
                </div>

                <div class="col-md-6 form-group">
                    <label for="installment">Installment</label>
                    <input type="number" step="0.01" class="form-control" id="installment" name="installment" readonly required>
                </div>

                <div class="col-md-6 form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Enter your phone number" required onchange="onPhoneNumber()">
                    <span id="displayPhoneNumber" class="error-message"></span>
                </div>

                <div class="col-md-6 form-group">
                    <label for="Trainer">Trainer</label>
                    <input type="text" class="form-control" id="trainer" name="trainer" placeholder="Enter Trainer Name" required>
                </div>

                <div class="col-md-6 form-group">
                    <label for="amountpaid">Amount Paid</label>
                    <input type="number" step="0.01" class="form-control" id="amountpaid" name="amountpaid" placeholder="Enter Amount Paid" oninput="calculateFields()" required>
                </div>

                <div class="col-md-6 form-group">
                    <label for="fullPayment">Full Payment Made</label>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="fullPayment" name="fullPayment" onchange="toggleFullPayment()">
                    </div>
                </div>
            </div>

            <button type="submit" id="submitBtn" class="btn btn-primary mt-4" disabled>Save</button>
        </form>


    </div>

    <script>
        window.onload = function() {
            document.getElementById("submitBtn").disabled = true;
        };

        let ajaxValidationStatus = {
            name: false,
            email: false,
            phoneNumber: false
        };

        function validateForm() {
            const errorMessages = document.querySelectorAll('.error-message');
            let hasError = false;

            for (let message of errorMessages) {
                if (message.innerHTML.trim() !== "") {
                    hasError = true;
                    break;
                }
            }

            for (let field in ajaxValidationStatus) {
                if (!ajaxValidationStatus[field]) {
                    hasError = true;
                    break;
                }
            }

            document.getElementById("submitBtn").disabled = hasError;

            return !hasError;
        }

        function onName() {
            const name = document.getElementById('name').value.trim();
            if (name.length < 4) {
                document.getElementById("displayName").innerHTML = "Name must be at least 4 characters long.";
                ajaxValidationStatus.name = false;
            } else {
                document.getElementById("displayName").innerHTML = "";
                ajaxValidationStatus.name = true;
            }
            validateForm();
        }

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
             xhttp.open("GET", "http://localhost:8080/Shashanka_L_R_Gym/email/" + emailvalue, true);
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

        function onPhoneNumber() {
            const phoneNumber = document.getElementById('phoneNumber').value.trim();
            const phonePattern = /^[6-9]\d{9}$/;

            if (!phonePattern.test(phoneNumber)) {
                document.getElementById("displayPhoneNumber").innerHTML = "Phone number must be 10 digits and start with 6-9.";
                ajaxValidationStatus.phoneNumber = false;
            } else {
                document.getElementById("displayPhoneNumber").innerHTML = "";
                ajaxValidationStatus.phoneNumber = true;
            }
            validateForm();
        }

        function calculateFields() {
            const packageAmount = parseFloat(document.getElementById('amount').value) || 0;
            const discount = parseFloat(document.getElementById('discount').value) || 0;
            const amountPaid = parseFloat(document.getElementById('amountpaid').value) || 0;
            const numInstallments = parseInt(document.getElementById('numInstallments').value) || 1;

            const discountAmount = (packageAmount * discount) / 100;
            let balance = packageAmount - discountAmount - amountPaid;
            balance = Math.max(0, balance);
            const installment = balance / numInstallments;

            document.getElementById('balance').value = balance.toFixed(2);
            document.getElementById('installment').value = installment.toFixed(2);
        }

        function updatePackageAmount() {
            const packageSelect = document.getElementById('PackageName');
            const selectedOption = packageSelect.options[packageSelect.selectedIndex];
            const packageValue = parseFloat(selectedOption.getAttribute('data-amount')) || 0;

            const trainerField = document.getElementById('trainer').value.trim();
            const trainerFee = trainerField ? 2000 : 0;

            const totalAmount = packageValue + trainerFee;
            document.getElementById('amount').value = totalAmount.toFixed(2);

            calculateFields();
        }

        document.getElementById('trainer').addEventListener('input', updatePackageAmount);

        function toggleFullPayment() {
            const isFullPayment = document.getElementById('fullPayment').checked;

            if (isFullPayment) {
                document.getElementById('discount').value = "0.00";
                document.getElementById('balance').value = "0.00";
                document.getElementById('installment').value = "0.00";
                document.getElementById('amountpaid').value = document.getElementById('amount').value;
                document.getElementById('numInstallments').value = "1";
                document.getElementById('numInstallments').disabled = true;
            } else {
                document.getElementById('numInstallments').disabled = false;
                calculateFields();
            }
        }

        document.getElementById('amountpaid').addEventListener('input', calculateFields);
        document.getElementById('discount').addEventListener('input', calculateFields);
        document.getElementById('numInstallments').addEventListener('input', calculateFields);
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>