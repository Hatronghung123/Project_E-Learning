<%-- 
    Document   : Profile
    Created on : May 31, 2024, 1:33:50 AM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        
    </head>
    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem;
                 height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
            <a href="home" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
                <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>OLS</h2>
            </a>

            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarCollapse">

                <form action="search" method="post" class="navbar-nav ms-auto-1 p-4 p-lg-0">
                    <input type="text" name="search" placeholder="Search Courses">
                    <input style="border-radius: 4px" class="btn btn-primary" type="submit" value="Search">
                </form>


                <!--                <div class="navbar-nav ms-auto p-4 p-lg-0">
                                    <a href="home" class="nav-item nav-link active">Home</a>
                                    <a href="about.html" class="nav-item nav-link">About</a>
                                    <a href="courses.html" class="nav-item nav-link">Courses</a>
                                    <div class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                        <div class="dropdown-menu fade-down m-0">
                                            <a href="team.html" class="dropdown-item">Our Team</a>
                                            <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                            <a href="404.html" class="dropdown-item">404 Page</a>
                                        </div>
                                    </div>
                                    <a href="contact.html" class="nav-item nav-link">Contact</a>
                
                
                                                        <div class="nav-item dropdown">
                                                            <a href="#"  class="btn btn-primary py-4 px-lg-5 d-none d-lg-block" data-bs-toggle="dropdown">${sessionScope.profile.fullname}<i class="fa fa-arrow-down ms-3"></i></a>                            
                                                            <div class="dropdown-menu fade-down m-0">
                                                                <a class="dropdown-item" href="profile">My profile</a>
                                                                <a class="dropdown-item" href="join?action=logout">Log Out</a>
                                    
                                                            </div>
                                                        </div>  
                                </div>-->

                <c:if test="${account != null}">
                    <div class="navbar-nav ms-auto p-4 p-lg-0">
                        <div class="nav-item dropdown">
                            <a href="#" class="btn btn-primary py-4 px-lg-5 d-lg-block"  data-bs-toggle="dropdown">${sessionScope.profile.fullname}<i class="fa fa-arrow-down ms-3"></i></a>
                            <div class="dropdown-menu fade-down m-0">
                                <a class="dropdown-item" href="profile">My Profile</a>
                                <a class="dropdown-item" href="courses">My Courses</a>
                                <a class="dropdown-item" href="join?action=logout">Log Out</a>
                            </div>
                        </div>    
                    </div>

                </c:if>
                <c:if test="${account == null}">

                    <div class="navbar-nav ms-auto p-4 p-lg-0">
                        <div class="nav-item dropdown">
                            <a href="#"  class="btn btn-primary py-4 px-lg-5 d-lg-block" data-bs-toggle="dropdown">Login/Register<i class="fa fa-arrow-down ms-3"></i></a>
                            <div class="dropdown-menu fade-down m-0">
                                <a href="join?action=login" class="dropdown-item">Login</a>
                                <a href="join?action=signup" class="dropdown-item">Register</a>

                            </div>
                        </div>    
                    </div>
                </c:if>


            </div>
        </nav>
        <!-- Navbar End -->

        
    </body>
</html>
