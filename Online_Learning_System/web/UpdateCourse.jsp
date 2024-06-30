<%-- 
    Document   : UpdateCourse
    Created on : Jun 22, 2024, 2:54:29 PM
    Author     : tuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
    
    
             Material Design Icons  
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
             Roboto Web Font 
            <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
    
    
    
             Nestable 
            <link rel="stylesheet" href="assets/css/nestable.css">
    
             Customized Bootstrap Stylesheet 
            <link href="css/bootstrap.min.css" rel="stylesheet">
             Template Stylesheet 
            <link href="css/style.css" rel="stylesheet">
    
            <style>
                /*     Basic page styling 
                    body {
                        font-family: 'Roboto', sans-serif;
                        background-color: #f5f5f5;
                        margin: 0;
                        padding: 20px;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        min-height: 100vh;
                    }*/
    
                .card {
                    background: #fff;
                    border-radius: 8px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    
                }
    
                /*    .card-header {
                        background-color: #007bff;
                        color: #fff;
                        padding: 16px;
                        text-align: center;
                    }*/
    
                .card-title {
                    margin: 0;
                    font-size: 1.5em;
                }
    
                .card-body {
                    padding: 16px;
                }
    
                /* Button styling */
                .btn {
                    display: inline-flex;
                    align-items: center;
                    padding: 12px 20px;
                    border: none;
                    border-radius: 4px;
                    text-decoration: none;
                    font-size: 18px;
                    cursor: pointer;
                    font-family: 'Nunito', sans-serif;
                    font-weight: 600;
                    transition: .5s;
    
                }
    
                .btn-primary {
                    background-color: #007bff;
                    color: #fff;
                }
    
                .btn-primary:hover {
                    background-color: #0056b3;
                }
    
                .btn-white {
                    background-color: #fff;
                    color: #2bc5d4;
                    border: 1px solid #2bc5d4;
                }
    
                .btn-delete {
                    background-color: #fff;
                    color: red;
                    border: 1px solid red;
                }
    
    
                .btn-white:hover {
                    background-color: #f0f0f0;
                }
                .btn-delete:hover {
                    background-color: #f0f0f0;
                }
    
                .btn-sm {
                    padding: 6px 10px;
                }
    
                .material-icons {
                    font-size: 16px;
    
                }
    
                /* Media and list styling */
                .nestable {
                    margin-top: 20px;
                }
    
                .nestable-list {
                    list-style: none;
                    padding: 0;
                }
    
                .nestable-item {
                    margin-bottom: 10px;
                    background-color: #f9f9f9;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    align-items: center;
                    padding: 10px;
                    transition: background-color 0.3s ease;
                }
    
                .nestable-item:hover {
                    background-color: #f1f1f1;
                }
    
    
                .nestable-content {
                    flex: 1;
                    display: flex;
                    align-items: center;
                }
    
                .media {
                    display: flex;
                    align-items: center;
                    width: 100%;
                }
    
                .media-left {
                    margin-right: 15px;
                }
    
                .media-left img {
                    border-radius: 4px;
                }
    
                .media-body {
                    flex: 1;
                }
    
                .media-body h5 {
                    margin: 0;
                    font-size: 1.1em;
                    color: #333;
                }
    
                .media-body small {
                    color: #999;
                }
    
                .media-right {
                    display: flex;
                    gap: 10px;
                }
    
                /* Additional general styles */
                a {
                    text-decoration: none;
                    color: inherit;
                }
    
                a:hover {
                    text-decoration: none;
                }
    
                .btn-outline {
                    color: #198754;
                    border: 1px solid #198754; /* Increase border thickness if necessary */
                    background-color: transparent; /* Ensure no background color interferes */
                }
                .btn-outline:hover {
                    color: #fff;
                    background-color: #198754;
                    border-color: #198754;
                }
    
    
                as{
    
                    font-family: 'Nunito', sans-serif;
                    font-weight: 600;
                    transition: .5s;
    
                }
            </style>
    
        </head>
        <body>
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Modules</h4>
                </div>
                <div class="card-body">
    
                                    <div>
                                        <a href="LessonManage?action=addlesson&cid=${cid}" class="btn btn-outline">Add Lesson <i class="material-icons">add</i></a>
                                    </div>
    
                    <div>
                        <a href="course-manage?action=add_module&cid=${cid}" class="btn btn-outline">Add New Module<i class="material-icons">add</i></a>
                    </div>
    
                    <div class="" style="margin-top: 20px;" id="">
                        <ul class="list-group">
    <%int i = 0;%>
    <c:forEach items="${list_module}" var="module">
        <li class="nestable-item" data-id="${module.moduleid}">
            <label class="card-title mb-0">
                <a href="#" class="module-link"><%= ++i%></a>
            </label> &nbsp;&nbsp;&nbsp;
            <label class="card-title h6 mb-0">
                <a href="" onclick="toggleLessons(event, '${module.moduleid}')">${module.modulename}</a>
            </label>
            <ul id="lessons-${module.moduleid}" class="" style="display: none;">
        <%int j = 0;%>
        <c:forEach items="${list_lesson}" var="lesson">
            <c:if test="${module.moduleid == lesson.moduleid}">
                <li class="nestable-item" data-id="${lesson.lessonid}">
                <%= ++j%>  ${lesson.lessonname}
            </li>
            </c:if>
        </c:forEach>
    </ul>
