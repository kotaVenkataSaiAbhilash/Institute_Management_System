Update

<%@page import="com.techpalle.bean.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="Home.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<form action = "showstudentdatatoupdate" method=post>
<div class="mb-3" align="center">
    <label for="exampleInputEmail1" class="form-label">Enter Mobile Number</label>
    <input type="number" style="width:300px"  name="txtMobile" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <button type="submit" class = "btn btn-primary" value="show data">Show Data</button>
  </div>
</form>
<% if(request.getAttribute("student data")!=null){
	if(request.getAttribute("student data").equals("Invalid mobile Number")){%>
		<label style="color:red"><%=request.getAttribute("student data") %></label>
	<% }
	else
	{
	
Student s = (Student)request.getAttribute("student data"); %>
<form action="updatestudentdata" method = "post" >
<div class="mb-3" align="center">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" style="width:300px"  name="txtName" value="<%=s.getName() %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
<div class="mb-3" align="center">
    <label for="exampleInputEmail1" class="form-label">Age</label>
    <input type="number" style="width:300px"  name="txtAge" value="<%=s.getAge()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
<div class="mb-3" align="center">
    <label for="exampleInputEmail1" class="form-label">Mobile</label>
    <input type="number" style="width:300px"  name="txtMobile" value="<%=s.getMobile()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
<div class="mb-3" align="center">
    <label for="exampleInputEmail1" class="form-label">Address</label>
    <input type="text" style="width:300px"  name="txtAddress" value="<%=s.getAddress()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
<div class="mb-3" align="center">
    <label for="exampleInputEmail1" class="form-label">Email</label>
    <input type="email" style="width:300px"  name="txtEmail" value="<%=s.getEmail()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
<div class="mb-3" align="center">
    <label for="exampleInputEmail1" class="form-label">Course</label>
    <input type="text" style="width:300px"  name="txtCourse" value="<%=s.getCourse()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
<div class="mb-3" align="center">  
<button type="submit" class = "btn btn-primary" value="updatestudentdata">Update</button>
</div>
</form>
<% }
	}%>
<%if(request.getAttribute("message")!=null){
	%>
	<label style="color:green"><%= request.getAttribute("message") %></label>
<%}%>
</body>
</html>