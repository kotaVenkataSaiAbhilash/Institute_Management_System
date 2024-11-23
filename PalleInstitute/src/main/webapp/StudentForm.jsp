<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Home.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Form</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    body {
      background-image: url('https://plus.unsplash.com/premium_photo-1673306778968-5aab577a7365?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
      background-size: cover;
      background-position: center;
      min-height: 100vh;
      font-family: 'Arial', sans-serif;
    }

    .form-container {
      background-color: rgba(255, 255, 255, 0.85); /* Slight transparency for the form */
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 550px;
    }

    h5 {
      color: #4CAF50;
      font-weight: 600;
      text-align: center;
      margin-bottom: 20px;
    }

    .form-control {
      border-radius: 10px;
      box-shadow: none;
      margin-bottom: 15px;
    }

    .btn {
      width: 100%;
      border-radius: 10px;
      padding: 10px;
      font-size: 1.1rem;
    }

    /* Styling for the message below the form */
    #message-container {
      margin-top: 20px;
      width: 100%;
      text-align: center;
    }

    .alert {
      border-radius: 10px;
      padding: 15px;
      font-size: 1rem;
      margin-top: 20px;
    }

    .alert-success {
      background-color: #28a745;
      color: white;
    }

    .alert-danger {
      background-color: #dc3545;
      color: white;
    }
  </style>
</head>
<body>


<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">

  <div class="form-container">
    <h5>Student Details</h5>
    <form action="savestudent" method="post">
      <div class="mb-3">
        <input class="form-control" type="text" name="txtName" placeholder="Enter your Name" required><br>
        <input class="form-control" type="number" name="txtAge" placeholder="Enter your Age" min="1" required><br>
        <input class="form-control" type="tel" name="txtMobile" placeholder="Enter your Mobile" pattern="[0-9]{10}" required><br>
        <input class="form-control" type="text" name="txtAddress" placeholder="Enter your Address" required><br>
        <input class="form-control" type="email" name="txtEmail" placeholder="Enter your Email" required><br>
        <input class="form-control" type="text" name="txtCourse" placeholder="Enter your Course" required><br>
      </div>

		<!-- Display success or error message -->
		<% if (request.getAttribute("message") != null) { %>
		    <div class="text-center">
		        <div class="<%= request.getAttribute("message").toString().contains("Invalid") ? "text-danger" : "text-success" %>">
		            <%= request.getAttribute("message") %>
		        </div>
		    </div>
		    <script>
		        setTimeout(function() {
		            var messageElement = document.querySelector(".text-center .text-danger, .text-center .text-success");
		            if (messageElement) {
		                messageElement.style.display = 'none';
		            }
		        }, 3000);  // Hide the message after 3 seconds
		    </script>
		<% } %>


      <div class="text-center">
        <button type="submit" class="btn btn-primary">ADD Student</button>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-PTJ7Y14ohVr04gWz19PbL8tXZfnTyb2oDpEr9aab2cZl8zjv2/sAqovH6aAkz7V3" crossorigin="anonymous"></script>
</body>
</html>
