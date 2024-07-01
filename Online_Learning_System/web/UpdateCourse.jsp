<%-- 
    Document   : UpdateCourse
    Created on : Jun 22, 2024, 2:54:29 PM
    Author     : tuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <!-- Material Design Icons  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Roboto Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">



        <!-- Nestable -->
        <link rel="stylesheet" href="assets/css/nestable.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Template Stylesheet -->
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

                <div class=" overflow-hidden">
                    <div class="row no-gutters row-bordered row-border-light">
                        <div class="col-md-3 pt-0">
                            <div class="list-group list-group-flush account-settings-links" id="moduleList">
                                <a class="list-group-item list-group-item-action active" href="#"">Edit Course Information</a>
                                <h5>Modules</h5>
                                <c:forEach items="${list_module}" var="module">
                                    <a class="list-group-item list-group-item-action" href="ModuleManage?moduleId=${module.moduleid}&cid=${my_managed_course.course_id}" data-module-id="${module.moduleid}">${module.modulename}</a>
                                </c:forEach>
                                <h5>Quizzes</h5>
                            </div>
                        </div>


                        <div class="col-md-9 card_mine">
                            <div class="tab-content">
                                <div class="tab-pane fade active show" id="Courses">
                                    <h3 style="color: red">${requestScope.error}</h3>
                                    <form action="course-manage?action=update&cid=${my_managed_course.course_id}" method="post" enctype="multipart/form-data">
                                        <div>
                                            <div class="form-group">
                                                <h3 style="color: red">${requestScope.error_images}</h3>
                                                <img style="width: 200px; height: auto; border-radius: 17px" src="${requestScope.my_managed_course.image}" id="image" alt="course image" class=" iamge d-block">
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
                                                <textarea id="description" name="description" class="form-control auto-resize">${requestScope.my_managed_course.description}</textarea>
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
                                                ${requestScope.my_managed_course.course_category_id}
                                                <h3 style="color: red">${requestScope.error_category}</h3>
                                                <label class="form-label">Category</label>

                                                <select name="category" class="custom-select">
                                                    <option value="" >Choose one</option>
                                                    <c:forEach items="${listCategory}" var="o">
                                                        <option value="${o.category_id}"<c:if test="${not empty requestScope.my_managed_course and requestScope.my_managed_course.course_category_id == o.category_id}">selected</c:if> >${o.getCategory_name()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-outline-primary">Save Change</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>
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
            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript">
            </script>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    function autoResize(textarea) {
                        textarea.style.height = 'auto';
                        textarea.style.height = textarea.scrollHeight + 'px';
                    }

                    var textareas = document.querySelectorAll('.auto-resize');
                    textareas.forEach(function (textarea) {
                        textarea.setAttribute('style', 'height:' + (textarea.scrollHeight) + 'px;overflow-y:hidden;');
                        textarea.addEventListener("input", function () {
                            autoResize(this);
                        }, false);

                        // Resize on page load
                        autoResize(textarea);
                    });
                });
            </script>

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

        <!-- jQuery -->
        <script src="assets/vendor/jquery.min.js"></script>
        <!-- Vendor JS -->
        <script src="assets/vendor/jquery.nestable.js"></script> 
        <!-- Init -->
        <script src="assets/js/nestable.js"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap JavaScript -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>

</html>

