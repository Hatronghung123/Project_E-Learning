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
                display: flex;
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
                <h4 class="card-title">Lessons</h4>
            </div>
            <div class="card-body">

                <div>
                    <a href="LessonManage?action=addlesson&cid=${cid}" class="btn btn-outline">Add Lesson <i class="material-icons">add</i></a>
                </div>

                <div class="nestable" id="nestable-handles-primary">
                    <ul class="nestable-list">
                        <c:forEach items="${lessonList}" var="o">
                            <li class="nestable-item nestable-item-handle" data-id="2">
                                <div class="nestable-handle"><i class="material-icons">menu</i></div>
                                <div class="nestable-content">
                                    <div class="media">
                                        <div class="media-left media-middle">

                                            <iframe  id="videoFrame" class="embed-responsive-item" src="${o.getLessonvideo()}" allowfullscreen="" height="100" width="100"></iframe>
                                        </div>
                                        <div class="media-body media-middle">
                                            <h5 class="card-title h6 mb-0">
                                                <a href="fixed-instructor-lesson-add.html">${o.getLessonname()}</a>
                                            </h5>
                                            <small class="text-muted">${o.getModuleid()}</small>
                                        </div>
                                        <div class="media-right media-middle">
                                            <!--form update-->
                                            <form action="LessonManage" method="GET">
                                                <input type="hidden" value="${o.getLessonid()}" name="lessonid">
                                                <input type="hidden" value="${cid}" name="cid">
                                                <input type="hidden" value="updatelesson" name="action">
                                                <button type="submit" class="btn btn-white btn-sm"><i class="material-icons">edit</i></button> 
                                            </form>
                                            <!--form delete-->

                                            <a class="btn btn-delete btn-sm" data-toggle="modal" data-target="#delete-lessson-modal"
                                               onclick="deleteQuestionModal(${o.getLessonid()}, ${cid})"><i class="material-icons">delete</i></a>

                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>


        <!--Form delete-->
        <div class="modal fade" id="delete-lessson-modal" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary">
                        <h5 class="modal-title" id="delete-modal-label">Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete this lesson ?</p>
                    </div>
                    <div class="modal-footer">
                        <form action="LessonManage?action=deletelesson" method="POST">
                            <div class="form-group" style="display: none">
                                <input type="text" class="form-control" id="idlessonInput" name="lessonid">
                                <input type="text" class="form-control" id="idCourseInput" name="cid">

                            </div>
                            <button type="button" class="as btn-secondary" data-dismiss="modal">No</button>
                            <button type="submit" class="as btn-danger">Yes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function deleteQuestionModal(lessonid, courseId) {
                let inputlessonId = document.querySelector("#idlessonInput");
                let inputICourseId = document.querySelector("#idCourseInput");

                inputlessonId.value = lessonid;
                inputICourseId.value = courseId;
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

