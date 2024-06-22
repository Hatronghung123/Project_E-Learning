<%-- 
    Document   : courses
    Created on : May 14, 2024, 7:40:05 PM
    Author     : Tuan Anh(Gia Truong)
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            
        </style>

    </head>

    <body>
        <jsp:include page="common/menu.jsp"></jsp:include>


        <div class="app">
           
            <div class="wrapper">
                <div class="conversation-area">
                    <div class="msg online">
                        <img class="msg-profile" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3364143/download+%281%29.png" alt="" />
                        <div class="msg-detail">
                            <div class="msg-username">Madison Jones</div>
                            <div class="msg-content">
                                <span class="msg-message">What time was our meet</span>
                                <span class="msg-date">20m</span>
                            </div>
                        </div>
                    </div>
                    <div class="msg">
                        <img class="msg-profile" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3364143/download+%2812%29.png" alt="" />
                        <div class="msg-detail">
                            <div class="msg-username">Miguel Cohen</div>
                            <div class="msg-content">
                                <span class="msg-message">Adaptogen taiyaki austin jean shorts brunch</span>
                                <span class="msg-date">20m</span>
                            </div>
                        </div>
                    </div>
                    <div class="msg active">
                        <div class="msg-profile group">
                            <svg viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                            <path d="M12 2l10 6.5v7L12 22 2 15.5v-7L12 2zM12 22v-6.5" />
                            <path d="M22 8.5l-10 7-10-7" />
                            <path d="M2 15.5l10-7 10 7M12 2v6.5" /></svg>
                        </div>
                        <div class="msg-detail">
                            <div class="msg-username">CodePen Group</div>
                            <div class="msg-content">
                                <span class="msg-message">Aysenur: I love CSS</span>
                                <span class="msg-date">28m</span>
                            </div>
                        </div>
                    </div>
        
                </div>
                <div class="chat-area">
                    <div class="chat-area-header">
                        <div class="chat-area-title">CodePen Group</div>
                    </div>
                    <div class="chat-area-main">
                        
                        <div class="chat-msg owner">
                            <div class="chat-msg-profile">
                                <img class="chat-msg-img" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3364143/download+%281%29.png" alt="" />
                                <div class="chat-msg-date">Message seen 1.22pm</div>
                            </div>
                            <div class="chat-msg-content">
                                <div class="chat-msg-text">Sit amet risus nullam eget felis eget. Dolor sed viverra ipsum😂😂😂</div>
                                <div class="chat-msg-text">Cras mollis nec arcu malesuada tincidunt.</div>
                            </div>
                        </div>
                        <div class="chat-msg">
                            <div class="chat-msg-profile">
                                <img class="chat-msg-img" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3364143/download+%282%29.png" alt="">
                                <div class="chat-msg-date">Message seen 2.45pm</div>
                            </div>
                            <div class="chat-msg-content">
                                <div class="chat-msg-text">Aenean tristique maximus tortor non tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae😊</div>
                                <div class="chat-msg-text">Ut faucibus pulvinar elementum integer enim neque volutpat.</div>
                            </div>
                        </div>
                        <div class="chat-msg owner">
                            <div class="chat-msg-profile">
                                <img class="chat-msg-img" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3364143/download+%281%29.png" alt="" />
                                <div class="chat-msg-date">Message seen 2.50pm</div>
                            </div>
                            <div class="chat-msg-content">
                                <div class="chat-msg-text">posuere eget augue sodales, aliquet posuere eros.</div>
                                <div class="chat-msg-text">Cras mollis nec arcu malesuada tincidunt.</div>
                            </div>
                        </div>
                        
                        
                        <div class="chat-msg owner">
                            <div class="chat-msg-profile">
                                <img class="chat-msg-img" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3364143/download+%281%29.png" alt="" />
                                <div class="chat-msg-date">Message seen 2.50pm</div>
                            </div>
                            <div class="chat-msg-content">
                                <div class="chat-msg-text">Tincidunt arcu non sodales😂</div>
                            </div>
                        </div>
                        <div class="chat-msg">
                            <div class="chat-msg-profile">
                                <img class="chat-msg-img" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3364143/download+%282%29.png" alt="">
                                <div class="chat-msg-date">Message seen 3.16pm</div>
                            </div>
                            <div class="chat-msg-content">
                                <div class="chat-msg-text">Consectetur adipiscing elit pellentesque habitant morbi tristique senectus et🥰</div>
                            </div>
                        </div>
                    </div>
                    <div class="chat-area-footer">
                        
                       
                       
                        <input type="text" placeholder="Type something here..." />
                        
                        <button type="submit"  class="feather feather-send">
                            SEND</button>>
                    </div>
                </div>

            </div>
        </div>




        <!-- Back to Top -->
<!--        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>-->


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src=js/module-toggle.js></script>
        <script>
            const toggleButton = document.querySelector('.dark-light');
            const colors = document.querySelectorAll('.color');

            colors.forEach(color => {
                color.addEventListener('click', (e) => {
                    colors.forEach(c => c.classList.remove('selected'));
                    const theme = color.getAttribute('data-color');
                    document.body.setAttribute('data-theme', theme);
                    color.classList.add('selected');
                });
            });

            toggleButton.addEventListener('click', () => {
                document.body.classList.toggle('dark-mode');
            });
        </script>

    </body>


</html>
