<%-- 
    Document   : detail
    Created on : Jun 7, 2024, 2:07:40 AM
    Author     : Tuan Anh(Gia Truong)
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

        <!--         Libraries Stylesheet 
                <link href="lib/animate/animate.min.css" rel="stylesheet">
                 Libraries Stylesheet 
                <link href="lib/owlcarousels/assets/owl.carousel.min.css" rel="stylesheet">-->
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            /* CSS for smaller font size in navbar */
            /* CSS for making the font more bold and standout */
            .nav-link,
            .navbar .dropdown-item,
            .navbar .btn {
                font-size: 15px; /* Tăng kích thước phông chữ, bạn có thể điều chỉnh */
                font-weight: 500; /* Tăng độ đậm của phông chữ */
               
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* Thêm bóng chữ nhẹ để làm nổi bật */
                letter-spacing: 0.5px; /* Thêm khoảng cách giữa các chữ cái cho độ rõ */
            }
            /* Additional styling for consistency */
            .navbar .nav-link {
                padding: 10px;
            }

        </style>

    </head>

    <body>




        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
            <a href="home" class="navbar-brand d-flex align-items-center px-4 px-lg-5" style="text-decoration: none;">
                <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>OLS</h2>
            </a>

            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarCollapse">

                <!--        search by category-->
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="
                           border-style: solid;
                           border-width: thin;
                           border-radius: 10px;
                           padding: 10px;
                           margin: 15px;
                           color: #06BBCC;
                           ">Explore</a>
                        <div class="dropdown-menu fade-down m-0">
                            <c:forEach items="${listCategory}" var="o">
                                <a href="team.html" class="dropdown-item">${o.getCategory_name()}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!--        search by name-->
                <form action="search" method="post" class="navbar-nav ">
                    <input class="search-input" style="width: 300px;" type="text" name="search"  placeholder="Search in course">
                    <input style="border-radius: 4px; margin-right: 5px" class="btn btn-primary" type="submit" value="Search">
                </form>


                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="home" class="nav-item nav-link active">Home</a>
                    <a href="about.jsp" class="nav-item nav-link">About</a>
                    <a href="Courses.jsp" class="nav-item nav-link">Courses</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu fade-down m-0">
                            <a href="team.html" class="dropdown-item">Our Team</a>
                            <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                            <a href="404.html" class="dropdown-item">404 Page</a>
                        </div>
                    </div>
                    <a href="contact.html" class="nav-item nav-link">Contact</a>

                    <!--                
                                                                            <div class="nav-item dropdown">
                                                                                <a href="#"  class="btn btn-primary py-4 px-lg-5 d-none d-lg-block" data-bs-toggle="dropdown">${sessionScope.profile.fullname}<i class="fa fa-arrow-down ms-3"></i></a>                            
                                                                                <div class="dropdown-menu fade-down m-0">
                                                                                    <a class="dropdown-item" href="profile">My profile</a>
                                                                                    <a class="dropdown-item" href="join?action=logout">Log Out</a>
                                                        
                                                                                </div>
                                                                            </div>  -->
                </div>

                <c:if test="${sessionScope.account != null}">
                    <div class="navbar-nav ms-auto p-5 p-lg-0" >
                        <div class="nav-item dropdown"  >
                            <c:if test="${not empty sessionScope.profile.fullname}">
                                <c:set var="fullName" value="${sessionScope.profile.fullname}" />
                                <script>
                                    var fullName = "${fullName}";
                                    var limitedName = fullName.length > 12 ? fullName.substring(0, 12) + '...' : fullName;
                                    document.write('<a href="#" class="btn btn-primary py-4 px-lg-5 d-lg-block" data-toggle="dropdown">' + limitedName + '<i class="fa fa-arrow-down ms-3"></i></a>');
                                </script>
                            </c:if>
