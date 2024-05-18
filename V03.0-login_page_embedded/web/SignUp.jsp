<%-- 
    Document   : SignUp.jsp
    Created on : May 12, 2024, 3:06:54 PM
    Author     : hatro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="signup">
            <h1>
                FullName:
                <input type="text" name="fullname" value="${fullname}">
                <br>
                Password:
                <input type="password" name="password" value="${password}">
                <br>
                Email:
                <input type="text" name="email" value="${email}">
                <br>
                ${error}
                ${error1}
                <br>
                <input type="submit" value="submit">
            </h1>

        </form>
    </body>
</html>
