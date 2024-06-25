<%-- 
    Document   : do_quiz
    Created on : Jun 25, 2024, 2:49:24 PM
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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">




        <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
        <meta name="robots" content="noindex">

        <!-- Simplebar -->
        <link type="text/css" href="${pageContext.request.contextPath}/assets/vendor/simplebar.css" rel="stylesheet">

        <!-- Material Design Icons  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Roboto Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">

        <!-- MDK -->
        <link type="text/css" href="${pageContext.request.contextPath}/assets/vendor/material-design-kit.css" rel="stylesheet">

        <!-- Sidebar Collapse -->
        <link type="text/css" href="${pageContext.request.contextPath}/assets/vendor/sidebar-collapse.min.css" rel="stylesheet">

        <!-- App CSS -->
        <link type="text/css" href="assets/css/style.css" rel="stylesheet">


        <!-- Touchspin -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-touchspin.css">

        <!-- Vendor CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/nestable.css">
        <!-- link css quiz add-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/createQuiz/style.css"/>

        <style>
            .max-width-800 {
                font-family: Arial, sans-serif;
                margin: 20px auto;
                max-width: 800px;
                padding: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .timer {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 0px;
                text-align: center;
                line-height: 1.5;
            }

            .timer span {
                background-color: #ff6600;
                color: white;
                padding: 5px;
                border-radius: 3px;
                margin: 0 2px;
            }

            .question {
                margin-bottom: 30px;
                border: 1px solid #ccc;
                padding: 15px;
                border-radius: 5px;
                background-color: #fff;
            }

            .question h3 {
                margin: 0 0 10px;
            }

            .options {
                list-style-type: none;
                padding: 0;
            }

            .options li {
                margin-bottom: 10px;
            }

            input[type="radio"],
            input[type="checkbox"] {
                display: none;
            }

            input[type="radio"]+label,
            input[type="checkbox"]+label {
                position: relative;
                padding-left: 30px;
                cursor: pointer;
                display: inline-block;
                line-height: 20px;
            }

            input[type="radio"]+label:before,
            input[type="checkbox"]+label:before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                width: 20px;
                height: 20px;
                border: 2px solid #000;
                border-radius: 50%;
                background: #fff;
            }

            input[type="checkbox"]+label:before {
                border-radius: 3px;
            }

            input[type="radio"]:checked+label:before,
            input[type="checkbox"]:checked+label:before {
                background: #000;
                border-color: #000;
            }

            input[type="radio"]+label:hover:before,
            input[type="checkbox"]+label:hover:before {
                border-color: #555;
            }

            footer {
                text-align: center;
                margin-top: 20px;
                padding-top: 10px;
                border-top: 1px solid #ccc;
            }
        </style>
    </head>

    <body>

        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
            <a href="home" class="navbar-brand d-flex align-items-center px-4 px-lg-5" style="text-decoration: none; margin-right: 0px">
                <h2 class="m-0 text-primary">Back</h2>
            </a>
            <div class="col-2">
                <h7 style="margin-bottom: 0px">hello</h7>
            </div>
<!--            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>-->

            <div class="timer col-5" id="timer">
                <span id="hours">00</span>:<span id="minutes">25</span>:<span id="seconds">00</span>
            </div>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
<!--                    <a href="home" class="nav-item nav-link active">Home</a>
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
                    <a href="contact.html" class="nav-item nav-link">Contact</a>-->

                </div>


            </div>
        </nav>
        <!-- Navbar End -->



        <div class="max-width-800">

            <form id="quizForm">
                <div class="question">
                    <h3>1. Which is the first robot to get citizenship in a country?</h3>
                    <ul class="options">
                        <li><input type="checkbox" id="q1a" name="q1" value="A"><label for="q1a">A. Kuri</label></li>
                        <li><input type="checkbox" id="q1b" name="q1" value="B"><label for="q1b">B. Sophia</label></li>
                        <li><input type="checkbox" id="q1c" name="q1" value="C"><label for="q1c">C. Aibo</label></li>
                        <li><input type="checkbox" id="q1d" name="q1" value="D"><label for="q1d">D. Honda E-2 D R</label></li>
                    </ul>
                </div>
                <div class="question">
                    <h3>2. Which country in the world is believed to have the most miles of motorway?</h3>
                    <ul class="options">
                        <li><input type="radio" id="q2a" name="q2" value="A"><label for="q2a">A. Turkey</label></li>
                        <li><input type="radio" id="q2b" name="q2" value="B"><label for="q2b">B. Japan</label></li>
                        <li><input type="radio" id="q2c" name="q2" value="C"><label for="q2c">C. Germany</label></li>
                        <li><input type="radio" id="q2d" name="q2" value="D"><label for="q2d">D. United States</label></li>
                    </ul>
                </div>
                <div class="question">
                    <h3>3. Which country prohibited parents from choosing baby names like Islam, Medina, Jihad and Quran for
                        their children?</h3>
                    <ul class="options">
                        <li><input type="radio" id="q3a" name="q3" value="A"><label for="q3a">A. China</label></li>
                        <li><input type="radio" id="q3b" name="q3" value="B"><label for="q3b">B. New Zealand</label></li>
                    </ul>
                </div>
                
                <a href="#" data-toggle="modal" data-target="#createQuestion" class="btn btn-success" style="border: 5px">Add Question</a>
                    
            </form>
        </div>
        <script>
            let timer = document.getElementById('timer');
            let hoursSpan = document.getElementById('hours');
            let minutesSpan = document.getElementById('minutes');
            let secondsSpan = document.getElementById('seconds');
            let timeLeft = 25 * 60;

            function updateTimer() {
                let hours = Math.floor(timeLeft / 3600);
                let minutes = Math.floor((timeLeft % 3600) / 60);
                let seconds = timeLeft % 60;

                hoursSpan.textContent = hours < 10 ? '0' + hours : hours;
                minutesSpan.textContent = minutes < 10 ? '0' + minutes : minutes;
                secondsSpan.textContent = seconds < 10 ? '0' + seconds : seconds;

                if (timeLeft > 0) {
                    timeLeft--;
                    setTimeout(updateTimer, 1000);
                } else {
                    document.getElementById('quizForm').submit();
                }
            }

            updateTimer();

        </script>
    </body>

</html>