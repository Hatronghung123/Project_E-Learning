<%-- 
    Document   : detail
    Created on : Jun 7, 2024, 2:07:40 AM
    Author     : Tuan Anh(Gia Truong)
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Edukate - Online Education Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        
        
     

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 
        <!-- AOS Library Stylesheet -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

        
        
        
        
        <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Slick CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" >
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">


        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousels/assets/owl.carousel.min.css" rel="stylesheet">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">



    </head>

    <body>




        <jsp:include page="menu.jsp"></jsp:include>






        <!-- Header Start -->
        <div class="container-fluid bg-primary py-5 mb-5 page-header">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-10 text-center">
                        <h1 class="display-3 text-white animated slideInDown">Course Detail</h1>
                        <div class="breadcrumb justify-content-center">
                            <p class="breadcrumb-item"><a class="text-white" href="home">Home</a></p>
                            <i class="fa fa-angle-double-right pt-1 px-3 text-white"></i>
                            <p class="breadcrumb-item text-white active">Course Detail</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->



        <!-- Detail Start -->
        <div data-aos="fade-up" class="container-fluid py-5">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-8">
                        <div  class="mb-5">
                            <div class="position-relative mb-5">
                                <h6 style="color: #F14D5D !important" class="d-inline-block position-relative text-secondary text-uppercase pb-2">Course Detail</h6>
                                <h1 class="display-4">Web design & development courses for beginners</h1>
                            </div>
                            <img data-aos="fade-up" class="img-fluid rounded w-100 mb-4 " src="img/header.jpg" alt="Image">
                            <p data-aos="fade-up">Tempor erat elitr at rebum at at clita aliquyam consetetur. Diam dolor diam ipsum et, tempor voluptua sit consetetur sit. Aliquyam diam amet diam et eos sadipscing labore. Clita erat ipsum et lorem et sit, sed stet no labore lorem sit. Sanctus clita duo justo et tempor consetetur takimata eirmod, dolores takimata consetetur invidunt magna dolores aliquyam dolores dolore. Amet erat amet et magna</p>

                            <p data-aos="fade-up" >Sadipscing labore amet rebum est et justo gubergren. Et eirmod ipsum sit diam ut magna lorem.
                                Nonumy vero labore lorem sanctus rebum et lorem magna kasd, stet amet magna accusam
                                consetetur eirmod. Kasd accusam sit ipsum sadipscing et at at sanctus et. Ipsum sit
                                gubergren dolores et, consetetur justo invidunt at et aliquyam ut et vero clita. Diam sea
                                sea no sed dolores diam nonumy, gubergren sit stet no diam kasd vero.</p>
                        </div>


                        <!--Relate course-->
                        <h2 class="mb-3">Related Courses</h2>
                        <div class="related-carousel position-relative" >
                            <div style="margin-left: 10px" data-aos="fade-up" class="col-lg-11 col-md-11">
                                <div class="course-item bg-light">
                                    <div class="position-relative overflow-hidden">
                                        <img class="img-fluid" src="img/course-1.jpg" alt="">
                                        <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                            <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                            <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                        </div>
                                    </div>
                                    <div class="text-center p-4 pb-0">
                                        <h3 class="mb-0">$149.00</h3>
                                        <div class="mb-3">
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small>(123)</small>
                                        </div>
                                        <h5 class="mb-4">Web Design & Development Course for Beginners</h5>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>John Doe</small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i>1.49 Hrs</small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i>30 Students</small>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-left: 10px" data-aos="fade-up" class="col-lg-11 col-md-11">
                                <div class="course-item bg-light">
                                    <div class="position-relative overflow-hidden">
                                        <img class="img-fluid" src="img/course-1.jpg" alt="">
                                        <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                            <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                            <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                        </div>
                                    </div>
                                    <div class="text-center p-4 pb-0">
                                        <h3 class="mb-0">$149.00</h3>
                                        <div class="mb-3">
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small>(123)</small>
                                        </div>
                                        <h5 class="mb-4">Web Design & Development Course for Beginners</h5>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>John Doe</small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i>1.49 Hrs</small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i>30 Students</small>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-left: 10px" data-aos="fade-up" class="col-lg-11 col-md-11">
                                <div class="course-item bg-light">
                                    <div class="position-relative overflow-hidden">
                                        <img class="img-fluid" src="img/course-1.jpg" alt="">
                                        <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                            <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                            <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                        </div>
                                    </div>
                                    <div class="text-center p-4 pb-0">
                                        <h3 class="mb-0">$149.00</h3>
                                        <div class="mb-3">
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small>(123)</small>
                                        </div>
                                        <h5 class="mb-4">Web Design & Development Course for Beginners</h5>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>John Doe</small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i>1.49 Hrs</small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i>30 Students</small>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-left: 10px" data-aos="fade-up" class="col-lg-11 col-md-11">
                                <div class="course-item bg-light">
                                    <div class="position-relative overflow-hidden">
                                        <img class="img-fluid" src="img/course-1.jpg" alt="">
                                        <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                            <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                            <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                        </div>
                                    </div>
                                    <div class="text-center p-4 pb-0">
                                        <h3 class="mb-0">$149.00</h3>
                                        <div class="mb-3">
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small>(123)</small>
                                        </div>
                                        <h5 class="mb-4">Web Design & Development Course for Beginners</h5>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>John Doe</small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i>1.49 Hrs</small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i>30 Students</small>
                                    </div>
                                </div>
                            </div>
                            <!--end course relate-->
                        </div>
                    </div>




                    <div class="col-lg-4 mt-5 mt-lg-0">
                        <div class="bg-primary mb-5 py-3">
                            <h3 class="text-white py-3 px-4 m-0">Course Features</h3>
                            <div class="d-flex justify-content-between border-bottom px-4">
                                <h6 class="text-white my-3">Instructor</h6>
                                <h6 class="text-white my-3">John Doe</h6>
                            </div>
                            <div class="d-flex justify-content-between border-bottom px-4">
                                <h6 class="text-white my-3">Rating</h6>
                                <h6 class="text-white my-3">4.5 <small>(250)</small></h6>
                            </div>
                            <div class="d-flex justify-content-between border-bottom px-4">
                                <h6 class="text-white my-3">Lectures</h6>
                                <h6 class="text-white my-3">15</h6>
                            </div>
                            <div class="d-flex justify-content-between border-bottom px-4">
                                <h6 class="text-white my-3">Duration</h6>
                                <h6 class="text-white my-3">10.00 Hrs</h6>
                            </div>
                            <div class="d-flex justify-content-between border-bottom px-4">
                                <h6 class="text-white my-3">Skill level</h6>
                                <h6 class="text-white my-3">All Level</h6>
                            </div>
                            <div class="d-flex justify-content-between px-4">
                                <h6 class="text-white my-3">Language</h6>
                                <h6 class="text-white my-3">English</h6>
                            </div>
                            <h5 class="text-white py-3 px-4 m-0">Course Price: $199</h5>
                            <c:if test="${sessionScope.account == null}">
                                <div class="py-3 px-4">
                                    <a style="background-color: #ee2a3d" class="btn btn-block btn-secondary py-3 px-5" href="join?action=login">Enroll Now</a>
                                </div>
                            </c:if>

                            <c:if test="${sessionScope.account != null}">
                                <div class="py-3 px-4">
                                    <a style="background-color: #ee2a3d" class="btn btn-block btn-secondary py-3 px-5" href="vnpay_pay.jsp?price=1&cid=1&acc=${sessionScope.account.getAccount_id()}">Enroll Now</a>
                                </div>
                            </c:if>
                        </div>

                        <div class="mb-5 wow animate__animated animate__fadeInUp" data-wow-delay="0.1s">
                            <h2 class="mb-3">Categories</h2>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0 wow animate__animated animate__fadeInUp" data-wow-delay="0.2s">
                                    <a href="" class="text-decoration-none h6 m-0">Web Design</a>
                                    <span class="badge badge-primary badge-pill">150</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0 wow animate__animated animate__fadeInUp" data-wow-delay="0.3s">
                                    <a href="" class="text-decoration-none h6 m-0">Web Development</a>
                                    <span class="badge badge-primary badge-pill">131</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0 wow animate__animated animate__fadeInUp" data-wow-delay="0.4s">
                                    <a href="" class="text-decoration-none h6 m-0">Online Marketing</a>
                                    <span class="badge badge-primary badge-pill">78</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0 wow animate__animated animate__fadeInUp" data-wow-delay="0.5s">
                                    <a href="" class="text-decoration-none h6 m-0">Keyword Research</a>
                                    <span class="badge badge-primary badge-pill">56</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0 wow animate__animated animate__fadeInUp" data-wow-delay="0.6s">
                                    <a href="" class="text-decoration-none h6 m-0">Email Marketing</a>
                                    <span class="badge badge-primary badge-pill">98</span>
                                </li>
                            </ul>
                        </div>


                        <div class="mb-5 wow animate__animated animate__fadeInUp" data-wow-delay="0.1s">
                            <h2 class="mb-4">Recent Courses</h2>
                            <a class="d-flex align-items-center text-decoration-none mb-4 wow animate__animated animate__fadeInUp" href="" data-wow-delay="0.2s">
                                <img class="img-fluid rounded" src="img/courses-80x80.jpg" alt="">
                                <div class="pl-3">
                                    <h6>Web design & development courses for beginners</h6>
                                    <div class="d-flex">
                                        <small class="text-body mr-3"><i class="fa fa-user text-primary mr-2"></i>Jhon Doe</small>
                                        <small class="text-body"><i class="fa fa-star text-primary mr-2"></i>4.5 (250)</small>
                                    </div>
                                </div>
                            </a>
                            <a class="d-flex align-items-center text-decoration-none mb-4 wow animate__animated animate__fadeInUp" href="" data-wow-delay="0.3s">
                                <img class="img-fluid rounded" src="img/courses-80x80.jpg" alt="">
                                <div class="pl-3">
                                    <h6>Web design & development courses for beginners</h6>
                                    <div class="d-flex">
                                        <small class="text-body mr-3"><i class="fa fa-user text-primary mr-2"></i>Jhon Doe</small>
                                        <small class="text-body"><i class="fa fa-star text-primary mr-2"></i>4.5 (250)</small>
                                    </div>
                                </div>
                            </a>
                            <a class="d-flex align-items-center text-decoration-none mb-4 wow animate__animated animate__fadeInUp" href="" data-wow-delay="0.4s">
                                <img class="img-fluid rounded" src="img/courses-80x80.jpg" alt="">
                                <div class="pl-3">
                                    <h6>Web design & development courses for beginners</h6>
                                    <div class="d-flex">
                                        <small class="text-body mr-3"><i class="fa fa-user text-primary mr-2"></i>Jhon Doe</small>
                                        <small class="text-body"><i class="fa fa-star text-primary mr-2"></i>4.5 (250)</small>
                                    </div>
                                </div>
                            </a>
                            <a class="d-flex align-items-center text-decoration-none wow animate__animated animate__fadeInUp" href="" data-wow-delay="0.5s">
                                <img class="img-fluid rounded" src="img/courses-80x80.jpg" alt="">
                                <div class="pl-3">
                                    <h6>Web design & development courses for beginners</h6>
                                    <div class="d-flex">
                                        <small class="text-body mr-3"><i class="fa fa-user text-primary mr-2"></i>Jhon Doe</small>
                                        <small class="text-body"><i class="fa fa-star text-primary mr-2"></i>4.5 (250)</small>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Detail End -->


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
                    <div data-aos="fade-up" class="col-lg-3 col-md-6">
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
                            Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a><br><br>
                            Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
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
        <a href="#" class="btn btn-lg btn-primary rounded-0 btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easings/easing.min.js"></script>
        <script src="lib/waypointss/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>

        

        <script src="lib/wow/wow.min.js"></script>

        
        
        
               <script src="js/main.js"></script>
        <!-- AOS Library Javascript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>

        <!-- Template Javascript -->
        <script src="js/index.js"></script>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Slick JS -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.related-carousel').slick({
                    infinite: true,
                    slidesToShow: 3, // Số slide hiển thị cùng lúc
                    slidesToScroll: 1, // Số slide sẽ di chuyển mỗi khi bạn nhấn nút điều hướng
                    autoplay: true,
                    autoplaySpeed: 2000, // Thời gian giữa các lần tự động chuyển slide (ms)
                    dots: true, // Hiển thị các chấm điều hướng
                    responsive: [
                        {
                            breakpoint: 1024, // Dưới 1024px, số slide hiển thị là 2
                            settings: {
                                slidesToShow: 2,
                                slidesToScroll: 1
                            }
                        },
                        {
                            breakpoint: 600, // Dưới 600px, số slide hiển thị là 1
                            settings: {
                                slidesToShow: 1,
                                slidesToScroll: 1
                            }
                        }
                    ]
                });

                // Sự kiện click cho các thẻ a bên trong carousel
                $('.related-carousel .course-item a').on('click', function (e) {
                    e.stopPropagation(); // Ngăn chặn sự kiện click lan sang các phần tử khác trong carousel
                    // Xử lý các hành động khi click vào phần tử trong carousel
                });
            });

        </script>
    </body>

</html>
