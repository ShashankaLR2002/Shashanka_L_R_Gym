<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer & Slot Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #007bff;
        }

        .navbar-brand,
        .nav-link {
            color: #fff !important;
        }

        .container {
            margin-top: 80px;
        }

        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .table th,
        .table td {
            vertical-align: middle;
        }

        .modal-dialog {
            max-width: 500px;
        }

        .modal-body {
            padding: 20px;
        }
    </style>
</head>

<body>
   <nav class="navbar navbar-dark bg-dark fixed-top">
       <div class="container-fluid">
           <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu"
               aria-controls="offcanvasMenu" aria-label="Toggle navigation">
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


    <div class="container">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5>Trainer List</h5>
                <div>
                    <button class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#addSlotsModal">Add Slots</button>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTrainerModal">Add Trainer</button>
                </div>
            </div>

            <div class="card-body">
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success">${successMessage} </div>
                </c:if>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage} </div>
                </c:if>

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Slot Timings</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="trainer" items="${trainerInfoList}">
                            <tr>
                                <td>${trainer.name}</td>
                                <td>${trainer.phoneNumber}</td>
                                <td>${trainer.slotTimings}</td>
                                <td>
                                    <button class="btn btn-danger btn-sm" onclick="deleteTrainer(${trainer.id})">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Add Trainer Modal -->
        <div class="modal fade" id="addTrainerModal" tabindex="-1" aria-labelledby="addTrainerModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addTrainerModalLabel">Add Trainer</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addTrainerForm" action="trainerAddact" method="post">
                            <div class="mb-2">
                                <label for="name" class="form-label">Trainer Name:</label>
                                <input type="text" id="name" class="form-control" name="Name" placeholder="Trainer Name" required>
                            </div>

                            <div class="mb-2">
                                <label for="phoneNumber" class="form-label">Phone Number:</label>
                                <input type="text" id="phoneNumber" class="form-control" name="phoneNumber" placeholder="Phone Number" required>
                            </div>

                            <div class="mb-2">
                                <label for="slotTimings" class="form-label">Select Slot Timing:</label>
                                <select id="slotTimings" class="form-control" name="slotTimings" required>
                                    <option value="">-- Select Slot --</option>
                                    <c:forEach var="slot" items="${slots}">
                                        <option value="${slot.startTimings} - ${slot.endTimings}">${slot.startTimings} - ${slot.endTimings}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="addSlotsModal" tabindex="-1" aria-labelledby="addSlotsModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSlotsModalLabel">Add Slot</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addSlotsForm" action="AddSlotact" method="get">
                            <div class="mb-2">
                                <label for="startTimings" class="form-label">Start Time:</label>
                                <input type="time" id="startTimings" class="form-control" name="startTimings" required oninput="calculateDuration()" onchange="onstartTime()">
                                <span id="startTimeMessage" class="text-info mt-2"></span>
                            </div>

                            <div class="mb-2">
                                <label for="endTimings" class="form-label">End Time:</label>
                                <input type="time" id="endTimings" class="form-control" name="endTimings" required oninput="calculateDuration()" onchange="onendTime()">
                            </div>
                            <span id="endTimeMessage" class="text-info mt-2"></span>

                            <div class="mb-2">
                                <label for="duration" class="form-label">Duration:</label>
                                <input type="text" id="duration" class="form-control" name="duration" readonly>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success">Save Slot</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function deleteTrainer(id) {
            if (confirm("Are you sure you want to delete this trainer?")) {
                window.location.href = "deleteTrainer?id=" + id;
            }
        }

        function calculateDuration() {
            let start = document.getElementById("startTimings").value;
            let end = document.getElementById("endTimings").value;

            if (start && end) {
                let startTime = new Date("1970-01-01T" + start);
                let endTime = new Date("1970-01-01T" + end);
                let diff = (endTime - startTime) / (1000 * 60);
                if (diff > 0) {
                    let hours = Math.floor(diff / 60);
                    let minutes = diff % 60;
                    document.getElementById("duration").value = hours + " hr " + minutes + " min";
                } else {
                    document.getElementById("duration").value = "Invalid Time";
                }
            }
        }

        function onstartTime() {
            var starttime = document.getElementById('startTimings').value;

            if (!starttime) {
                document.getElementById("startTimeMessage").innerHTML = "";
                return;
            }

            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/Shashanka_L_R_Gym/startTimings/" + starttime, true);

            xhttp.onload = function () {
                if (this.status === 200) {
                    var response = this.responseText;
                    if (response === "Slot Not Available") {
                        document.getElementById("startTimeMessage").innerHTML = "This slot is already booked.";
                        document.getElementById("startTimeMessage").style.color = "red";
                    } else {
                        document.getElementById("startTimeMessage").innerHTML = "";
                    }
                } else {
                    document.getElementById("startTimeMessage").innerHTML = "Error checking start time.";
                    document.getElementById("startTimeMessage").style.color = "orange";
                }
            };

            xhttp.send();
        }

        function onendTime() {
            var endTime = document.getElementById('endTimings').value;

            if (!endTime) {
                document.getElementById("endTimeMessage").innerHTML = "";
                return;
            }

            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/Shashanka_L_R_Gym/endTimings/" + endTime, true);

            xhttp.onload = function () {
                if (this.status === 200) {
                    var response = this.responseText;
                    if (response === "Slot Not Available") {
                        document.getElementById("endTimeMessage").innerHTML = "This slot is already booked.";
                        document.getElementById("endTimeMessage").style.color = "red";
                    } else {
                        document.getElementById("endTimeMessage").innerHTML = "";
                    }
                } else {
                    document.getElementById("endTimeMessage").innerHTML = "Error checking end time.";
                    document.getElementById("endTimeMessage").style.color = "orange";
                }
            };
            xhttp.send();
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
