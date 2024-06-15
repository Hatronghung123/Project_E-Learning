<%-- 
    Document   : Courses
    Created on : May 31, 2024, 1:24:26 PM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Course</title>
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
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
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



        <div class="container-fluid">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-10">
                        <h1 class="display-3 text-dark animated slideInDown">My Courses</h1>
                    </div>
                </div>
            </div>
            <div class="container light-style flex-grow-1 container-p-y">

                <div class=" overflow-hidden">
                    <div class="row no-gutters row-bordered row-border-light">
                        <div class="col-md-3 pt-0">
                            <div class="list-group list-group-flush account-settings-links">
                                <!-- <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-info">Information</a>-->
                                <!--                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-social-links">Social links</a>
                                                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-connections">Connections</a>-->
                                <!--                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-notifications">Notifications</a>-->
                                <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account-courses">My Courses</a>
                            </div>
                        </div>
                        
                        
                        <div class="col-md-9 card_mine">
                            <div class="tab-content">
                                <div class="tab-pane fade active show" id="account-general">
                                    <h3 style="color: red">${requestScope.error}</h3>

                                    <!--                                        <hr class="border-light m-0">-->






                                    <div class="tab-pane fade show" id="account-courses">
                                        <div class="card-body pb-2">

                                            <div class="row card-body media align-items-center" style="border: 1px solid #ced4da;">
                                                <div class="col-lg-2">
                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Golden_tabby_and_white_kitten_n01.jpg/1200px-Golden_tabby_and_white_kitten_n01.jpg" 
                                                         width="100px" height="100px" alt="alt"/>
                                                </div>
                                                <div class="col-lg-8">
                                                    <label class="form-label" style="color: #06BBCC; font-size: 20px ">Course Name</label><br>
                                                    <label class="form-label" style="color: black; font-size: 13px">Manager</label><br>
                                                </div>
                                                <div class="col-lg-2">
                                                    <a href="" class="btn btn-outline-primary" ">Go to Course</a>
                                                </div>
                                            </div>


                                            <br>
                                            <hr class="border-light m-0">

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript">

            </script>

        </div>
        <!-- Header End -->












        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-3">Quick Link</h4>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                        <a class="btn btn-link" href="">FAQs & Help</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-3">Contact</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-3">Gallery</h4>
                        <div class="row g-2 pt-2">
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/course-1.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/course-2.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/course-3.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/course-2.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/course-3.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/course-1.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-3">Newsletter</h4>
                        <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved.

                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
