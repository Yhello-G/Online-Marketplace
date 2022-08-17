<%--
  Created by IntelliJ IDEA.
  User: dec
  Date: 15/08/2022
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.manuel.onlinemarketplacev1.utils.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@ page import="java.math.BigInteger" %>


<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobie = request.getParameter("mobileNumber");
    String securityQ = request.getParameter("securityQuestion");
    String answer = request.getParameter("answer");
    String password = request.getParameter("password");
    String address = "";
    String city = "";
    String state = "";
    String country = "";

    String msg = "";
    String VALID = "valid";
    String INVALID = "invalid";
    String SIGNUP_PAGE = "signup.jsp?";


    try {
        Connection con = ConnectionProvider.getConnection();
        PreparedStatement  pStatement = con.prepareStatement("INSERT INTO users values(?,?,?,?,?,?,?,?,?,?)");
        pStatement.setString(1, name);
        pStatement.setString(2, email);
        pStatement.setString(3, mobie);
        pStatement.setString(4, securityQ);
        pStatement.setString(5, answer);
        pStatement.setString(6, password);
        pStatement.setString(7, address);
        pStatement.setString(8, city);
        pStatement.setString(9, state);
        pStatement.setString(10, country);

        pStatement.executeUpdate();

        response.sendRedirect("signup.jsp?msg=valid");
    } catch (Exception e){

        System.out.println(e);
        response.sendRedirect("signup.jsp?msg=invalid");
    }


%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
