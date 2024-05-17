<%-- 
    Document   : index
    Created on : May 17, 2024, 11:49:48 PM
    Author     : tuong
--%>

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
        <!--         Font Icon 
        -->        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css"><!--
        
                 Main css 
        -->        <link rel="stylesheet" href="css/style_1.css">


    </head>



    <body>

        <!--        
        <c:if test="${true}">
            <script>
                document.getElementById('id01').style.display = 'block';
            </script>
        </c:if>
        -->




        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
            <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
                <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>eLEARNING</h2>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                    <a href="about.html" class="nav-item nav-link">About</a>
                    <a href="courses.html" class="nav-item nav-link">Courses</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu fade-down m-0">
                            <a href="team.html" class="dropdown-item">Our Team</a>
                            <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                            <a href="404.html" class="dropdown-item">404 Page</a>
                        </div>
                    </div>
                    <a href="contact.html" class="nav-item nav-link">Contact</a>
                </div>

                <!--Start Form Sign in-up   -->
                <c:if test="${sessionScope.account == null}">
                    <a onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Sign-in/Sign-up<i class="fa fa-arrow-right ms-3"></i></a>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                    <div class="user-info">
                        <img onclick="toggleMenu()" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYVFRUVFRUYGBgaFRgZGhwaGhgYGBgaGhgaGhgYGBgcIS4lHB4rHxgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHhISHjQkJCE0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQxNDQ0NDQ0NDQ0PzQ/NDQ/PzQxMf/AABEIAOEA4QMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAADBAACBQEGB//EADgQAAEDAgMFBgUEAgIDAQAAAAEAAhEDIQQxQQUSUWFxE4GRobHwBiIywdEUQlLhcvFikrKzwjP/xAAaAQADAQEBAQAAAAAAAAAAAAAAAQIDBAUG/8QAIBEAAwEAAwEBAQEBAQAAAAAAAAECEQMSITFRQSJhBP/aAAwDAQACEQMRAD8ABUCXKae1LvCzNAYKjwugKPFkACUKiipAZteoQ5aGBqFCq0wdFag6CoYYeo2I/MLawxheZ2TUh/Vb9J53xwTkmvprUCZT6Upplq6Uc9vQ1FWxolhQ2uhE395pCojq36Z1FylSiDJVWWJXMTimMaS9waIOZjRG4VhkPs89VtVdpU6dKXvDRAzNz0C+d7V+I3F57OIyk+oWFisU95l7i8xFzpyXNVI6Fxukew2l8Xshu4C4jXIZ5LDxPxLWeI390XyEZ6SsEsJjRMMYAofIzWeJImJrPqEucS48SUA03boM3yTDnOtGX3BhUqMdkM4vwED1us+xqpwUdULAN65Gv4QG4qbJr9K5wjmEL9GGEDO09/uU98HgbDU96SbAap9tUTutyhKlwgAfun8T5I1EhZtDQe82vzyHgtrZVK0lrY/lBJHSSAFj016XY1EbjXAEm8/LI81pC9Jp4hztmfyf4t/Cib3qnL/qfwuLfGZazAeEs8JyoEq8JP4SAKgXHrjUkAMhQqzxdUVAUqJYTKbehkKKQ0aeAfG6V6uk6QCvE0n/ACr1Wz3l1NsZwkiaRtMqmy0qdwCszCNkXWi2oAOULqVLqjloLKDiseyiwue4AR4rz+0viylT3mtl7srfTlqV4Dbm3313AvcIAgNFgFNciSNI46f09JtL40EuFJkiTDneRjgvN4naL6x3qjy68gftE8As3DPkfMmC4RBEaLmrkpnVHFKLVGzmuMptF518tVyREDiiMZIuOay7GvUsGNJkHQ/dWLAO4D0C7RpD9v8ALdI77oT2XbeMz3IKSwYDPfgrtp58vuUCTBI4W62suDEkOAj6g4d4FlLLQdjL9xPnZUNEHePABo5ki581xuJG+2f3AAdJzRG1LuHO3If2l6Hgq6kBJy0HhoFRzIaLRbLW+ibqOFlGQZKpMnAbHEAcc+nVeu2MH7jTpaLE99nDivIV3xnxXqPhXbADBTc+CHGBpErbiXphyvEb81PbKv5UTP6tvFRdWL9Ofv8A8PLPCVeE5VCVqBYv4aCjwhgo1RBSQEqIaKhKgIgvYUZUcpoEcwLSCZXp9kVoELyoq7pTgxpYCWm+ikeaexG0mUwd9wFp5njAXlNu/E76gLGSGa8XR9uSzXVnPMuMn0SdVkE80PkxdSp4V9YF1bic0pWaSQmCwyAV2mwA5T/tZujXqGwjBAM/7RatKATmLLlJkaf60Ra1wW8iob0pIVpXcAnmRn19FnGQZ52T9e7RxkC3gkUkSg9svINy6ejgA0eoRXNBg65cNT+EIMgwI+Z3kL/ZWrusIzMnwhPRgmO3Tunh55jusVzeBJnMNsZzHEc81aN6ROl+JMZ+ZUGGgSegGgHuUic0jx8wHKR0K7VZBLukLpJj5THEjOOX5VW/MCc4yGvDxQPAbq0Fs5x+T+EXc1QGMBMZaTrbgnA0QANPd0N4ISe266yxsYhHfSOaGBbJNVhLknbv/mfNRV3OS6q7Mnovw9fUSrwnHhK1RZbnOhR4QCmaiWeEDRwFCc5LYhz2nkgisVPfDRQx7fVX3SvalVdVSdoOjCvaJuUOSTfuVjSgXXQFFVppMYcY/RR896vhh8xPD2VaozLqs2zXDPc+QZ0XMNOvFGq0pJtmYlcw1rnLLxQTg3TYTf8A4259EGq4ndPcUwx0XGXsJWsw75jKD46IKKuaNUZ7ov7yCCeB09hHqMlk+5y+yGCOUj9PV3nMIld8gDUs9TbyS2AI3QM7k+ZTIYSRHuMgk3gFHs3A1rPmd8oM8ToiYqJgku46CeAVtyCb5Ay48TnA4oZkxoNIvA1J4n8oAEJNuJnvTtJtoG6PVCDG5wTzJ+wVqRM2apbGkCrtyEAk++5EY0xnkLqtaQZkdFSnU52S3wMC6e7obgil+uiC4zJ5pphhSFFWVE9Fh7JyVqppyWqLuOFCtRLvTFTVL1EmNBKLGvBa5JYrZpbJbcI7HwU6ysHBc3JL3UdPHSzGeadbMJbtjMEHwW/iWgX3QlGU54TppbvUJ/po0cw7C8Scp1RjRg8PeaPSp7tlWprBjqpdelqfBHfIeY8PVHpv0QnsIdIPvquubkf9dENkoJiads5480kxwE2mUetWP1DzS4M/Tbh/SpMGWdIJE53HTmuvsAeSjQTBIyHkjBtstdfeSbeBgJ7RoIyKcaz5R4oFNk2WgxkgLOqLmTFwg3XGcgT6laVAZnQBAxDIfOhnyj+09g2W8UqpCU6wHYi5PW/pzKr2QiSCTPEgR0Wt2QImO86JXE12Mkvd3C5KSrSuqQs2kTrHvQLj626IbdZ+I2m9zmtawta4wLwT1IW23C7rL+CqvPoStfhkbjjmZVuzACYe6CgvSTByCLybBQkxGgV2sghDe2+pE5JmbKb6iPujgojQxnrnJeomCUvUXoHAhR+qXqZJh+qXqZIY0BJRKL4KC5RpWbLTwYxABMoLGgxZE3wbLtBtxCwtYjph6XFOBnYJNtcPaZEHWMuvQ960azoFrHnceCQqgt+ZrGgGZj6fDQrJGrA0HTaQepsekKr2OaYK60RBHFaLaQeJyRTwFOmYzOOPsIb6BnQcufJNPwpaZHL/AGiuZeSNElQ+glTp8Z4H8gJvs5Ejv/K6Wa+wr08kVTBI5h6W7Pu3JNNYLaIbHW95LtMrNvTWUgdegXeR805SaALrpdAleS21twucWMdF4ceCqId+E1Ux6bu0do7rHlrXua2A4tEgE5AnIZLyFbbW+8QIBIzuf6S76zhLKdQ7j43gXENJE3KNsrYbqjhP0znx6cl1zEQvTkq7t+G5sWl21UPj5GCG8zqV6DGV4sM/RDYxtNgYwZC8JRzHk9c+PJc1V2o6ZXWcAEyTr6IjGz1V3UC3jKjQgATxeyqAiVDySra7d6DKYmxiyit+pp8/BRAtPSuQHlGel3legeahd6XejPKXeUDAuVA5WeUFzksHoQuTOCqg2Bv6rJxWI3Wk8kf4ZDntLi7M2WPKv8m3C/8ARq4l4y1jRpcfHRDeYbkI1mPIcVzEB++bEjLMeUotOoYiAPAnvXLp2YIug5N8bFMYCpFky7CzeM/eUJf9K5pkBTTTQ5lpjlSiCOaWfTyninWsMIFcEaLJV6bOUxR1OSOMn0srbsCSo85pTE4rTOOC2WsyrEGD0Wk+6zDieCr27uKfRkq0jXx2IG46+hXitmYXfqOa4GDN+9amJIf8pkTkeapgXubY6LSE5Twzt9mbGG2ExsEtaeolOvqhrd1oi2eXglu0LmgTbOyqMOG3hZtt/S1i+Be0BFpnX+lVrRmJn3qqsnUfdFaRGZ6JYPSPIiAZ6oWWUI5PAR91OzJ0QgE6rrJJlKchPoFpVWNB+b5jw/aOvFUc4nkOAsE08BrRf9OeXioi2UVdxdT0j3JZ5R3lLVCu88xAKiXeUd5StRyBgnlZ+LxYZbVTH7QDbC5XncdWc+8wgToaxWKLzA4r1uyqIpsAFrLwOGYd4fNkZPIcV71jpYLrDm+HT/5/uj8yIkTMq1KkOPosxj3cUzTaTrK4mjuRqtqs1M94QcRtCmwS5wHfn0WBtnC1QN9g3iNDcjmBkvKYhtV9nMeTPAz4q44VXrZFctT8R7rFfETKTtx7Hh0xBEGe9OMxrKrC5tiDcGJHgvC0tk1azmue55Ju7fkmeR10W3+hdRcIdALYcP5FVXFC+P0Uc1P6hrEVc4SL3LuIfklXu4JzOE1Wl6joCFSrSYJRTh3uyslKuzXi4MkdytYRjNWhhzPEJx2DGYQdjVS5skQLDwzT1Z4YJMrKqe4azPhRjAEyA05hZ9bFOBaA0unwHVMYek8mXCB3lRSZaaHAxnuFxtIWABz5BdDg3KD0UD3uN4HIBQUX/SgXPhmuOA5qwBObj3H7LrwB/cp6NSjLcJcfl8FZtOc4RsQb5obAn28HhfsmqK28op7Dwde5LPKI9yWc5eseIUqOWZj8UGNJnROYh8Lym1qpe/dBsEAKV60mUqKhJRHthAYbpMB6lDbZzc/YL1mCrFzBkvFBy9DsGsC3d1B8Qs+VajbgrGb1MWV3WyJ7gi4ciIyRSzSQF57fp6SXguzEO0/Kq+qbnXoPYTgpkgC3oo+m0G5BPAQG/wBoVIHOiLMQ+dPJVxTnPc0c7+CfNDj9reCszDfNPfKbpB0Z5/H4chpPOPFH2dgW2m54lbeJwwc0hZ9bZrs7yAqV6S+PGHfSaAYF1g7Mq1Kj3B4j5jAjIBa1Kod35sxY+OavhGNdVaRwJPRVL8YOdej+HwwaIjRFdTaBLhbmjOZkh4gAgiJnPJZb6XiQg+o39jZKIwEt+aI4THopvAWaR3Lk8bobJKsrsH0Ad8orXu1I8FVt8oHgisp8ZPgkNfQjWQJJueAXAP8AkURzSUWlTJClstLRN1Gf9IbsJ1Wu2nAuhOAUdma9UZX6cqLS3AojsxdTPeUtUdCHVxzZgXPAJDG4p2W6R3L2XaR4CXoPHYkC0rG7NpJJOqO2k55tdN4TZDiZcCemSl1+GmSvoh+lYeJ6ItL4f38mkL0zdmuG7uAATeVsGmLW0Ut0Q3+I8MPhpwIF4TVPYQouDi+DwMXXr4WNtPYrap3iSCjfPS0n9D4djS2QUyWg6JPZWHNKWEW0WuKciwXFyLKPU4n2kWYII9+aK6lJyHhdEFOEVjNVgapADR3RayUq1HzDG9/BarxOaXeN3IXTQM7g8OQ0b5ujPphAYYMuknrkivxQR/fA8EMdg2OB0PELB2cx1Cq6XFwcLE6awvQ1XTJWHtYGLZyt4fmGFr8NjtiddFSo8ASZWVg3PgC+SfZTJzSaSBVoPDU+OslMU26IjaUaKzmJNjwGWQmaLZhcYJsc0xTapZUosQmqbRCXZSvKM18WWVG0kqJdxR3lAcFJWlN5Rd3QojA0ytjbJ3GhxEnmnMZTZFwFo1HBogZws52B3nBz3Exou6dp6z5WFfJWorgNnMaN4hN1HNaCYAARIQqrd4EFbJ4d08WI8Ptj4ueXFlEAAEjeNyeizKPxPiWkEvBHCEfb/wAPvpuc9g3mEzAzb3cF56FusaE1nw+m7E2y3EN4O1C1CF8/+DnOFYxMbq9+1yxvxmsrQT0xhySBCE4KYZ8GFz8i1HVw1j9HgUQKjCiNXKdxVwS72ptCcxCZNITDVx9GZTbWQr7iek4Yj8K7QlcZgTmVtFir2YVqjNyIMw8aIracJrcUc1GjzBUmF2yvuLrKPBGhhxjJTLGQrUaaK5Z1Rco41VeoooLAvKG9yM9tks4KkhNld5RclRPBembQ+IaD6haHXGpy7lssqA3C+Mhy9DsT4mfShr5czzC9R8aS8PF48lYj6PKqWpXAbRZVaHMcCPeabLllXh0StAvpgrKxuwKNQy5gnlZbDyhkqVbQ+qEMBsynRENbHqm1dxQ5SdN/R4kdS1blZGe9AqVI6+iQ9HcNXtDs9OJ5pxr5XkX4478g2Gv8v6Wxs/HFwEx71KzuP6dHHy74bO+FAZSxqDirsesWjZUMLoQu0CnapYMK4IcKF6qXo0ZCFQrplRNMlo5uIrGwhhy6XoYJBwuEpftFO0U4UHK4qbypvowWhHFLVUUvVXJpA2LqIkDgomTp8n2lgH0Xlj+48RxSi+mfEWym12f8hdp4L5tiKbmOLXAgjNerNdjx6nqH2fj30XhzD1GhX0LY222VmiDDhmDmvmEq9LEOY4OYSCMiEVHYc3h9ilDcvGbH+K8m1f8At+V6ili2vEtcCOSwcNfTom0xneQnvXHVFRzwBJ7lPUenXOjqs7aGI3WkeP4TNWqACSbn3KwMZW3ieCcyTTK03F2VhxOQHFa2EdYcx5ZgdTme5IsZkDkLuHHg3vK7QxJL50E+epTpeBLw3MNUMweqcZWPis5jiBPEx78kwKi5qk65ofDkQJH9QqvxJyCjqaKsNAPvCsXJSi+Armqk0V2GQ9QvSZrKdqjBdhjtFx1QJU1FQvTwl0NGooHpXtQutqBPBdh7fVd5L9oFcPQ0PQgcrSlHP1VG1YMFLA0dlRB3lxAFnOWDt3YrKwmIeBY/lbe8qPK65pp+HC0mj5RjMI6m8scLjzHEJcr6F8QbKFVlvqF2n7LwmKwj2GHNI56eK6prsc1TgAFP4HFvptL2uIvutGk5kxyHqs9MYixDf4iO83d6x3KsFuHpcJ8RvLmtc0GWglwtAiXE9AtCht2nUBNwGiTOg0k8149p3ac/ued0f4NN/EwO5XrO3Gbgz3vm5uFyOgsPFS4RStnqn7Qa+d1wKXmLxf05pHZNIBgJ180/RguAOpk9Bc+SxqcZonoZ5AYATc/Memg8PVBpAng1vme9drPklxm5y4BAuSNdFDKR6DCvENA0A8xP4RwFk0sRD3RkAfsFrUnB0LKkdM1pIuu6rrmKjzCjCgoqELhfzQjVXA8JdR6Xa+6t2qAXKj3I6i0O6sgPrFBJXWq8E2EDyrNqHVCJUQLRym9E3zZLs5q+8paHowX6Kr8kEPuibyWFad3+aipuriMQaxxDcoot/wCnL/ANbJeZ+Ivpd0UUW/GY2eRbmOo9Vev9bv8AI+qii2MmN1M8N/i3/wBhQsR/9P8A/JRRAL6egw30t/wai4b/APQ/4O9FFFz39NpOvyUofUOo9VxRQiwtLN/Q+oWvgMlFFnXw14/o65Cr5dyiihGwsVFFExEK45RRAFBkuBRRAiNXVFEAMhcdr1+66ogEcpZ++CKVFFL+lFFFFEAf/9k=" alt="anh meo"/>

                    </div>
                    <div class="sub-menu-wrap" id="subMenu">
                        <div class="sub-menu">
                            <div class="user-info">
                                <img src="data:image/jpeg;base64,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" alt="user"/>
                                <h2>${sessionScope.account.fullname}</h2>
                            </div>
                            <hr>

                            <a href="#" class="sub-menu-link">
                                <img src="" alt="profile"/>
                                <p>Abc</p>
                                <span></span>
                            </a>
                            <a href="#" class="sub-menu-link">
                                <img src="" alt="setting"/>
                                <p>Xyz</p>
                                <span></span>
                            </a>
                            <a href="#" class="sub-menu-link">
                                <img src="" alt="help"/>
                                <p>Mnpq</p>
                                <span></span>
                            </a>
                            <a href="login?action=logout" class="sub-menu-link">
                                <img src="" alt="Logout"/>
                                <p>Logout</p>
                                <span></span>
                            </a>
                        </div>
                    </div>
                </c:if>
                <script>
                    let subMenu = document.getElementById('subMenu');
                    function toggleMenu() {
                        subMenu.classList.toggle("open-menu");
                    }
                </script>
                <!-- Sign up form -->
                <div id="id02" class="modal-1">

                    <div class="modal-content-1 animate">
                        <!--                <div class="imgcontainer">
                                            <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                        
                                        </div>-->
                        <div class="signup-1">
                            <div class="container-1">
                                <span onclick="document.getElementById('id02').style.display = 'none'" class="close" title="Close Modal">&times;</span>

                                <div class="signup-content-1">


                                    <div class="signup-form-1">
                                        <h5 style="color: red">
                                            ${error}
                                            ${error1}
                                        </h5>
                                        <h2 class="form-title-1">Sign up</h2>

                                        <form method="post" action="signup" class="register-form-1" id="register-form">

                                            <div class="form-group-1">
                                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                                <input type="text" name="fullname" id="name" placeholder="Your Name"/>
                                            </div>
                                            <div class="form-group-1">
                                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                                            </div>
                                            <div class="form-group-1">
                                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                                <input type="password" name="password" id="pass" placeholder="Password"/>
                                            </div>
                                            <div class="form-group-1">
                                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                                            </div>
                                            <div class="form-group-1">
                                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term-1" />
                                                <label for="agree-term" class="label-agree-term-1"><span><span></span></span>I agree all statements in  <a href="#" class="term-service-1">Terms of service</a></label>
                                            </div>
                                            <div class="form-group-1 form-button-1">
                                                <input type="submit" name="signup" id="signup" class="form-submit-1" value="Register"/>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="signup-image">
                                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                                        <a href="#" class="signup-image-link">I am already member</a>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>


                <!--Sign in Form-->
                <div id="id01" class="modal-1">
                    <div class="modal-content-1 animate">
                        <!-- Sing in  Form -->
                        <div class="signin">
                            <div class="container-1">
                                <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                                <div class="signin-content">
                                    <div class="signin-image-1">
                                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                                        <a href="#" class="signup-image-link" id="createAcc">Create an account</a>
                                    </div>

                                    <div class="signin-form">
                                        <h5 style="color: red">${error2}</h5>
                                        <h2 class="form-title">Login</h2>
                                        <form action="login" method="post" class="register-form" id="login-form">
                                            <div class="form-group-1">
                                                <label for="your_email"><i class="zmdi zmdi-email"></i></label>
                                                <input value="${email}" type="text" name="email" id="your_email" placeholder="Your Email"/>
                                            </div>
                                            <div class="form-group-1">
                                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                                <input value="${password}" type="password" name="password" id="your_pass" placeholder="Password"/>
                                            </div>
                                            <div class="form-group-1">
                                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term-1" />
                                                <label for="remember-me" class="label-agree-term-1"><span><span></span></span>Remember me</label>
                                            </div>

                                            <div class="form-group-1 form-button-1">
                                                <input type="submit" name="signin" id="signin" class="form-submit-1" value="Log in"/><br><br>
                                                <a href="#" class="forgot-pass" >Forgot your password?</a>
                                            </div>
                                        </form>
                                        <div class="social-login-1">
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
                        </div>
                    </div>
                </div>
                <script>
                    // Get the modal
                    var modal = document.getElementById('id01');

                    // close it
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }



                    // Lấy "Create an account"
                    var createAccLink = document.getElementById('createAcc');

                    // Lấy liên kết "I am already member"
                    var alreadyMemberLink = document.querySelector('.signup-image-link');

                    // Lấy id form login và sign up
                    var loginForm = document.getElementById('id01');
                    var signupForm = document.getElementById('id02');

                    // Xử lý click liên kết "Create an account"
                    createAccLink.addEventListener('click', function (event) {
                        event.preventDefault(); // Ngăn chặn hành vi mặc định của <a>
                        loginForm.style.display = 'none'; // Ẩn form login
                        signupForm.style.display = 'block'; // Hiện form sign up
                        //signupForm.classList.add('animate'); // Thêm animate cho form
                    });

                    // Xử lý click liên kết "I am already member"
                    alreadyMemberLink.addEventListener('click', function (event) {
                        event.preventDefault(); // Ngăn chặn hành vi mặc định của <a>
                        signupForm.style.display = 'none'; // Ẩn form sign up
                        loginForm.style.display = 'block'; // Hiện form login
                        //loginForm.classList.add('animate'); // Thêm animate cho form
                    });

                    window.addEventListener('load', function () {
                        var urlParams = new URLSearchParams(window.location.search);
                        var openModal = urlParams.get('openModal');

                        if (openModal === 'true') {
                            document.getElementById('id01').style.display = 'block';
                        }
                    });
                    
                    
                    window.addEventListener('load', function () {
                        var urlParams = new URLSearchParams(window.location.search);
                        var openModal = urlParams.get('openModal_signup');

                        if (openModal === 'true') {
                            document.getElementById('id02').style.display = 'block';
                        }
                    });
                </script>
                <!--end login-->


            </div>
        </nav>
        <!-- Navbar End -->


        <!-- Carousel Start -->
        <div class="container-fluid p-0 mb-5">
            <div class="owl-carousel header-carousel position-relative">
                <div class="owl-carousel-item position-relative">
                    <img class="img-fluid" src="img/carousel-1.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-sm-10 col-lg-8">
                                    <h5 class="text-primary text-uppercase mb-3 animated slideInDown">Best Online Courses</h5>
                                    <h1 class="display-3 text-white animated slideInDown">The Best Online Learning Platform</h1>
                                    <p class="fs-5 text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea sanctus eirmod elitr.</p>
                                    <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read More</a>
                                    <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="owl-carousel-item position-relative">
                    <img class="img-fluid" src="img/carousel-2.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-sm-10 col-lg-8">
                                    <h5 class="text-primary text-uppercase mb-3 animated slideInDown">Best Online Courses</h5>
                                    <h1 class="display-3 text-white animated slideInDown">Get Educated Online From Your Home</h1>
                                    <p class="fs-5 text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea sanctus eirmod elitr.</p>
                                    <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read More</a>
                                    <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- Service Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item text-center pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-graduation-cap text-primary mb-4"></i>
                                <h5 class="mb-3">Skilled Instructors</h5>
                                <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="service-item text-center pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-globe text-primary mb-4"></i>
                                <h5 class="mb-3">Online Classes</h5>
                                <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="service-item text-center pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-home text-primary mb-4"></i>
                                <h5 class="mb-3">Home Projects</h5>
                                <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="service-item text-center pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-book-open text-primary mb-4"></i>
                                <h5 class="mb-3">Book Library</h5>
                                <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="min-height: 400px;">
                        <div class="position-relative h-100">
                            <img class="img-fluid position-absolute w-100 h-100" src="img/about.jpg" alt="" style="object-fit: cover;">
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                        <h6 class="section-title bg-white text-start text-primary pe-3">About Us</h6>
                        <h1 class="mb-4">Welcome to eLEARNING</h1>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                        <div class="row gy-2 gx-4 mb-4">
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Skilled Instructors</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Online Classes</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>International Certificate</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Skilled Instructors</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Online Classes</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>International Certificate</p>
                            </div>
                        </div>
                        <a class="btn btn-primary py-3 px-5 mt-2" href="">Read More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Categories Start -->
        <div class="container-xxl py-5 category">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Categories</h6>
                    <h1 class="mb-5">Courses Categories</h1>
                </div>
                <div class="row g-3">
                    <div class="col-lg-7 col-md-6">
                        <div class="row g-3">
                            <div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
                                <a class="position-relative d-block overflow-hidden" href="">
                                    <img class="img-fluid" src="img/cat-1.jpg" alt="">
                                    <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                        <h5 class="m-0">Web Design</h5>
                                        <small class="text-primary">49 Courses</small>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.3s">
                                <a class="position-relative d-block overflow-hidden" href="">
                                    <img class="img-fluid" src="img/cat-2.jpg" alt="">
                                    <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                        <h5 class="m-0">Graphic Design</h5>
                                        <small class="text-primary">49 Courses</small>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.5s">
                                <a class="position-relative d-block overflow-hidden" href="">
                                    <img class="img-fluid" src="img/cat-3.jpg" alt="">
                                    <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                        <h5 class="m-0">Video Editing</h5>
                                        <small class="text-primary">49 Courses</small>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6 wow zoomIn" data-wow-delay="0.7s" style="min-height: 350px;">
                        <a class="position-relative d-block h-100 overflow-hidden" href="">
                            <img class="img-fluid position-absolute w-100 h-100" src="img/cat-4.jpg" alt="" style="object-fit: cover;">
                            <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin:  1px;">
                                <h5 class="m-0">Online Marketing</h5>
                                <small class="text-primary">49 Courses</small>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Categories Start -->


        <!-- Courses Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Courses</h6>
                    <h1 class="mb-5">Popular Courses</h1>
                </div>
                <div class="row g-4 justify-content-center">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="course-item bg-light">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid" src="img/course-1.jpg" alt="">
                                <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                    <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                    <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                </div>
                            </div>
                            <div class="text-center p-4 pb-0">
                                <h3 class="mb-0">$149.00</h3>
                                <div class="mb-3">
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small>(123)</small>
                                </div>
                                <h5 class="mb-4">Web Design & Development Course for Beginners</h5>
                            </div>
                            <div class="d-flex border-top">
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>John Doe</small>
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i>1.49 Hrs</small>
                                <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i>30 Students</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="course-item bg-light">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid" src="img/course-2.jpg" alt="">
                                <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                    <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                    <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                </div>
                            </div>
                            <div class="text-center p-4 pb-0">
                                <h3 class="mb-0">$149.00</h3>
                                <div class="mb-3">
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small>(123)</small>
                                </div>
                                <h5 class="mb-4">Web Design & Development Course for Beginners</h5>
                            </div>
                            <div class="d-flex border-top">
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>John Doe</small>
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i>1.49 Hrs</small>
                                <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i>30 Students</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="course-item bg-light">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid" src="img/course-3.jpg" alt="">
                                <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                    <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                    <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                </div>
                            </div>
                            <div class="text-center p-4 pb-0">
                                <h3 class="mb-0">$149.00</h3>
                                <div class="mb-3">
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small>(123)</small>
                                </div>
                                <h5 class="mb-4">Web Design & Development Course for Beginners</h5>
                            </div>
                            <div class="d-flex border-top">
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>John Doe</small>
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i>1.49 Hrs</small>
                                <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i>30 Students</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Courses End -->


        <!-- Team Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Instructors</h6>
                    <h1 class="mb-5">Expert Instructors</h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item bg-light">
                            <div class="overflow-hidden">
                                <img class="img-fluid" src="img/team-1.jpg" alt="">
                            </div>
                            <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4">
                                <h5 class="mb-0">Instructor Name</h5>
                                <small>Designation</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="team-item bg-light">
                            <div class="overflow-hidden">
                                <img class="img-fluid" src="img/team-2.jpg" alt="">
                            </div>
                            <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4">
                                <h5 class="mb-0">Instructor Name</h5>
                                <small>Designation</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="team-item bg-light">
                            <div class="overflow-hidden">
                                <img class="img-fluid" src="img/team-3.jpg" alt="">
                            </div>
                            <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4">
                                <h5 class="mb-0">Instructor Name</h5>
                                <small>Designation</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="team-item bg-light">
                            <div class="overflow-hidden">
                                <img class="img-fluid" src="img/team-4.jpg" alt="">
                            </div>
                            <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4">
                                <h5 class="mb-0">Instructor Name</h5>
                                <small>Designation</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->


        <!-- Testimonial Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
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
        </div>
        <!-- Testimonial End -->


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
