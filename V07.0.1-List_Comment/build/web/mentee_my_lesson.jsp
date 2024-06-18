<%-- 
    Document   : lesson
    Created on : Jun 10, 2024, 12:53:18 AM
    Author     : Tuan Anh(Gia Truong)
--%>
<%@page import="Model.Enrollment"%>
<%@page import="java.util.ArrayList"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Student - Take course</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <!-- Simplebar -->
    <link type="text/css" href="assets/vendor/simplebar.css" rel="stylesheet">

    <!-- Material Design Icons  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Roboto Web Font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">

    <!-- MDK -->
    <link type="text/css" href="assets/vendor/material-design-kit.css" rel="stylesheet">

    <!-- Sidebar Collapse -->
    <link type="text/css" href="assets/vendor/sidebar-collapse.min.css" rel="stylesheet">

    <!-- App CSS -->
    <!--    <link  href="assets/css/style.css" rel="stylesheet">-->


    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->

    <link href="lib/owlcarousels/assets/owl.carousel.min.css" rel="stylesheet">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Vendor CSS -->


    <style>
        .module-content {
            display: none; /* Initially hide module contents */
        }
        .btnn {
            background-color: #2bc5d4;
            border-radius: 4px;
        }
        .btnn:hover {
            background-color: #32e8fa;
        }

        .module-content a {
            text-align: left;
            display: block;
            color: #2bc5d4 !important;
        }

        .active-lesson {
            font-weight: bold; /* Làm cho văn bản đậm hơn */
            color: #007bff;    /* Đổi màu chữ */
            background-color: black; /* Thay đổi nền */
            border-left: 3px solid #007bff; /* Thêm viền bên trái */
        }
        .comments {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .comments h2 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .comment-input {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .comment-input img.avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .comment-input textarea {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }

        .comment-input button {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: #FF6600;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .comment-input button:hover {
            background-color: #e65c00;
        }

        .comment-list {
            margin-top: 20px;
        }

        .comment {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
            position: relative;
        }

        .comment img.avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .comment-content {
            background-color: #f1f1f1;
            padding: 10px;
            border-radius: 5px;
            flex-grow: 1;
        }

        .comment-content p {
            margin: 5px 0;
        }

        .comment-actions {
            display: flex;
            gap: 10px;
            font-size: 0.9em;
            color: #555;
        }

        .comment-actions span {
            cursor: pointer;
        }

        .comment-actions span:hover {
            text-decoration: underline;
        }

        .timestamp {
            font-size: 0.8em;
            color: #888;
        }

        .comment-menu {
            position: absolute;
            right: 0;
            top: 10px;
        }

        .comment-menu-button {
            cursor: pointer;
            font-size: 1.5em;
            padding: 5px;
        }

        .comment-menu-content {
            display: none;
            position: absolute;
            right: 0;
            top: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            z-index: 10;
        }

        .comment-dropdown {
            padding: 5px;
            border: none;
            background: transparent;
            cursor: pointer;
            font-size: 1em;
        }

        .comment-menu-button:hover+.comment-menu-content,
        .comment-menu-content:hover {
            display: block;
        }

    </style>

</head>

<body>



    <jsp:include page="common/menu.jsp"></jsp:include>


        <div class="mdk-drawer-layout js-mdk-drawer-layout flex" data-fullbleed data-push data-has-scrolling-region>
            <div class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home">Home</a></li>
                        <li class="breadcrumb-item"><a href="student-browse-courses.html">Courses</a></li>
                        <li class="breadcrumb-item active">${lesson.getCoursename()}</li>
                </ol>
                <h1 class="page-heading h2">${lesson.getCoursename()}</h1>


                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="${lesson.getLessonvideo()}"title="0" frameborder="0" allow="0"  allowfullscreen></iframe>
                            </div>
                            <div class="card-body">
                                ${lesson.getLessoncontent()}
                            </div>
                        </div>

                        <!--comment-->
                        <div class="comments">
                            <h2>Comments</h2>
                            <form action="${pageContext.request.contextPath}/course/learning?sub_lesson_id=${subLesson.id}" method="post">
                                <div class="comment-input">
                                    <img src="https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png" alt="User Avatar" class="avatar">
                                    <textarea  name="content" rows="1" placeholder="Add a comment..."></textarea>
                                    <input type="hidden" name="comment" value="0">
                                    <button type="submit" >Submit</button>
                                </div>
                            </form>


                            <div class="comment-list">
                                <c:forEach var="c" items="${comment1}"> 
                                    <div class="comment">
                                        <img src="https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png" alt="User1 Avatar" class="avatar">    
                                        <div class="comment-content">
                                            <p><strong>${c.getName()}</strong></p>
                                            <p>${c.getComment()}</p>
                                        </div> 
                                        <div class="comment-menu">
                                            <span class="comment-menu-button" onclick="toggleMenu(this)">...</span>
                                            <div class="comment-menu-content">
                                                <form id="commentForm" action="" method="post">
                                                    <input type="hidden" name="sub_lesson_id" value="${subLesson.id}">
                                                    <input type="hidden" name="commentId" value="${c.commentId}">
                                                    <input type="hidden" name="userId" value="${c.userId}">
                                                    <select name="action" class="comment-dropdown"  onchange="submitForm(this)">
                                                        <option value="">Select action</option>
                                                        <option value="delete">Delete</option>
                                                    </select>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach> 
                            </div>

                        </div>
                        <script>
                            function toggleMenu(element) {
                                var menuContent = element.nextElementSibling;
                                if (menuContent.style.display === "none" || menuContent.style.display === "") {
                                    menuContent.style.display = "block";
                                } else {
                                    menuContent.style.display = "none";
                                }
                            }


                            function submitForm(selectElement) {
                                if (selectElement.value !== "") {
                                    selectElement.form.submit();
                                }
                            }



                            window.onclick = function (event) {
                                if (!event.target.matches('.comment-menu-button')) {
                                    const dropdowns = document.getElementsByClassName("comment-menu-content");
                                    for (let i = 0; i < dropdowns.length; i++) {
                                        const openDropdown = dropdowns[i];
                                        if (openDropdown.style.display === "block") {
                                            openDropdown.style.display = "none";
                                        }
                                    }
                                }
                            }
                        </script>


                        <!-- Lessons -->
                        <ul class="">

                        </ul>
                    </div>


                    <!--list lesson-->
                    <div  class="col-md-4">
                        <div class="card">

                            <div class="card-body " >

                                <div style="background-color: #ffff" class="block-header block-header-default bg-gd-primary">
                                    <i style="margin-right: 4px; " class="fa fa-fw fa-list text-inherit"></i>
                                    <h3 class="block-title font-w800 text-inherit ">   DANH SÁCH BÀI HỌC</h3>

                                    <!--                                    <div class="block-options">
                                                                            <button type="button" class="btn-block-option " data-toggle="block-option" data-action="content_toggle">
                                                                                <i class="fa fa-fw fa-chevron-up"></i>
                                                                            </button>
                                                                        </div>-->
                                </div>

                                <div class="child-hai">
                                    <c:forEach items="${moduleList}" var="o" varStatus="status">

                                        <div class="dev" >

                                            <div style="background-color: #edeff1" class="block-header block-header-default">
                                                <h3 class="block-title font-w800 text-black ">${status.index + 1}. ${o.getModulename()}</h3>

                                                <div class="block-options">
                                                    <button type="button" class="btn-block-option " data-toggle="block-option" data-action="content_toggle">
                                                        <i class="fa fa-fw fa-chevron-up"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <c:forEach items="${lessonList}" var="i" varStatus="status">
                                                <div class="module-content">


                                                    <a href="lesson?cid=${i.getCourseid()}&lessonid=${i.getLessonid()}" class="btn btn-block btn--col module-lesson" data-lessonid="${i.getLessonid()}">
                                                        ${status.index + 1}. ${i.getLessonname()}
                                                    </a>



                                                </div>
                                            </c:forEach>

                                        </div>

                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header bg-white">
                                <div class="media">
                                    <div class="media-left media-middle">
                                        <img src="assets/images/people/110/guy-6.jpg" alt="About Adrian" width="50" class="rounded-circle">
                                    </div>
                                    <div class="media-body media-middle">
                                        <h4 class="card-title"><a href="instructor-profile.html">${lesson.getMentorname()}</a></h4>
                                        <p class="card-subtitle">Instructor</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <p>Having over 12 years exp. Adrian is one of the lead UI designers in the industry Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, aut.</p>
                                <a href="#" class="btn btn-default"><i class="fa fa-facebook"></i></a>
                                <a href="#" class="btn btn-default"><i class="fa fa-twitter"></i></a>
                                <a href="#" class="btn btn-default"><i class="fa fa-github"></i></a>
                            </div>
                        </div>

                        <div class="card">
                            <ul class="list-group list-group-fit">
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <i class="material-icons text-muted-light">schedule</i>
                                        </div>
                                        <div class="media-body media-middle">
                                            2 <small class="text-muted">hrs</small> &nbsp; 26 <small class="text-muted">min</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <i class="material-icons text-muted-light">assessment</i>
                                        </div>
                                        <div class="media-body media-middle">Beginner</div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Ratings</h4>
                            </div>
                            <div class="card-body">
                                <div class="rating">
                                    <i class="material-icons">star</i>
                                    <i class="material-icons">star</i>
                                    <i class="material-icons">star</i>
                                    <i class="material-icons">star</i>
                                    <i class="material-icons">star_border</i>
                                </div>
                                <small class="text-muted">20 ratings</small>
                            </div>
                        </div>

                        <a href="student-help-center.html" class="btn btn-default btn-block">
                            <i class="material-icons btn__icon--left">help</i> Get Help
                        </a>
                    </div>
                </div>

            </div>
        </div>






    </div>


    <!-- jQuery -->
    <script src="assets/vendor/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/vendor/popper.min.js"></script>
    <script src="assets/vendor/bootstrap.min.js"></script>

    <!-- Simplebar -->
    <!-- Used for adding a custom scrollbar to the drawer -->
    <script src="assets/vendor/simplebar.js"></script>

    <!-- MDK -->
    <script src="assets/vendor/dom-factory.js"></script>
    <script src="assets/vendor/material-design-kit.js"></script>

    <!-- Sidebar Collapse -->
    <script src="assets/vendor/sidebar-collapse.js"></script>

    <!-- App JS -->
    <script src="assets/js/main.js"></script>

    <script src="js/module-toggle.js"></script>




    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easings/easing.min.js"></script>
    <script src="lib/waypointss/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>

    <script src="lib/wow/wow.min.js"></script>


    <!-- Template Javascript -->
    <script src="js/index.js"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>



</body>


<!-- Mirrored from learnplus.frontendmatter.com/student-take-course.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Jun 2018 08:42:29 GMT -->
</html>