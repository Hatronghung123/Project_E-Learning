<%-- 
    Document   : lesson
    Created on : Jun 10, 2024, 12:53:18 AM
    Author     : Tuan Anh(Gia Truong)
--%>

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
    <link rel="stylesheet" href="../cdn.jsdelivr.net/fontawesome/4.5.0/css/font-awesome.min.css">



</head>

<body>



    <jsp:include page="common/menu.jsp"></jsp:include>


    <div class="mdk-drawer-layout js-mdk-drawer-layout flex" data-fullbleed data-push data-has-scrolling-region>
        <div class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
            <div class="container-fluid">

                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item"><a href="student-browse-courses.html">Courses</a></li>
                    <li class="breadcrumb-item active">The MVC architectural pattern</li>
                </ol>
                <h1 class="page-heading h2">The MVC architectural pattern</h1>


                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/XSajnOeOZz0?si=IuGYtUK9ILbI1_o8" title="0" frameborder="0" allowfullscreen></iframe>
                            </div>
                            <div class="card-body">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum dicta eius enim inventoreus optio ratione veritatis. Beatae deserunt illum ipsam magniima mollitia officiis quia tempora!
                            </div>
                        </div>


                        <!-- Lessons -->
                        <ul class="card list-group list-group-fit">
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted">1.</div>
                                    </div>
                                    <div class="media-body">
                                        <a href="#">Installation</a>
                                    </div>
                                    <div class="media-right">
                                        <small class="text-muted-light">2:03</small>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item active">
                                <div class="media">
                                    <div class="media-left">
                                        2.
                                    </div>
                                    <div  class="media-body">
                                        <a class="content-body" href="#">The MVC architectural pattern</a>
                                    </div>
                                    <div class="media-right">
                                        <small>25:01</small>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted">3.</div>
                                    </div>
                                    <div class="media-body">
                                        <a href="#">Database Models</a>
                                    </div>
                                    <div class="media-right">
                                        <small class="text-muted-light">12:10</small>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted">4.</div>
                                    </div>
                                    <div class="media-body">
                                        <a href="#">Database Access</a>
                                    </div>
                                    <div class="media-right">
                                        <small class="text-muted-light">1:25</small>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted">5.</div>
                                    </div>
                                    <div class="media-body">
                                        <a href="#">Eloquent Basics</a>
                                    </div>
                                    <div class="media-right">
                                        <small class="text-muted-light">22:30</small>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted">6.</div>
                                    </div>
                                    <div class="media-body">
                                        <a href="#">Take Quiz</a>
                                    </div>
                                    <div class="media-right">
                                        <small class="text-muted-light">10:00</small>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <!--download-->

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


                                    <div class="dev" >

                                        <div style="background-color: #edeff1" class="block-header block-header-default">
                                            <i style="margin-right: 4px; " class="fa fa-fw fa-list text-black"></i>
                                            <h3 class="block-title font-w800 text-black ">Module 1</h3>

                                            <div class="block-options">
                                                <button type="button" class="btn-block-option " data-toggle="block-option" data-action="content_toggle">
                                                    <i class="fa fa-fw fa-chevron-up"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div id="module1-content" class="module-content1">

                                           
                                            <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>

                                            <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>
                                        </div>
                                    </div>

                                    <div class="dev" >

                                        <div style="background-color: #edeff1" class="block-header block-header-default">
                                            <i style="margin-right: 4px; " class="fa fa-fw fa-list text-black"></i>
                                            <h3 class="block-title font-w800 text-black ">Module 2</h3>

                                            <div class="block-options">
                                                <button type="button" class="btn-block-option " data-toggle="block-option" data-action="content_toggle">
                                                    <i class="fa fa-fw fa-chevron-up"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div id="module2-content" class="module-content2" >
                                            <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>

                                            <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn  btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>    <a href="#" class="btn btn-primary btn-block btn--col">
                                                <i class="material-icons">get_app</i> Download Files
                                            </a>
                                        </div>
                                    </div>
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
                                        <h4 class="card-title"><a href="instructor-profile.html">Adrian Demian</a></h4>
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


<script>
$(document).ready(function () {
    $(".btn-block-option").click(function () {
        // Tìm đến phần tử cha gần nhất chứa cả nút và nội dung cần đóng/mở
        var parentBlock = $(this).closest('.dev');
        
        // Tìm đến phần tử con trực tiếp chứa các thẻ <a> để đóng/mở
        var moduleContent = parentBlock.find('.module-content1, .module-content2');
        
        // Toggle để ẩn hoặc hiện các thẻ a
        moduleContent.toggle();
        
        // Kiểm tra trạng thái hiện tại của nút
        var icon = $(this).find('i');
        if (icon.hasClass('fa-chevron-up')) {
            // Nếu nút đang hiển thị biểu tượng chevron lên, thì chuyển sang biểu tượng chevron xuống
            icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
        } else {
            // Nếu nút đang hiển thị biểu tượng chevron xuống, thì chuyển sang biểu tượng chevron lên
            icon.removeClass('fa-chevron-down').addClass('fa-chevron-up');
        }
    });
});

</script>


</body>


<!-- Mirrored from learnplus.frontendmatter.com/student-take-course.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Jun 2018 08:42:29 GMT -->
</html>