<!-- <a href="#" class="btn btn-primary py-4 px-lg-5 d-lg-block" data-toggle="dropdown">
                        ${sessionScope.profile.fullname}<i class="fa fa-arrow-down ms-3"></i>
                    </a>-->

                            <div class="dropdown-menu fade-down m-0"   >
                                <a class="dropdown-item" href="profile">My Profile</a>
                                <a class="dropdown-item" href="my-courses">My Courses</a>
                                <a class="dropdown-item" href="user/abc">Abc</a>
                                <a class="dropdown-item" href="join?action=logout">Log Out</a>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account == null}">
                    <div class="navbar-nav ms-auto p-4 p-lg-0">
                        <div class="nav-item dropdown">
                            <a href="#" class="btn btn-primary py-4 px-lg-5 d-lg-block" data-toggle="dropdown">
                                Login/Register<i class="fa fa-arrow-down ms-3"></i>
                            </a>
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
                                <h1 class="display-4">${getCourseByID.getCourse_name()}</h1>
                            </div>
                            <img style="width: 100%; /* Đảm bảo rằng ảnh sẽ rộng hết phần tử cha */
                                 height: 480px; /* Chiều cao mong muốn */; /* Đảm bảo tỷ lệ khung hình bảo toàn */
                                 border: 2px solid #ccc; /* Định dạng viền với độ dày và màu sắc tùy chọn */
                                 border-radius: 10px; /* Định dạng viền cong (nếu bạn muốn) */
                                 box-sizing: border-box; /* Đảm bảo rằng kích thước của viền được tính vào kích thước của phần tử */
                                 "data-aos="fade-up" class="img-fluid rounded w-100 mb-4 " src="${getCourseByID.getImage()}" alt="Image">

                            <p data-aos="fade-up" >${getCourseByID.getDescription()}</p>
                        </div>



                        <!--Relate course-->
                        <h2 class="mb-3">Related Courses</h2>

                        <div class=" related-carousel position-relative" >
                            <c:forEach items="${listCourse_relate}" var="o"> 

                                <div style="margin-left: 10px" data-aos="fade-up" class="col-lg-11 col-md-11">
                                    <div class="course-item bg-light">
                                        <div class="position-relative overflow-hidden">
                                            <img style="width: 100%; /* Đảm bảo rằng ảnh sẽ rộng hết phần tử cha */
                                                 height: 200px; /* Chiều cao mong muốn */; /* Đảm bảo tỷ lệ khung hình bảo toàn */
                                                 border: 2px solid #ccc; /* Định dạng viền với độ dày và màu sắc tùy chọn */
                                                 border-radius: 10px; /* Định dạng viền cong (nếu bạn muốn) */
                                                 box-sizing: border-box; /* Đảm bảo rằng kích thước của viền được tính vào kích thước của phần tử */" class="img-fluid" src="${o.getImage()}" alt="">
                                            <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                                <a href="CourseDetail?cid=${o.getCourse_id()}" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>



                                                <c:choose>

                                                    <c:when test="${sessionScope.account == null}">
                                                        <!--nguoi dung chua dang nhap-->
                                                        <a href="join?action=login" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>

                                                    </c:when>

                                                    <c:otherwise><!--Nguoi dung da dang nhap-->
                                                        <c:set var="currentCourseId" value="${o.getCourse_id()}"/>
                                                        <c:set var="isPaid" value="false"/>
                                                        <c:if test="${fn:length(listEnrollment) > 0}">
                                                            <c:forEach items="${listEnrollment}" var="i">
                                                                <c:if test="${currentCourseId == i.getCourseid()}">                   
                                                                    <c:set var="isPaid" value="true"/>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                        <c:choose>
                                                            <c:when test="${isPaid == true}">
                                                                <a href="lesson?cid=${o.getCourse_id()}&lessonid=1" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="vnpay_pay.jsp?price=${o.getPrice()}&cid=${o.getCourse_id()}&acc=${sessionScope.account.getAccount_id()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                            </c:otherwise>

                                                        </c:choose> 

                                                    </c:otherwise>

                                                </c:choose>

                                            </div>
                                        </div>
                                        <div class="text-center p-4 pb-0">
                                            <h3 class="mb-0">${o.getFormattedPrice()}₫</h3>
                                            <div class="mb-3">
                                                <small class="fa fa-star text-primary"></small>
                                                <small class="fa fa-star text-primary"></small>
                                                <small class="fa fa-star text-primary"></small>
                                                <small class="fa fa-star text-primary"></small>
                                                <small class="fa fa-star text-primary"></small>
                                                <small>(123)</small>
                                            </div>
                                            <h5 class="mb-4">${o.getCourse_name()}</h5>
                                        </div>
                                        <div class="d-flex border-top">
                                            <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>${o.getInstructor()}</small>
                                            <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i>${o.getStudy_time()}</small>
                                            <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i>${o.getAmountSudentJoin()} Students</small>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!--end course relate-->
                        </div>

                    </div>




                    <div class="col-lg-4 mt-5 mt-lg-0">
                        <div class="bg-primary mb-5 py-3">
                            <h3 class="text-white py-3 px-4 m-0">Course Features</h3>
                            <div class="d-flex justify-content-between border-bottom px-4">
                                <h6 class="text-white my-3">Instructor</h6>
                                <h6 class="text-white my-3">${getCourseByID.getInstructor()}</h6>
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
                                <h6 class="text-white my-3">${getCourseByID.getStudy_time()}</h6>
                            </div>
                            <div class="d-flex justify-content-between border-bottom px-4">
                                <h6 class="text-white my-3">Skill level</h6>
                                <h6 class="text-white my-3">All Level</h6>
                            </div>
                            <div class="d-flex justify-content-between px-4">
                                <h6 class="text-white my-3">Language</h6>
                                <h6 class="text-white my-3">English</h6>
                            </div>
                            <h5 class="text-white py-3 px-4 m-0">Course Price: ${getCourseByID.getFormattedPrice()}₫</h5>
                            <c:if test="${sessionScope.account == null}">
                                <div class="py-3 px-4">
                                    <a style="background-color: #ee2a3d" class="btn btn-block btn-secondary py-3 px-5" href="join?action=login">Enroll Now</a>
                                </div>
                            </c:if>

                            <c:if test="${sessionScope.account != null}">
                                <c:set var="currentCourseId" value="${getCourseByID.getCourse_id()}"/>
                                <c:choose>

                                    <c:when test="${fn:length(listEnrollment) > 0}">
                                        <c:forEach items="${listEnrollment}" var="o">
                                            <c:if test="${currentCourseId == o.getCourseid()}">
                                                <div class="py-3 px-4">
                                                    <a style="background-color: #ee2a3d" class="btn btn-block btn-secondary py-3 px-5"href="lesson?cid=${currentCourseId}&lessonid=1" >Enroll Now</a>
                                                </div>
                                                <c:set var="isPaid" value="true"/>
                                            </c:if>
                                        </c:forEach>

                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="isPaid" value="false"/>
                                    </c:otherwise>




                                </c:choose> 

                                <c:if test="${isPaid != true}">
                                    <div class="py-3 px-4">
                                        <a style="background-color: #ee2a3d" class="btn btn-block btn-secondary py-3 px-5"href="vnpay_pay.jsp?price=${getCourseByID.getPrice()}&cid=${getCourseByID.getCourse_id()}&acc=${sessionScope.account.getAccount_id()}" >Enroll Now</a>
                                    </div>
                                </c:if>
                            </c:if>


                        </div>

                        <div class="mb-5 wow animate__animated animate__fadeInUp" data-wow-delay="0.1s">
                            <h2 class="mb-3">Categories</h2>

                            <ul class="list-group list-group-flush"> 
                                <c:forEach items="${listAllCategory}" var="o">
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0 wow animate__animated animate__fadeInUp" data-wow-delay="0.2s">
                                        <a href="" class="text-decoration-none h6 m-0">${o.getCategory_name()}</a>
                                        <span style="background-color: #06bbcc;
                                              border-radius: 4px;" class="badge badge-primary badge-pill">150</span>
                                    </li>

                                </c:forEach>
                            </ul>

                        </div>


                        <!--                        <div class="mb-5 wow animate__animated animate__fadeInUp" data-wow-delay="0.1s">
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
                                                </div>-->

                    </div>
                </div>
            </div>
        </div>
        <!-- Detail End -->

        <jsp:include page="common/footer.jsp"></jsp:include>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary rounded-0 btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>


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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Slick JS -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>


        <!-- JavaScript Libraries -->


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
