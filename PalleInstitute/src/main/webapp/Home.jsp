<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

    <form action="studenthome" method="post">
        <!-- Form content goes here -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Student Management</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <input type="submit" class="btn btn-dark nav-link" name="action" value="Add Student">
                        </li>
                        <li class="nav-item">
                            <input type="submit" class="btn btn-dark nav-link" name="action" value="Display">
                        </li>
                        <li class="nav-item">
                            <input type="submit" class="btn btn-dark nav-link" name="action" value="Update">
                        </li>
                        <li class="nav-item">
                            <input type="submit" class="btn btn-dark nav-link" name="action" value="Delete">
                        </li>
                        <!-- Logout button with smaller icon, redirecting to login.jsp -->
                        <li class="nav-item">
                            <a href="Login.jsp" class="btn btn-dark nav-link">
                                <i class="bi bi-box-arrow-right" style="font-size: 18px;"></i> Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-PTJ7Y14ohVr04gWz19PbL8tXZfnTyb2oDpEr9aab2cZl8zjv2/sAqovH6aAkz7V3" crossorigin="anonymous"></script>
</body>
</html>
