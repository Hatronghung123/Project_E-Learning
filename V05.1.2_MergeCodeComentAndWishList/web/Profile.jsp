<%-- 
    Document   : Profile
    Created on : May 31, 2024, 1:33:50 AM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
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
            .account-settings-fileinput {
                position: absolute;
                visibility: hidden;
                width: 1px;
                height: 1px;
                opacity: 0;
            }
            .ui-w-80 {
                width: 80px !important;
                height: auto;
                border-radius: 17px;
            }
            .media{
                display: flex
            }
            .ml-4{
                margin-left: 10px !important;
            }
            .list-group-flush>.list-group-item{
                margin-bottom: 10px;
                border-width:0 0 0px
            }
            .card_mine{
                position:relative;
                display:flex;
                flex-direction:column;
                min-width:0;
                word-wrap:break-word;
                background-color:#fff;
                background-clip:border-box;
                border-left:1px solid rgba(0,0,0,0.125)
            }
            .custom-select{
                display: inline-block;
                width: 100%;
                height: calc(1.5em + .75rem + 2px);
                padding: .375rem 1.75rem .375rem .75rem;
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #495057;
                vertical-align: middle;
                background: #fff url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='4' height='5' viewBox='0 0 4 5'%3e%3cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3e%3c/svg%3e") no-repeat right .75rem center/8px 10px;
                border: 1px solid #ced4da;
                border-radius: .25rem;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
            }
            .text-right{
                text-align: right!important;
            }
            input.form-control{
                padding: 12px
            }
            .btn-outline-danger:hover {
                color: #fff;
                background-color: #dc3545;
                border-color: #dc3545
            }
            .btn-outline-primary:hover {
                color: #000;
                background-color: #06BBCC;
                border-color: #06BBCC
            }


        </style>
    </head>
    <body>
        <jsp:include page="common/menu.jsp"></jsp:include>

            <div class="container-fluid">
                <div class="container py-5">
                    <div class="row">
                        <div class="col-lg-10">
                            <h1 class="display-3 text-dark animated slideInDown">My Profile</h1>
                        </div>
                    </div>
                </div>
                <form action="profile" method="post" enctype="multipart/form-data">
                    <div class="container light-style flex-grow-1 container-p-y">

                        <div class=" overflow-hidden">
                            <div class="row no-gutters row-bordered row-border-light">
                                <div class="col-md-3 pt-0">
                                    <div class="list-group list-group-flush account-settings-links">
                                        <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account-general">General</a>
                                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-change-password">Change password</a>
                                        <!-- <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-info">Information</a>-->
                                        <!--                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-social-links">Social links</a>
                                                                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-connections">Connections</a>-->
                                        <!--                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-notifications">Notifications</a>-->
                                    </div>
                                </div>
                                <div class="col-md-9 card_mine">
                                    <div class="tab-content">
                                        <div class="tab-pane fade active show" id="account-general">
                                            <h3 style="color: red">${requestScope.error}</h3>
                                        <div class="card-body media align-items-center">
                                            <img src="${sessionScope.profile.avt}" alt="avatar" class="d-block ui-w-80">
                                            <div class="media-body ml-4">
                                                <input type="file" class="" name="avt">
                                                <div class="text-black-50 small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                                            </div>
                                        </div>
                                        <hr class="border-light m-0">
                                        <div class="card-body">

                                            <div class="form-group">
                                                <label class="form-label">Name</label>
                                                <input name="fullname" type="text" class="form-control" value="${sessionScope.profile.fullname}">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">E-mail</label>
                                                <input readonly="" name="email" type="text" class="form-control mb-1" value="${sessionScope.account.email}">
                                                <div class="alert alert-warning mt-3">
                                                    Your email is not confirmed. Please check your inbox.<br>
                                                    <a href="javascript:void(0)">Resend confirmation</a>
                                                </div>
                                            </div>
                                            <!--                                        <div class="form-group">
                                                                                        <label class="form-label">Company</label>
                                                                                        <input type="text" class="form-control" value="Company Ltd.">
                                                                                    </div>-->
                                            <div class="form-group">
                                                <label class="form-label">Gender</label>
                                                <select name="gender" class="custom-select">
                                                    <option <c:if test="${sessionScope.profile.gender == null}">selected</c:if>>Choose</option>
                                                    <option <c:if test="${sessionScope.profile.gender}">selected</c:if> value="male">Male</option>
                                                    <option <c:if test="${!sessionScope.profile.gender}">selected</c:if> value="female">Female</option>
                                                </select>
                                            </div>
                                        </div>

                                        <!--                                    <div class="card-body pb-2">
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Bio</label>
                                                                                    <textarea class="form-control" rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Birthday</label>
                                                                                    <input type="text" class="form-control" value="May 3, 1995">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Country</label>
                                                                                    <select class="custom-select">
                                                                                        <option>USA</option>
                                                                                        <option selected>Canada</option>
                                                                                        <option>UK</option>
                                                                                        <option>Germany</option>
                                                                                        <option>France</option>
                                                                                    </select>
                                                                                </div>
                                        
                                                                            </div>-->
                                        <br>
                                        <!--                                    <hr class="border-light m-0">
                                                                            <div class="card-body pb-2">
                                                                                <h6 class="mb-4">Contacts</h6>
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Phone</label>
                                                                                    <input type="text" class="form-control" value="+0 (123) 456 7891">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Website</label>
                                                                                    <input type="text" class="form-control" value>
                                                                                </div>
                                                                            </div>-->
                                    </div>


                                    <div class="tab-pane fade" id="account-change-password">
                                        <div class="card-body pb-2">
                                            <div class="form-group">
                                                <label class="form-label">Current password</label>
                                                <input name="old_password" type="password" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">New password</label>
                                                <input name="new_password" type="password" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Repeat new password</label>
                                                <input name="re_new_password" type="password" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <!--                                <div class="tab-pane fade" id="account-social-links">
                                                                        <div class="card-body pb-2">
                                                                            <div class="form-group">
                                                                                <label class="form-label">Twitter</label>
                                                                                <input type="text" class="form-control" value="https://twitter.com/user">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="form-label">Facebook</label>
                                                                                <input type="text" class="form-control" value="https://www.facebook.com/user">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="form-label">Google+</label>
                                                                                <input type="text" class="form-control" value>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="form-label">LinkedIn</label>
                                                                                <input type="text" class="form-control" value>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="form-label">Instagram</label>
                                                                                <input type="text" class="form-control" value="https://www.instagram.com/user">
                                                                            </div>
                                                                        </div>
                                                                    </div>-->


                                    <!--                                <div class="tab-pane fade" id="account-connections">
                                                                        <div class="card-body">
                                                                            <button type="button" class="btn btn-twitter">Connect to <strong>Twitter</strong></button>
                                                                        </div>
                                                                        <hr class="border-light m-0">
                                                                        <div class="card-body">
                                                                            <h5 class="mb-2">
                                                                                <a href="javascript:void(0)" class="float-right text-muted text-tiny"><i class="ion ion-md-close"></i> Remove</a>
                                                                                <i class="ion ion-logo-google text-google"></i>
                                                                                You are connected to Google:
                                                                            </h5>
                                                                            <a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6b05060a131c0e07072b060a020745080406">[email&#160;protected]</a>
                                                                        </div>
                                                                        <hr class="border-light m-0">
                                                                        <div class="card-body">
                                                                            <button type="button" class="btn btn-facebook">Connect to <strong>Facebook</strong></button>
                                                                        </div>
                                                                        <hr class="border-light m-0">
                                                                        <div class="card-body">
                                                                            <button type="button" class="btn btn-instagram">Connect to <strong>Instagram</strong></button>
                                                                        </div>
                                                                    </div>-->


                                    <!--                                <div class="tab-pane fade" id="account-notifications">
                                                                        <div class="card-body pb-2">
                                                                            <h6 class="mb-4">Activity</h6>
                                                                            <div class="form-group">
                                                                                <label class="switcher">
                                                                                    <input type="checkbox" class="switcher-input" checked>
                                                                                    <span class="switcher-indicator">
                                                                                        <span class="switcher-yes"></span>
                                                                                        <span class="switcher-no"></span>
                                                                                    </span>
                                                                                    <span class="switcher-label">Email me when someone comments on my article</span>
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="switcher">
                                                                                    <input type="checkbox" class="switcher-input" checked>
                                                                                    <span class="switcher-indicator">
                                                                                        <span class="switcher-yes"></span>
                                                                                        <span class="switcher-no"></span>
                                                                                    </span>
                                                                                    <span class="switcher-label">Email me when someone answers on my forum thread</span>
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="switcher">
                                                                                    <input type="checkbox" class="switcher-input">
                                                                                    <span class="switcher-indicator">
                                                                                        <span class="switcher-yes"></span>
                                                                                        <span class="switcher-no"></span>
                                                                                    </span>
                                                                                    <span class="switcher-label">Email me when someone follows me</span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <hr class="border-light m-0">
                                                                        <div class="card-body pb-2">
                                                                            <h6 class="mb-4">Application</h6>
                                                                            <div class="form-group">
                                                                                <label class="switcher">
                                                                                    <input type="checkbox" class="switcher-input" checked>
                                                                                    <span class="switcher-indicator">
                                                                                        <span class="switcher-yes"></span>
                                                                                        <span class="switcher-no"></span>
                                                                                    </span>
                                                                                    <span class="switcher-label">News and announcements</span>
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="switcher">
                                                                                    <input type="checkbox" class="switcher-input">
                                                                                    <span class="switcher-indicator">
                                                                                        <span class="switcher-yes"></span>
                                                                                        <span class="switcher-no"></span>
                                                                                    </span>
                                                                                    <span class="switcher-label">Weekly product updates</span>
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="switcher">
                                                                                    <input type="checkbox" class="switcher-input" checked>
                                                                                    <span class="switcher-indicator">
                                                                                        <span class="switcher-yes"></span>
                                                                                        <span class="switcher-no"></span>
                                                                                    </span>
                                                                                    <span class="switcher-label">Weekly blog digest</span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>-->


                                    <div class="tab-pane fade" id="account-courses">
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
                    <div class="text-right mt-3">
                        <button type="reset" class="btn btn-outline-danger md-btn-flat">Reset</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>&nbsp;
                        <!--                    <button type="button" class="btn btn-secondary">Cancel</button>-->
                    </div>
                </div>
            </form>
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
