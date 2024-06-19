<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
    <a href="home" class="navbar-brand d-flex align-items-center px-4 px-lg-5" style="text-decoration: none;">
        <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>OLS</h2>
    </a>

    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>


    <div class="collapse navbar-collapse" id="navbarCollapse">

        <!--        search by category-->
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="
                   border-style: solid;
                   border-width: thin;
                   border-radius: 10px;
                   padding: 10px;
                   margin: 15px;
                   color: #06BBCC;
                   ">Explore</a>
                <div class="dropdown-menu fade-down m-0">
                    <c:forEach items="${listCategory}" var="o">
                    <a href="listCourseSeverlet?cid=${o.getCategory_id()}" class="dropdown-item">${o.getCategory_name()}</a>
                   </c:forEach>
                </div>
            </div>
        </div>

        <!--        search by name-->
        <form action="search" method="post" class="navbar-nav ">
            <input class="search-input" style="width: 300px;" type="text" name="search"  placeholder="Search in course">
            <input style="border-radius: 4px;" class="btn btn-primary" type="submit" value="Search">
        </form>


        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="home" class="nav-item nav-link active">Home</a>
            <a href="about.jsp" class="nav-item nav-link">About</a>
            <a href="listCourseSeverlet?cid=all" class="nav-item nav-link">Courses</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                <div class="dropdown-menu fade-down m-0">
                    <a href="team.html" class="dropdown-item">Our Team</a>
                    <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                    <a href="404.html" class="dropdown-item">404 Page</a>
                </div>
            </div>
            <a href="contact.html" class="nav-item nav-link">Contact</a>

            <!--                
                                                                    <div class="nav-item dropdown">
                                                                        <a href="#"  class="btn btn-primary py-4 px-lg-5 d-none d-lg-block" data-bs-toggle="dropdown">${sessionScope.profile.fullname}<i class="fa fa-arrow-down ms-3"></i></a>                            
                                                                        <div class="dropdown-menu fade-down m-0">
                                                                            <a class="dropdown-item" href="profile">My profile</a>
                                                                            <a class="dropdown-item" href="join?action=logout">Log Out</a>
                                                
                                                                        </div>
                                                                    </div>  -->
        </div>

        <c:if test="${sessionScope.account != null}">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <div class="nav-item dropdown">
                    <a href="#" class="btn btn-primary py-4 px-lg-5 d-lg-block" data-toggle="dropdown">
                        ${sessionScope.profile.fullname}<i class="fa fa-arrow-down ms-3"></i>
                    </a>
                    <div class="dropdown-menu fade-down m-0">
                        <a class="dropdown-item" href="profile">My Profile</a>
                        <a class="dropdown-item" href="my-courses">My Courses</a>
                        <a class="dropdown-item" href="user/abc">Abc</a>
                        <a class="dropdown-item" href="join?action=logout">Log Out</a>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.account == null}">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <div class="nav-item dropdown">
                    <a href="#" class="btn btn-primary py-4 px-lg-5 d-lg-block" data-toggle="dropdown">
                        Login/Register<i class="fa fa-arrow-down ms-3"></i>
                    </a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="join?action=login" class="dropdown-item">Login</a>
                        <a href="join?action=signup" class="dropdown-item">Register</a>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</nav>
<!-- Navbar End -->

