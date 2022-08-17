<%--
  Created by IntelliJ IDEA.
  User: dec
  Date: 17/08/2022
  Time: 09:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.manuel.onlinemarketplacev1.utils.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
String email = request.getParameter("email");
String phone = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");

String answer = request.getParameter("answer");
String newPass = request.getParameter("newPassword");

int check = 0;
try {
    Connection dBConn = ConnectionProvider.getConnection();
    Statement st = dBConn.createStatement();
    ResultSet resultSet = st.executeQuery("SELECT  * FROM  users WHERE email ='"+email+"' AND mobileNumber = '"+phone+ "' AND securityQuestion = '"+securityQuestion+"' ");

    while (resultSet.next()){
        check = 1;

        st.executeUpdate("UPDATE  users set password = '"+newPass+"' WHERE email = '"+email+"' ");
        response.sendRedirect("forgotPassword.jsp?msg=updated");
    }
    if (check != 1){
        response.sendRedirect("forgotPassword.jsp?msg=invalid");
    }
} catch (Exception e){
    e.getCause();
    System.out.println(e);
}

%>
</body>
</html>