</li>
<div>
    <a href="ModuleManage?action=edit&moduleId=${module.moduleid}" class="btn btn-outline">Edit Module</a>
</div>
    </c:forEach>
</ul>
</div>

</div>
</div>
<script type="text/javascript">
function toggleLessons(event, moduleId) {
event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

var lessonsList = document.getElementById('lessons-' + moduleId);

if (lessonsList.style.display === 'none' || lessonsList.style.display === '') {
lessonsList.style.display = 'block';
} else {
lessonsList.style.display = 'none';
}
}
</script>

jQuery 
<script src="assets/vendor/jquery.min.js"></script>
Vendor JS 
<script src="assets/vendor/jquery.nestable.js"></script> 
Init 
<script src="assets/js/nestable.js"></script>
jQuery 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
Bootstrap JavaScript 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
    
</body>-->

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Course</title>
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
            .btn-outline-success:hover {
                color: #fff;
                background-color: #198754;
                border-color: #198754
            }

            .form-label{
                margin-bottom: 0px;
            }

        </style>
    </head>

    <body>
        <jsp:include page="common/menu.jsp"></jsp:include>


            <div class="container-fluid">
                <div class="container py-5">
                    <div class="row">
                        <div class="col-lg-10">
                            <h6 href="" class="display-6 text-dark animated slideInDown">${my_managed_course.course_name}</h6>
                    </div>

                </div>
            </div>
            <div class="container light-style flex-grow-1 container-p-y">

                <div class=" overflow-hidden">
                    <div class="row no-gutters row-bordered row-border-light">
                        <div class="col-md-3 pt-0">
                            <div class="list-group list-group-flush account-settings-links" id="moduleList">
                                <a class="list-group-item list-group-item-action active" href="#"">Edit Course Information</a>
                                <c:forEach items="${list_module}" var="module">
                                    <a class="list-group-item list-group-item-action" href="ModuleManage?moduleId=${module.moduleid}" data-module-id="${module.moduleid}">${module.modulename}</a>
                                </c:forEach>
                                <a class="list-group-item list-group-item-action" href="mentor-manage">Mentors</a>
                            </div>
                        </div>


                        <div class="col-md-9 card_mine">
                            <div class="tab-content">
                                <div class="tab-pane fade active show" id="Courses">
                                    <h3 style="color: red">${requestScope.error}</h3>

                                    <div>
                                        <div class="form-group">
                                            <label class="form-label">Change Image</label>
                                            <div class="media-body ml-4">
                                                <input type="file" class="" name="image">
                                                <div class="text-black-50 small mt-1">Allowed JPG or PNG. Max size of 800K</div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <h3 style="color: red">${requestScope.error_name}</h3>
                                            <label class="form-label">Course Name</label>
                                            <input name="courseName" type="text" class="form-control" value="${requestScope.my_managed_course.course_name}">
                                        </div>
                                        <div class="form-group">
                                            <h3 style="color: red">${requestScope.error_desciption}</h3>
                                            <label class="form-label">Description</label>
                                            <textarea name="description" rows="7" class="form-control" value="${requestScope.desciption}"></textarea>
                                        </div>
                                        <div class="form-group" style="width: 15%">
                                            <label class="form-label">Price</label>
                                            <input name="price" type="number" min="0" max="999999999" class="form-control" value="${requestScope.my_managed_course.price}">
                                        </div>
                                        <div class="form-group" style="width: 5%">
                                            <label class="form-label">Discount</label>
                                            <input name="discount" type="number" min="0" max="100" class="form-control" value="${requestScope.my_managed_course.discount}"%">
                                        </div>
                                        <div class="form-group">
                                            <h3 style="color: red">${requestScope.error_category}</h3>
                                            <label class="form-label">Category</label>
                                            <select name="category" class="custom-select">
                                                <option value="" selected >Choose one</option>
                                                <c:forEach items="${listCategory}" var="o">
                                                    <option value="${o.category_id}" <c:if test="${requestScope.my_managed_course.course_category_id} == ${o.category_id}}">selected</c:if>>${o.getCategory_name()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                            <br>
                                        <div class="form-group">
                                            <button onclick="submitForm()" class="btn btn-outline-primary">Save Change</button>
                                        </div>
                                    </div>
                                    <!--                                    <div class="tab-pane fade show" id="Courses">
                                                                            <div class="card-body pb-2">
                                    <c:forEach items="${list_managed_couse}" var="c">

                                        <div id="course-${c.course_id}" class="row card-body media align-items-center" style="border: 1px solid #ced4da;">
                                            <div class="col-lg-2">
                                                <img src="${c.image}"
                                                     width="100%" height="auto" alt="image course"/>

                                            </div>
                                            <div class="col-lg-8">
                                                <label class="form-label" style="color: black; font-size: 15px">Mentor: ${c.mentor_name}</label><br>                                                        
                                                <label class="form-label" style="color: #06BBCC; font-size: 25px ">${c.course_name}</label><br>
                                                <label class="form-label" style="color: #000; font-size: 15px ">Category: ${c.course_category_id}</label><br>
                                                <label class="form-label" style="color: #000; font-size: 15px ">Create On: ${c.create_date}</label><br>

                                                <label class="form-label" style="color: #000; font-size: 15px ">Status: </label>
                                        <c:if test="${c.status}">
                                            <label class="form-label" style="color: #00cc66; font-size: 15px ">Active</label><br>
                                        </c:if>
                                        <c:if test="${!c.status}">
                                            <label class="form-label" style="color: #cc0033; font-size: 15px ">Inactive</label><br>
                                        </c:if>
                                        <label class="form-label" style="color: #000; font-size: 15px ">Number of enrollment: ${c.number_enrollment}</label><br>
                                    </div>
                                        <c:if test="${c.status}">

                                            <div class="col-lg-1 delete" style="padding-left: 0px">

                                                <button onclick="deleteCourse('${c.course_id}')" class="btn btn-outline-danger">Delete</button>
                                            </div>
                                        </c:if>
                                        <c:if test="${!c.status}">

                                            <div class="col-lg-1 active" style="padding-left: 0px">
                                                <button onclick="activeCourse('${c.course_id}')" class="btn btn-outline-success">Active</button>
                                            </div>
                                        </c:if>
                                        <div class="col-lg-1" style="padding-left: 0px">

                                            <a href="course-manage?cid=${c.course_id}&action=update" class="btn btn-outline-primary">Update</a>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <br>
                                    <hr class="border-light m-0">
                                </div>
                            </div>-->

                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript">
            </script>
            <script>
                function deleteCourse(courseId) {
                    if (confirm('Are you sure you want to delete this course?')) {
                        fetch('course-manage?action=delete&cid=' + courseId, {
                            method: 'POST'
                        })
                                .then(response => response.json())
                                .then(data => {
                                    if (data.success) {
                                        // Cập nhật UI
                                        var courseElement = document.getElementById('course-' + courseId);
                                        var statusLabel = courseElement.querySelector('label[style="color: #00cc66; font-size: 15px "]');
                                        if (statusLabel) {
                                            statusLabel.style.color = '#cc0033';
                                            statusLabel.textContent = 'Inactive';

                                            alert('Course deleted successfully');
                                            window.location.reload();
                                        }

                                    } else {
                                        alert('An error occurred while deleting the course');
                                    }
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                    alert('An error occurred while deleting the course');
                                });
                    }
                }

                function activeCourse(courseId) {
                    if (confirm('Are you sure you want to active this course?')) {
                        fetch('course-manage?action=activate&cid=' + courseId, {
                            method: 'POST'
                        })
                                .then(response => response.json())
                                .then(data => {
                                    if (data.success) {
                                        // Cập nhật UI
                                        const courseElement = document.getElementById('course-' + courseId);
                                        var statusLabel = courseElement.querySelector('label[style="color: #cc0033; font-size: 15px "]');
                                        const activeButton = document.getElementById('activeBtn-' + courseId);
                                        const deleteButton = document.getElementById('deleteBtn-' + courseId);
                                        if (statusLabel) {
                                            statusLabel.style.color = '#00cc66';
                                            statusLabel.textContent = 'Active';
                                            alert('Course activated successfully');
                                            window.location.reload();
                                        }
                                    } else {
                                        alert('An error occurred while activating the course');
                                    }
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                    alert('An error occurred while activating the course');
                                });
                    }
                }

                document.addEventListener('DOMContentLoaded', function () {
                    var moduleList = document.getElementById('moduleList');
                    var links = moduleList.getElementsByClassName('list-group-item');

                    // Lấy moduleId từ URL (nếu có)
                    var urlParams = new URLSearchParams(window.location.search);
                    var currentModuleId = urlParams.get('moduleId');

                    for (var i = 0; i < links.length; i++) {
                        links[i].addEventListener('click', function (event) {
                            // Loại bỏ class 'active' từ tất cả các thẻ
                            for (var j = 0; j < links.length; j++) {
                                links[j].classList.remove('active');
                            }

                            // Thêm class 'active' vào thẻ được click
                            this.classList.add('active');
                        });

                        // Đặt active cho module hiện tại (nếu có)
                        if (currentModuleId && links[i].getAttribute('data-module-id') === currentModuleId) {
                            links[i].classList.add('active');
                        }
                    }
                });
            </script>

        </div>
        <jsp:include page="common/footer.jsp"></jsp:include>

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

