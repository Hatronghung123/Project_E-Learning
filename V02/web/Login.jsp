

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${acc != null}">
            <h1>Hello ${acc.username}</h1>
        </c:if>
            <form action="login" method="post">
            <h1>
                Email:
                <input type="text" name="email" value="${email}">
                <br>
                Password:
                <input type="password" name="password" value="${password}">
                <br>
                ${error2}
                <br>
                <input type="submit" value="submit">
            </h1>
        </form>
    </body>
</html>
