

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login Form</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts_login/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css_login/style.css">
    </head>
    <body>
       
<!--        <form action="login" method="post">
            <h1>
                Email:
                <input type="text" name="email" value="${email}">
                <br>
                Password:
                <input type="password" name="password" value="${password}">
                <br>
                ${error2}
                <br>
                <input type="submit" value="submit">
            </h1>
        </form>-->







        <div class="main">
            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="images_login/signin-image.jpg" alt="sing up image"></figure>
                            <a href="signup" class="signup-image-link">Create an account</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Login</h2>
                            <h4 style="color: red">${error2}</h4>
                            <form action="login" method="post" id="login-form">
                                <div class="form-group">
                                    <label for="your_email"><i class="zmdi zmdi-email"></i></label>
                                    <input value="${email}" type="text" name="email" id="your_email" placeholder="Email"/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input value="${password}" type="password" name="password" id="your_pass" placeholder="Password"/>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                    <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                    <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/Project_E-LearningV2/google&response_type=code&client_id=83884111115-sdp6j9md5ok9ajc3hrvf90mbiub9v60k.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="vendor_login/jquery/jquery.min.js"></script>
        <script src="js_login/main.js"></script>
    </body>
</html>
