<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Registration Page</title>
  <style>
    h4 {
      color: red;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background-image: url('https://plus.unsplash.com/premium_photo-1675805015392-28fd80c551ec?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
      background-repeat: no-repeat;
      background-size: cover;
      min-height: 100vh;
      background-color: #009579;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .form-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 7px;
      box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
      max-width: 400px;
      width: 100%;
    }

    .form-container h1 {
      text-align: center;
      margin-bottom: 20px;
    }

    .form-container input {
      width: 100%;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 6px;
      border: 1px solid #ddd;
      font-size: 16px;
    }

    .form-container input[type="submit"] {
      background-color: #009579;
      color: #fff;
      font-weight: bold;
      cursor: pointer;
    }

    .form-container input[type="submit"]:hover {
      background-color: #006653;
    }

    .form-container .login {
      text-align: center;
    }

    .form-container .login a {
      color: #009579;
      font-weight: bold;
    }

    .form-container .login a:hover {
      text-decoration: underline;
    }

    .form-container .error-message {
      color: red;
      font-size: 14px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h1>Register</h1>
    <form action="reg" method="post">
      <input type="text" name="txtName" placeholder="Enter your name" required>
      <input type="text" name="txtEmail" placeholder="Enter your email" required>
      <input type="password" name="txtPassword" placeholder="Create a password" required>

      <div class="error-message">
        <% 
          if(request.getAttribute("message") != null) {
            out.println("<h4>" + request.getAttribute("message") + "</h4>");
          }
        %>
      </div>

      <input type="submit" value="Register">
    </form>

    <div class="login">
      <p>Already have an account? <a href="Login.jsp">Login</a></p>
    </div>
  </div>
</body>
</html>
