<%-- 
    Document   : StarRating
    Created on : Jun 20, 2024, 10:26:25 PM
    Author     : Tuan Anh(Gia Truong)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Star Rating</title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">




        <style>
            body{

                background-color: #f7f6f6;
            }

            .card{

                width: 350px;
                border: none;
                box-shadow: 5px 6px 6px 2px #e9ecef;
                border-radius: 12px;
            }

            .circle-image img{

                border: 6px solid #fff;
                border-radius: 100%;
                padding: 0px;
                top: -28px;
                position: relative;
                width: 70px;
                height: 70px;
                border-radius: 100%;
                z-index: 1;
                background: #e7d184;
                cursor: pointer;

            }


            .dot {
                height: 18px;
                width: 18px;
                background-color: blue;
                border-radius: 50%;
                display: inline-block;
                position: relative;
                border: 3px solid #fff;
                top: -48px;
                left: 186px;
                z-index: 1000;
            }

            .name{
                margin-top: -21px;
                font-size: 18px;
            }


            .fw-500{
                font-weight: 500 !important;
            }


            .start{

                color: green;
            }

            .stop{
                color: red;
            }


            .rate{

                border-bottom-right-radius: 12px;
                border-bottom-left-radius: 12px;

            }



            .rating {
                display: flex;
                flex-direction: row-reverse;
                justify-content: center
            }

            .rating>input {
                display: none
            }

            .rating>label {
                position: relative;
                width: 1em;
                font-size: 30px;
                font-weight: 300;
                color: #FFD600;
                cursor: pointer
            }

            .rating>label::before {
                content: "\2605";
                position: absolute;
                opacity: 0
            }

            .rating>label:hover:before,
            .rating>label:hover~label:before {
                opacity: 1 !important
            }

            .rating>input:checked~label:before {
                opacity: 1
            }

            .rating:hover>input:checked~label:before {
                opacity: 0.4
            }


            .buttons{
                top: 36px;
                position: relative;
            }


            .rating-submit{
                border-radius: 15px;
                color: #fff;
                height: 49px;
            }


            .rating-submit:hover{

                color: #fff;
            }
        </style>

    </head>
    <body>
        <div class="container d-flex justify-content-center mt-5">

            <div class="card text-center mb-5">

                <div class="circle-image">
                    <img src="${sessionScope.profile.getAvt()}" width="50">
                </div>

                <!--                <span class="dot"></span>-->

                <span class="name mb-1 fw-500">${sessionScope.profile.getFullname()}</span>



                <form action="StarRating" method="POST">

                    <div class="location mt-4">


                        <span class="d-block"><i class="fa fa-book start"></i> <small class="text-truncate ml-2">Course: ${course.getCourse_name()}</small> </span>



                    </div>

                    <input type="text" name="comment" value="4" >
                    <input type="hidden" name="cid" value="${cid}" >
                    <input type="hidden" name="accid" value="${sessionScope.account.getAccount_id()}" >





                    <div class="rate py-3 text-white mt-3" style="background-color: #2bc5d4">

                        <h6 class="mb-0">Rate your course</h6>

                        <div class="rating"> <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> 
                            <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> 
                            <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> 
                            <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> 
                            <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                        </div>


                        <div class="buttons px-4 mt-0">

                            <button class="btn btn-warning btn-block rating-submit">Submit</button>

                        </div>


                    </div>
                </form>


            </div>



        </div>
    </body>
</html>
