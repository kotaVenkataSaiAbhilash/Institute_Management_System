<%@page import="com.techpalle.bean.Student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="Home.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-image: url('https://plus.unsplash.com/premium_photo-1673306778968-5aab577a7365?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.7); /* More transparent white background */
            padding: 20px;
            border-radius: 10px;
            max-width: 900px; /* Center the content */
            margin: 0 auto; /* Center the container */
        }
        table th, table td {
            text-align: center;
        }
        h5 {
            color: #333;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="bg-light border rounded-3 p-4">
        <h5>Student Details</h5>
        <table class="table table-striped table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Sid</th>
                    <th scope="col">Name</th>
                    <th scope="col">Age</th>
                    <th scope="col">Mobile</th>
                    <th scope="col">Address</th>
                    <th scope="col">Email</th>
                    <th scope="col">Course</th>
                </tr>
            </thead>
            <tbody>
                <% ArrayList<Student> al = (ArrayList<Student>) request.getAttribute("student list"); 
                for (Student s : al) { %>
                    <tr>
                        <th scope="row"><%= s.getSid() %></th>
                        <td><%= s.getName() %></td>
                        <td><%= s.getAge() %></td>
                        <td><%= s.getMobile() %></td>
                        <td><%= s.getAddress() %></td>
                        <td><%= s.getEmail() %></td>
                        <td><%= s.getCourse() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-PTJ7Y14ohVr04gWz19PbL8tXZfnTyb2oDpEr9aab2cZl8zjv2/sAqovH6aAkz7V3" crossorigin="anonymous"></script>
</body>
</html>