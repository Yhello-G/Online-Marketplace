<%@page import="com.manuel.onlinemarketplacev1.utils.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
    try {
    Connection connection = ConnectionProvider.getConnection();

    Statement st = connection.createStatement();

    String createUserTable = "create table users(name varchar(100), email varchar(100)primary key, mobileNumber bigint, securityQuestion varchar(200), answer varchar(200), password varchar(200), address varchar(200), city varchar(100), state varchar(100), country varchar(100))";
    String createProductTable = "create table products (id int, name varchar(50), category varchar(100), price int, active varchar(16))";

     st.execute(createProductTable);

        System.out.print("Table created");
        connection.close();
    } catch ( Exception e){
        System.out.println("Exception thrown while trying to create table users");
        e.getCause();
    }
%>