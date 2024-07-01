<%-- 
    Document   : courses
    Created on : May 14, 2024, 7:40:05 PM
    Author     : Tuan Anh(Gia Truong)
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>eLEARNING - eLearning HTML Template</title>
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
        <style>
            @import url('https://fonts.googleapis.com/css?family=Dosis:400,600,700,800');



            .product-slider__fav {
                color: #888e94;
                background: none;
                border: none;
                position: relative;
                outline: none;
                cursor: pointer;
                transition: all .3s;
                font-family: 'Dosis', sans-serif;
                font-weight: 600;
                text-transform: uppercase;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 40px;
                text-decoration: none;

            }


            .heart {
                margin-top :15px;
                margin-left: -20px;
                display: block;
                position: absolute;
                top: 10%;
                left: 10%;
                transform: translate(-50%, -50%) scale(0.7);
                pointer-events: none;
                width: 100px;
                height: 100px;
                background: url("https://res.cloudinary.com/muhammederdem/image/upload/v1536405215/starwars/heart.png") no-repeat;
                background-position: 0 0;
                transition: background-position 1s steps(28);
                transition-duration: 0s;
            }
            .heart.is-active {
                transition-duration: 1s;
                background-position: -2800px 0;
            }





        </style>

    </head>

    <body>

        <!--Xử lí nút resum-->

        <%
                String lastLessonId = null;
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                    if ("lastLessonId".equals(cookie.getName())) {
                        lastLessonId = cookie.getValue();
                        break;
                    }
                }
                }
            if (lastLessonId == null) {
            // Nếu không có cookie, bạn có thể đặt giá trị mặc định, ví dụ: bài học đầu tiên
            lastLessonId = "1"; // hoặc bất kỳ giá trị nào khác mà bạn cho là hợp lý
            }
        %>


        <jsp:include page="common/menu.jsp"></jsp:include>


            <!-- Header Start -->
            <div class="container-fluid bg-primary py-5 mb-5 page-header">
                <div class="container py-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-10 text-center">
                            <h1 class="display-3 text-white animated slideInDown">Courses</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a class="text-white" href="home">Home</a></li>

                                    <li class="breadcrumb-item text-white active" aria-current="page">Courses</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header End -->

            <!--    Start courses list-->
            <div class="container-xxl py-5 category">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title bg-white text-center text-primary px-3">Courses</h6>
                        <h1 class="mb-5">Courses List</h1>
                    </div>
                    <div class="row">
                    <c:forEach var="o" items="${listCourseByCategory}">
                        <div class="col-lg-4 col-md-6 wow fadeInUp"  data-wow-delay="0.3s" style="padding-bottom: 20px;">
                            <div class="course-item bg-light"   >
                                <div class="position-relative overflow-hidden">
                                    <img style="width: 100%; /* Đảm bảo rằng ảnh sẽ rộng hết phần tử cha */
                                         height: 260px; /* Chiều cao mong muốn */; /* Đảm bảo tỷ lệ khung hình bảo toàn */
                                         border: 2px solid #ccc; /* Định dạng viền với độ dày và màu sắc tùy chọn */
                                         border-radius: 10px; /* Định dạng viền cong (nếu bạn muốn) */
                                         box-sizing: border-box;
                                         " class="img-fluid"  src="${o.getImage()}"  alt="">
                                    <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                        <a href="CourseDetail?cid=${o.getCourse_id()}" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>

                                        <c:choose>

                                            <c:when test="${sessionScope.account == null}">
                                                <!--nguoi dung chua dang nhap-->
                                                <a href="join?action=login&cid=${o.getCourse_id()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>

                                            </c:when>


                                            <c:otherwise><!--Nguoi dung da dang nhap-->

                                                <!--Nguoi này là ngươi tao ra khoa hoc duoc join truc tiep-->
                                                <c:choose>
                                                    <c:when test="${o.getCreate_by() == sessionScope.account.getAccount_id()}">
                                                        <a href="dataTransferLesson?cid=${o.getCourse_id()}&lessonid=${o.getFirstlessonid()}&createBy=${o.getCreate_by()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                    </c:when>

                                                    <c:otherwise>


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
                                                                <a href="dataTransferLesson?cid=${o.getCourse_id()}&lessonid=${o.getFirstlessonid()}&createBy=${o.getCreate_by()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="vnpay_pay.jsp?price=${o.getPrice()}&cid=${o.getCourse_id()}&acc=${sessionScope.account.getAccount_id()}&ndck=${sessionScope.profile.fullname} chuyen khoan" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                            </c:otherwise>

                                                        </c:choose> 
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>

                                        </c:choose>

                                    </div>
                                </div>
                                <!--ADD TO WISHLIST-->
                                <c:if test="${sessionScope.account != null}">

                                    <!--nguoi dung chua dang nhap-->
                                    <div class ="wishlist">
                                        <div class="product-slider">
                                            <a class="product-slider__fav js-fav" href="my-courses?accid=${sessionScope.account.getAccount_id()}&cid=${o.getCourse_id()}">
                                                <c:choose>
                                                    <c:when test="${CourseIdList.contains(o.getCourse_id())}">
                                                        <div class="heart is-active">
                                                            <div class ="wishlist-text">ADD TO WISHLIST </div>
                                                        </div>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <div class="heart ">
                                                            <div class ="wishlist-text">ADD TO WISHLIST </div>
                                                        </div> 
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                        </div>
                                    </div>

                                </c:if>
                                <div class="text-center pb-0" style ="padding-left: 12px;padding-right: 12px;padding-bottom: 12px;padding-top: 7px;">
                                    <h3 class="mb-0">${o.getFormattedPrice()}₫</h3>
                                    <div class="mb-3">
                                        <c:forEach var="i" begin="1" end="${o.getStar()}">
                                            <small class="fa fa-star text-primary"></small>
                                        </c:forEach>
                                        <c:forEach var="i" begin="${o.getStar() +1}" end="5">
                                            <small class="fa fa-star empty-star"></small>
                                        </c:forEach>

                                        <small>(${o.getSumOfRating()})</small>
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


                    <c:forEach var="o" items="${listCourseBySearch}">
                        <div class="col-lg-4 col-md-6 wow fadeInUp"  data-wow-delay="0.3s" style="padding-bottom: 20px;">
                            <div class="course-item bg-light"   >
                                <div class="position-relative overflow-hidden">
                                    <img style="width: 100%; /* Đảm bảo rằng ảnh sẽ rộng hết phần tử cha */
                                         height: 260px; /* Chiều cao mong muốn */; /* Đảm bảo tỷ lệ khung hình bảo toàn */
                                         border: 2px solid #ccc; /* Định dạng viền với độ dày và màu sắc tùy chọn */
                                         border-radius: 10px; /* Định dạng viền cong (nếu bạn muốn) */
                                         box-sizing: border-box;
                                         " class="img-fluid"  src="${o.getImage()}"  alt="">
                                    <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                        <a href="CourseDetail?cid=${o.getCourse_id()}" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>

                                        <c:choose>

                                            <c:when test="${sessionScope.account == null}">
                                                <!--nguoi dung chua dang nhap-->
                                                <a href="join?action=login&cid=${o.getCourse_id()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>

                                            </c:when>


                                            <c:otherwise><!--Nguoi dung da dang nhap-->

                                                <!--Nguoi này là ngươi tao ra khoa hoc duoc join truc tiep-->
                                                <c:choose>
                                                    <c:when test="${o.getCreate_by() == sessionScope.account.getAccount_id()}">
                                                        <a href="dataTransferLesson?cid=${o.getCourse_id()}&lessonid=${o.getFirstlessonid()}&createBy=${o.getCreate_by()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                    </c:when>

                                                    <c:otherwise>


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
                                                                <a href="dataTransferLesson?cid=${o.getCourse_id()}&lessonid=${o.getFirstlessonid()}&createBy=${o.getCreate_by()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="vnpay_pay.jsp?price=${o.getPrice()}&cid=${o.getCourse_id()}&acc=${sessionScope.account.getAccount_id()}&ndck=${sessionScope.profile.fullname} chuyen khoan" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                            </c:otherwise>

                                                        </c:choose> 
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>

                                        </c:choose>

                                    </div>
                                </div>
                                <!--ADD TO WISHLIST-->
                                <c:if test="${sessionScope.account != null}">

                                    <!--nguoi dung chua dang nhap-->
                                    <div class ="wishlist">
                                        <div class="product-slider">
                                            <a class="product-slider__fav js-fav" href="my-courses?accid=${sessionScope.account.getAccount_id()}&cid=${o.getCourse_id()}">
                                                <c:choose>
                                                    <c:when test="${CourseIdList.contains(o.getCourse_id())}">
                                                        <div class="heart is-active">
                                                            <div class ="wishlist-text">ADD TO WISHLIST </div>
                                                        </div>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <div class="heart ">
                                                            <div class ="wishlist-text">ADD TO WISHLIST </div>
                                                        </div> 
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                        </div>
                                    </div>

                                </c:if>
                                <div class="text-center p-4 pb-0">
                                    <h3 class="mb-0">${o.getFormattedPrice()}₫</h3>
                                    <div class="mb-3">
                                        <c:forEach var="i" begin="1" end="${o.getStar()}">
                                            <small class="fa fa-star text-primary"></small>
                                        </c:forEach>
                                        <c:forEach var="i" begin="${o.getStar() +1}" end="5">
                                            <small class="fa fa-star empty-star"></small>
                                        </c:forEach>

                                        <small>(${o.getSumOfRating()})</small>
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


                    <c:forEach var="o" items="${listAllCourse}">
                        <div class="col-lg-4 col-md-6 wow fadeInUp"  data-wow-delay="0.3s" style="padding-bottom: 20px;">
                            <div class="course-item bg-light"   >
                                <div class="position-relative overflow-hidden">
                                    <img style="width: 100%; /* Đảm bảo rằng ảnh sẽ rộng hết phần tử cha */
                                         height: 260px; /* Chiều cao mong muốn */; /* Đảm bảo tỷ lệ khung hình bảo toàn */
                                         border: 2px solid #ccc; /* Định dạng viền với độ dày và màu sắc tùy chọn */
                                         border-radius: 10px; /* Định dạng viền cong (nếu bạn muốn) */
                                         box-sizing: border-box;
                                         " class="img-fluid"  src="${o.getImage()}"  alt="">
                                    <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                        <a href="CourseDetail?cid=${o.getCourse_id()}" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                        <c:choose>

                                            <c:when test="${sessionScope.account == null}">
                                                <!--nguoi dung chua dang nhap-->
                                                <a href="join?action=login&cid=${o.getCourse_id()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>

                                            </c:when>


                                            <c:otherwise><!--Nguoi dung da dang nhap-->

                                                <!--Nguoi này là ngươi tao ra khoa hoc duoc join truc tiep-->
                                                <c:choose>
                                                    <c:when test="${o.getCreate_by() == sessionScope.account.getAccount_id()}">
                                                        <a href="dataTransferLesson?cid=${o.getCourse_id()}&lessonid=${o.getFirstlessonid()}&createBy=${o.getCreate_by()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                    </c:when>

                                                    <c:otherwise>


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
                                                                <a href="dataTransferLesson?cid=${o.getCourse_id()}&lessonid=${o.getFirstlessonid()}&createBy=${o.getCreate_by()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="vnpay_pay.jsp?price=${o.getPrice()}&cid=${o.getCourse_id()}&acc=${sessionScope.account.getAccount_id()}&ndck=${sessionScope.profile.fullname} chuyen khoan" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                            </c:otherwise>

                                                        </c:choose> 
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>

                                        </c:choose>


                                    </div>
                                </div>

                                <!--ADD TO WISHLIST-->
                                <c:if test="${sessionScope.account != null}">

                                    <!--nguoi dung chua dang nhap-->
                                    <div class ="wishlist">
                                        <div class="product-slider">
                                            <a class="product-slider__fav js-fav" href="my-courses?accid=${sessionScope.account.getAccount_id()}&cid=${o.getCourse_id()}">
                                                <c:choose>
                                                    <c:when test="${CourseIdList.contains(o.getCourse_id())}">
                                                        <div class="heart is-active">
                                                            <div class ="wishlist-text">ADD TO WISHLIST </div>
                                                        </div>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <div class="heart ">
                                                            <div class ="wishlist-text">ADD TO WISHLIST </div>
                                                        </div> 
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                        </div>
                                    </div>

                                </c:if>



                                <div class="text-center pb-0" style ="padding-left: 12px;padding-right: 12px;padding-bottom: 12px; padding-top: 5px;">
                                    <h3 class="mb-0">${o.getFormattedPrice()}₫</h3>
                                    <div class="mb-3">
                                        <c:forEach var="i" begin="1" end="${o.getStar()}">
                                            <small class="fa fa-star text-primary"></small>
                                        </c:forEach>
                                        <c:forEach var="i" begin="${o.getStar() +1}" end="5">
                                            <small class="fa fa-star empty-star"></small>
                                        </c:forEach>

                                        <small>(${o.getSumOfRating()})</small>
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
                </div>
            </div>
        </div>
        <!--    End courses list-->

        <!-- Testimonial Start -->
        <!--        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="container">
                        <div class="text-center">
                            <h6 class="section-title bg-white text-center text-primary px-3">Testimonial</h6>
                            <h1 class="mb-5">Our Students Say!</h1>
                        </div>
                        <div class="owl-carousel testimonial-carousel position-relative">
                            <div class="testimonial-item text-center">
                                <img class="border rounded-circle p-2 mx-auto mb-3" src="img/testimonial-1.jpg" style="width: 80px; height: 80px;">
                                <h5 class="mb-0">Client Name</h5>
                                <p>Profession</p>
                                <div class="testimonial-text bg-light text-center p-4">
                                    <p class="mb-0">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                                </div>
                            </div>
                            <div class="testimonial-item text-center">
                                <img class="border rounded-circle p-2 mx-auto mb-3" src="img/testimonial-2.jpg" style="width: 80px; height: 80px;">
                                <h5 class="mb-0">Client Name</h5>
                                <p>Profession</p>
                                <div class="testimonial-text bg-light text-center p-4">
                                    <p class="mb-0">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                                </div>
                            </div>
                            <div class="testimonial-item text-center">
                                <img class="border rounded-circle p-2 mx-auto mb-3" src="img/testimonial-3.jpg" style="width: 80px; height: 80px;">
                                <h5 class="mb-0">Client Name</h5>
                                <p>Profession</p>
                                <div class="testimonial-text bg-light text-center p-4">
                                    <p class="mb-0">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                                </div>
                            </div>
                            <div class="testimonial-item text-center">
                                <img class="border rounded-circle p-2 mx-auto mb-3" src="img/testimonial-4.jpg" style="width: 80px; height: 80px;">
                                <h5 class="mb-0">Client Name</h5>
                                <p>Profession</p>
                                <div class="testimonial-text bg-light text-center p-4">
                                    <p class="mb-0">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
        <!-- Testimonial End -->



        <jsp:include page="common/footer.jsp"></jsp:include>


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
        <script>      document.addEventListener('DOMContentLoaded', function () {
                var favButtons = document.querySelectorAll(".js-fav");
                favButtons.forEach(function (favButton) {
                    favButton.addEventListener("click", function (event) {
                        event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a> (chuyển hướng)

                        // Thực hiện ngầm hành động thêm vào wishlist
                        var href = this.getAttribute("href");
                        console.log("Adding to wishlist: " + href);

                        // Thực hiện thêm vào wishlist (Ví dụ: gửi yêu cầu AJAX)
                        var xhr = new XMLHttpRequest();
                        xhr.open("GET", href, true);
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                console.log("Added to wishlist");
                            }
                        };
                        xhr.send();

                        // Thay đổi trạng thái của icon trái tim
                        var heartIcon = this.querySelector('.heart');
                        if (heartIcon) {
                            heartIcon.classList.toggle("is-active");
                        }
                    });
                });
            });</script>
    </body>


</html>
