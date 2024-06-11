<%-- 
    Document   : cq
    Created on : Jun 11, 2024, 2:49:53 PM
    Author     : hatro
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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




        <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
        <meta name="robots" content="noindex">

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

        <!--         App CSS 
                <link type="text/css" href="assets/css/style.css" rel="stylesheet">-->


        <!-- Touchspin -->
        <link rel="stylesheet" href="assets/css/bootstrap-touchspin.css">

        <!-- Vendor CSS -->
        <link rel="stylesheet" href="assets/css/nestable.css">
        <!-- link css quiz add-->
        <link rel="stylesheet" href="assets/createQuiz/style.css"/>
    </head>
    <body>
        <jsp:include page="commont/header.jsp"></jsp:include>

        <div class="container">

            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="fixed-instructor-dashboard.html">Home</a></li>
                <li class="breadcrumb-item"><a href="fixed-instructor-quizzes.html">Quiz Manager</a></li>
                <li class="breadcrumb-item active">Edit Quiz</li>
            </ol>
            <h1 class="page-heading h2">Vue.js Deploy Quiz</h1>
            <div class="card" style="margin-bottom: 16px">
                <div class="card-header">
                    <h4 class="card-title">Basic</h4>
                </div>
                <div class="card-body">
                    <form action="#">
                        <div class="form-group row">
                            <label for="course_title" class="col-sm-3 col-form-label">Quiz Title:</label>
                            <div class="col-sm-9 col-md-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Title" aria-describedby="sizing-addon2" value="Vue.js Introduction">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <!--                            <label for="course_title" class="col-sm-3 col-form-label">Course:</label>
                                                        <div class="col-sm-9 col-md-4">
                                                            <select class="custom-select form-control">
                                                                <option value="#">HTML</option>
                                                                <option value="#">Angular JS</option>
                                                                <option value="#" selected>Vue.js</option>
                                                                <option value="#">CSS / LESS</option>
                                                                <option value="#">Design / Concept</option>
                                                            </select>
                                                        </div>-->
                        </div>

                        <div class="form-group row">
                            <!--                            <label for="course_title" class="col-sm-3 col-form-label">Quiz Image:</label>
                                                        <div class="col-sm-9 col-md-4">
                                                            <p><img src="assets/images/vuejs.png" alt="" width="150" class="rounded"></p>
                                                            <label class="custom-file">
                                                                <input type="file" id="file">
                                                                <span class="custom-file-control"></span>
                                                            </label>
                                                        </div>-->
                        </div>
                        <div class="form-group row">
                            <label for="time_toggle" class="col-sm-3 col-form-label">Timeframe:</label>
                            <div class="col-sm-9">
                                <label class="switch">
                                    <input type="checkbox" checked>
                                    <span class="slider round"></span>
                                </label>
                                <div class="form-inline">
                                    <div class="form-group" style="margin-right: 10px; margin-top: 10px" >
                                        <input type="number" maxlength="100" class="form-control text-center" value="4" style="width:70px;">
                                    </div>
                                    <div class="form-group"  style="margin-right: 10px; margin-top: 10px">
                                        <select class="custom-select">
                                            <option value="hour" selected>Hours</option>
                                            <option value="minutes">Minutes</option>
                                        </select>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>


            <div class="card">
                <div class="card-header">
                    <h4 class="card-title" >Questions</h4>
                </div>
                <div class="card-header bg-white">
                    <a href="#" data-toggle="modal" data-target="#editQuiz" class="btn btn-success">Add Question</a>
                </div>
                <div class="nestable" id="nestable">
                    <ul class="list-group list-group-fit nestable-list-plain mb-0">
                        <li class="list-group-item nestable-item">
                            <div class="media">
                                <div class="media-left media-middle">
                                    <a href="#" class="btn btn-default nestable-handle"><i class="material-icons">menu</i></a>
                                </div>
                                <div class="media-body media-middle">
                                    Installation
                                </div>
                                <div class="media-right text-right">
                                    <div style="width:100px">
                                        <a href="#" data-toggle="modal" data-target="#editQuiz" class="btn btn-primary btn-sm"><i class="material-icons">edit</i></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item nestable-item">
                            <div class="media">
                                <div class="media-left media-middle">
                                    <a href="#" class="btn btn-default nestable-handle"><i class="material-icons">menu</i></a>
                                </div>
                                <div class="media-body media-middle">
                                    The MVC architectural pattern
                                </div>
                                <div class="media-right text-right">
                                    <div style="width:100px">
                                        <a href="#" data-toggle="modal" data-target="#editQuiz" class="btn btn-primary btn-sm"><i class="material-icons">edit</i></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item nestable-item">
                            <div class="media">
                                <div class="media-left media-middle">
                                    <a href="#" class="btn btn-default nestable-handle"><i class="material-icons">menu</i></a>
                                </div>
                                <div class="media-body media-middle">
                                    Database Models
                                </div>
                                <div class="media-right text-right">
                                    <div style="width:100px">
                                        <a href="#" data-toggle="modal" data-target="#editQuiz" class="btn btn-primary btn-sm"><i class="material-icons">edit</i></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item nestable-item" data-id="4">
                            <div class="media">
                                <div class="media-left media-middle">
                                    <a href="#" class="btn btn-default nestable-handle"><i class="material-icons">menu</i></a>
                                </div>
                                <div class="media-body media-middle">
                                    Database Access
                                </div>
                                <div class="media-right text-right">
                                    <div style="width:100px">
                                        <a href="#" data-toggle="modal" data-target="#editQuiz" class="btn btn-primary btn-sm"><i class="material-icons">edit</i></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item nestable-item" data-id="5">
                            <div class="media">
                                <div class="media-left media-middle">
                                    <a href="#" class="btn btn-default nestable-handle"><i class="material-icons">menu</i></a>
                                </div>
                                <div class="media-body media-middle">
                                    Eloquent Basics
                                </div>
                                <div class="media-right text-right">
                                    <div style="width:100px">
                                        <a href="#" data-toggle="modal" data-target="#editQuiz" class="btn btn-primary btn-sm"><i class="material-icons">edit</i></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item nestable-item" data-id="6">
                            <div class="media">
                                <div class="media-left media-middle">
                                    <a href="#" class="btn btn-default nestable-handle"><i class="material-icons">menu</i></a>
                                </div>
                                <div class="media-body media-middle">
                                    Take Quiz
                                </div>
                                <div class="media-right text-right">
                                    <div style="width:100px">
                                        <a href="#" data-toggle="modal" data-target="#editQuiz" class="btn btn-primary btn-sm"><i class="material-icons">edit</i></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <!--            <div class="footer">
                            Copyright &copy; 2016 - <a href="http://themeforest.net/item/learnplus-learning-management-application/15287372?ref=mosaicpro">Purchase LearnPlus</a>
                        </div>-->
        </div>

        <div class="mdk-drawer js-mdk-drawer" id="default-drawer">
            <div class="mdk-drawer__content ls-top-navbar-xs-up">
                <div class="sidebar sidebar-left sidebar-light bg-white o-hidden">
                    <div class="sidebar-p-y" data-simplebar data-simplebar-force-enabled="true">
                        <div class="sidebar-heading">APPLICATIONS</div>
                        <ul class="sidebar-menu">
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-student-dashboard.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">account_box</i> Student
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-instructor-dashboard.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i> Instructor
                                </a>
                            </li>
                        </ul>
                        <div class="sidebar-heading">Layout</div>
                        <ul class="sidebar-menu">
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="instructor-quiz-edit.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dashboard</i> Fluid Layout
                                </a>
                            </li>
                            <li class="sidebar-menu-item active">
                                <a class="sidebar-menu-button" href="fixed-instructor-quiz-edit.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dashboard</i> Fixed Layout
                                </a>
                            </li>
                        </ul>
                        <div class="sidebar-heading">Instructor</div>
                        <ul class="sidebar-menu">
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-instructor-courses.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i> Course Manager
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-instructor-quizzes.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">help</i> Quiz Manager
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-instructor-profile.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">language</i> Public Profile
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-instructor-account-edit.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">account_box</i> Account Settings
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-instructor-messages.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">comment</i> Messages
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-instructor-earnings.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">trending_up</i> Earnings
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-instructor-statement.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">receipt</i> Statement
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="guest-login.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">lock_open</i> Logout
                                </a>
                            </li>
                        </ul>
                        <!-- Components menu -->
                        <div class="sidebar-heading">UI Components</div>
                        <ul class="sidebar-menu">
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button sidebar-js-collapse" data-toggle="collapse" href="#ui-components">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">tune</i> 
                                    UI Components
                                    <span class="ml-auto sidebar-menu-toggle-icon"></span>
                                </a>
                                <ul class="sidebar-submenu sm-condensed collapse" id="ui-components">
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-buttons.html">Buttons</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-cards.html">Cards</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-tabs.html">Tabs</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-tree.html">Tree</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-nestable.html">Nestable</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-notifications.html">Notifications</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-progress.html">Progress Bars</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-forms.html">Forms</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-tables.html">Tables</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-charts.html">Charts</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-calendar.html">Calendar</a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="ui-maps-vector.html">Maps Vector</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <!-- // END Components Menu -->
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


        <!-- Vendor JS -->
        <script src="assets/vendor/jquery.nestable.js"></script>
        <script src="assets/vendor/jquery.bootstrap-touchspin.js"></script>



        <!-- Initialize -->
        <script src="assets/js/nestable.js"></script>
        <script src="assets/js/touchspin.js"></script>



        <div class="modal fade" id="editQuiz">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary">
                        <h5 class="modal-title">Add/Edit Question</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="#">
                            <div class="form-group row">
                                <label for="" class="col-form-label col-md-3">Title:</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" value="Database Access">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-form-label col-md-3">Type:</label>
                                <div class="col-md-4">
                                    <select class="custom-control custom-select form-control">

                                        <option value="1">Input</option>
                                        <option value="2">Textarea</option>
                                        <option value="3">Checkbox</option>
                                        <option value="3">Radio</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-form-label col-md-3">Answers:</label>
                                <div class="col-md-9">
                                    <a href="#" class="btn btn-default"> Add Answer</a>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-form-label col-md-3">Question Score:</label>
                                <div class="col-md-4">
                                    <input id="touch-spin-2" data-toggle="touch-spin" data-min="0" data-max="100" data-step="5" type="text" value="50" name="demo2" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-8 offset-md-3">
                                    <button type="submit" class="btn btn-success">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
