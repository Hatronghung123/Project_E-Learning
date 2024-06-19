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
            background-color: #2bc5d4;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .comment-input button:hover {
            background-color: #36f1ff;
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


        .comment-content {
            flex-grow: 1; /* Cho phép nội dung bình luận chiếm không gian còn lại */
        }

        .comment-actions {
            position: absolute;
            top: 0;
            right: 0;
            margin-top: 5px;
        }

        .reply-btn, .submit-reply-btn, .delete-btn {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            padding: 5px 10px;
            margin-right: 5px;
        }

        .reply-textarea {
            display: none; /* Ẩn ban đầu */
            width: 100%;
            padding: 5px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .replies {
            margin-left: 50px; /* Thụt lề các reply để phân cấp */
            padding-left: 10px;
            border-left: 2px solid #ddd; /* Đường kẻ dọc để phân biệt các reply */
        }

        .replies .comment-content {
            display: flex;
            align-items: flex-start;
        }

        .replies img.avatar {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .module-content a {
            text-align: left;
            display: block;
            color: black;
        }

        .comment {
            position: relative;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
            margin-bottom: 1px;
        }

        .comment .comment-content {
            margin-left: 50px;
        }

        .comment-actions {
            position: absolute;
            top: 0;
            right: 0;
            margin-top: 5px;
        }

        .reply-btn, .submit-reply-btn, .delete-btn {
            background-color: #2bc5d4;
            color: white;
            border: none;
            cursor: pointer;
            padding: 5px 10px;
            margin-right: 5px;

        }
        .reply-form{
            margin-bottom: 30px;
        }

        .reply-textarea {
            display: none;
            width: 100%;
            padding: 5px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .reply-textarea {
            display: none; /* Ẩn ban đầu */
        }


        .replies {
            margin-left: 50px; /* Giữ nguyên thụt lề bên trái */
            padding-left: 20px;

            border-left: 2px solid #ddd; /* Đường kẻ dọc để phân biệt các reply */
        }


        .replies img.avatar {
            width: 30px;
            height: 30px;
            border-radius: 50%;

        }


        .comment-content {
            background-color: #f1f1f1;
            padding: 10px;
            border-radius: 5px;
            flex-grow: 1;
            display: flex; /* Sử dụng flexbox */
            flex-direction: column; /* Hiển thị các phần tử con theo chiều dọc */
        }

        .comment-content p {
            margin: 5px 0;
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
                            <!-- Thêm comment mới -->
                            <form action="lesson?status=insert" method="post">
                                <div class="comment-input">
                                    <img src="https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png" alt="User Avatar" class="avatar">
                                    <textarea required="" name="content" rows="1" placeholder="Add a comment..."></textarea>
                                    <input type="hidden" name="cid" value="${lesson.getCourseid()}">
                                    <input type="hidden" name="lessonid" value="${lesson.getLessonid()}">
                                    <input type="hidden" name="parentCommentID" value="">
                                    <button type="submit">Submit</button>
                                </div>
                            </form>





                            <!-- Hiển thị comment và reply -->
                            <div class="comment-list">
                                <c:forEach var="o" items="${mainComments}"> 
                                    <c:if test="${o.getLessonId() == lesson.getLessonid()}">
                                        <div class="comment">
                                            <img src="https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png" alt="User1 Avatar" class="avatar">    
                                            <div class="comment-content">
                                                <p><strong>${o.getName()}</strong>  <span class="timestamp">${o.getTimeAgo()}</span></p>
                                                <p>${o.getComment()}</p> 




                                            </div> 
                                            <!-- Nút xóa comment -->
                                            <c:if test="${sessionScope.account.getAccount_id() == o.getAcccountId()}">
                                                <form action="lesson?status=delete" method="post" class="delete-form">
                                                    <input type="hidden" name="cid" value="${lesson.getCourseid()}">
                                                    <input type="hidden" name="lessonid" value="${lesson.getLessonid()}">
                                                    <input type="hidden" name="disscussID" value="${o.getDisscussionID()}">
                                                    <input type="hidden" name="parent" value="null">
                                                    <button type="submit">Delete</button>
                                                </form>
                                            </c:if>

                                        </div>

                                        <div class="comment-list replies">
                                            <!-- Hiển thị các reply -->
                                            <c:forEach var="reply" items="${repliesMap[o.getDisscussionID()]}">
                                                <div class="comment replies">
                                                    <img src="https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png" alt="User Avatar" class="avatar">
                                                    <div class="comment-content">
                                                        <p><strong>${reply.getName()}</strong><span class="timestamp">${reply.getTimeAgo()}</span></p>
                                                        <p>${reply.getComment()}</p>


                                                    </div>          
                                                    <!--    Nút xóa reply 
                                                    -->  
                                                    <c:if test="${sessionScope.account.getAccount_id() == reply.getAcccountId()}">
                                                        <form action="lesson?status=delete" method="post" class="delete-form">
                                                            <input type="hidden" name="cid" value="${lesson.getCourseid()}">
                                                            <input type="hidden" name="lessonid" value="${lesson.getLessonid()}">
                                                            <input type="hidden" name="disscussID" value="${reply.getDisscussionID()}">
                                                            <input type="hidden" name="parent" value="${reply.getParentId()}">
                                                            <button type="submit">Delete</button>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </c:forEach>
                                        </div> 


                                        <!-- Form để thêm reply -->
                                        <form action="lesson?status=insert" method="post" class="reply-form">
                                            <input type="hidden" name="lessonid" value="${lesson.getLessonid()}">
                                            <input type="hidden" name="parent" value="${o.getDisscussionID()}">
                                            <!--Chuyển lai trang có cid hiện tại-->
                                            <input type="hidden" name="cid" value="${lesson.getCourseid()}">

                                            <!-- Thêm class `reply-textarea` vào textarea để dễ dàng chọn từ JavaScript -->
                                            <textarea required="" name="content" rows="1" placeholder="Reply to this comment..." class="reply-textarea" style="display: none;"></textarea>
                                            <button type="button" class="reply-btn">Reply</button>
                                            <button type="submit" style="display: none;">Submit Reply</button>
                                            <button type="button" onclick="cancelReply(this)">Cancel</button>
                                        </form>



                                    </c:if>
                                </c:forEach>
                            </div>

                        </div>



                        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                var replyButtons = document.querySelectorAll('.reply-btn');

                                replyButtons.forEach(function (button) {
                                    button.addEventListener('click', function () {
                                        // Tìm ô textarea trong form reply hiện tại và hiển thị nó
                                        var textarea = this.parentNode.querySelector('.reply-textarea');
                                        textarea.style.display = 'block';
                                        // Ẩn nút "Reply" và hiển thị nút "Submit Reply"
                                        this.style.display = 'none';
                                        this.parentNode.querySelector('button[type="submit"]').style.display = 'inline-block';
                                    });
                                });
                            });

                            document.addEventListener("DOMContentLoaded", function () {
                                var replyButtons = document.querySelectorAll('.reply-btn');

                                replyButtons.forEach(function (button) {
                                    button.addEventListener('click', function () {
                                        var form = this.parentNode;
                                        var textarea = form.querySelector('.reply-textarea');
                                        var submitButton = form.querySelector('.submit-reply-btn');
                                        var cancelButton = form.querySelector('.cancel-btn');

                                        // Hiển thị textarea và các nút liên quan
                                        textarea.style.display = 'block';
                                        submitButton.style.display = 'inline-block';
                                        cancelButton.style.display = 'inline-block';
                                        // Ẩn nút "Reply"
                                        this.style.display = 'none';
                                    });
                                });
                            });

                            function cancelReply(button) {
                                var form = button.parentNode;
                                var textarea = form.querySelector('.reply-textarea');
                                var replyButton = form.querySelector('.reply-btn');
                                var submitButton = form.querySelector('.submit-reply-btn');

                                // Ẩn textarea và các nút liên quan
                                textarea.style.display = 'none';
                                submitButton.style.display = 'none';
                                button.style.display = 'none';
                                // Hiển thị nút "Reply"
                                replyButton.style.display = 'inline-block';
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

                                                    <c:if test="${o.getModulename() == i.getModulname()}">
                                                        <a href="lesson?cid=${i.getCourseid()}&lessonid=${i.getLessonid()}" class="btn btn-block btn--col module-lesson" data-lessonid="${i.getLessonid()}">
                                                            ${status.index + 1}. ${i.getLessonname()}
                                                        </a>
                                                    </c:if>


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