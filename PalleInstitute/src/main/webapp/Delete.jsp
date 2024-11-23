<%@ page import="com.techpalle.bean.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Home.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6hYctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-image: url('https://plus.unsplash.com/premium_photo-1673306778968-5aab577a7365?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            max-width: 600px;
            margin: auto;
        }

        .form-container h5 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container .form-control {
            border-radius: 10px;
            box-shadow: none;
            margin-bottom: 15px;
        }

        .form-container .btn {
            border-radius: 10px;
            padding: 10px;
            font-size: 1.1rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        .form-container .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .form-container .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-container .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .form-container .btn-danger:hover {
            background-color: #c82333;
        }

        .alert {
            margin-top: 20px;
            border-radius: 10px;
            text-align: center;
            font-size: 1.1rem;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .error-message p {
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <br><br>

    <!-- Form to input mobile number -->
    <div class="form-container">
        <div class="container">
            <h3 class="text-center mb-4">Delete Student Data</h3>
            <form action="studentdatadelete" method="post">
                <div class="mb-3">
                    
                    <input type="number" name="txtMobile" class="form-control" id="mobileInput" placeholder="Enter Mobile Number" pattern="[0-9]{10}" required>
                </div>
                <button type="submit" class="btn btn-danger w-100">Delete Student</button>
            </form>
        </div>
    </div>

    <br><br>

<!-- Display success or error message -->
    <% if (request.getAttribute("message") != null) { %>
    <div id="message-container" class="form-container">
        <div class="alert alert-<%= request.getAttribute("message").toString().contains("Invalid") ? "danger" : "success" %> text-center">
            <%= request.getAttribute("message") %>
        </div>
    </div>
    <script>
        setTimeout(function() {
            document.getElementById("message-container").style.display = 'none';
        }, 3000);  // Hide the message after 3 seconds
    </script>
    <% } %>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-PTJ7Y14ohVr04gWz19PbL8tXZfnTyb2oDpEr9aab2cZl8zjv2/sAqovH6aAkz7V3" crossorigin="anonymous">
    </script>
</body>

</html>