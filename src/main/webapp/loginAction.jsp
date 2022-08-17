<%@ page import="java.sql.Connection" %>
<%@ page import="com.manuel.onlinemarketplacev1.utils.ConnectionProvider" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: dec
  Date: 16/08/2022
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");

session.setAttribute("email", email);

if ("admin@gmail.com".equals(email) && "admin".equals(password)){
    session.setAttribute("email", email);
    response.sendRedirect("admin/adminHome.jsp");
} else {

    int proceed = 0;
    try{
        Statement statement = ConnectionProvider.getConnection().createStatement();
        ResultSet rs = statement.executeQuery("SELECT  * from users WHERE email ='"+email+"' and password = '"+ password+"'");

        while (rs.next()){
            proceed = 1;
            // sending the session before redirecting
            session.setAttribute("email", email);
            response.sendRedirect("home.jsp");
        }
        if (proceed != 1){
            response.sendRedirect("login.jsp?msg=nonexist");
        }


    } catch (Exception e){
        e.getCause();
        response.sendRedirect("login.jsp?msg=invalid");
    }
}

%>

</body>
</html>
