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

                <!--                <div>
                                    <a href="LessonManage?action=addlesson&cid=${cid}" class="btn btn-outline">Add Lesson <i class="material-icons">add</i></a>
                                </div>-->

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
                                <a href="ModuleManager?action=edit&moduleId=${module.moduleid}" class="btn btn-outline">Edit Module</a>
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

