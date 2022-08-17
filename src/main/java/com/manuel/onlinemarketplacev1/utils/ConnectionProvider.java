package com.manuel.onlinemarketplacev1.utils;
import  java.sql.*;

public class ConnectionProvider {

    public static Connection getConnection(){
    Connection dbConnection = null;
        try {
            //Class.forName("com.mysql.cj.jdbc.Driver");

           Class.forName("com.mysql.cj.jdbc.Driver");
           dbConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinemarket", "root", "12345");

        } catch (Exception ex){
            System.out.println("Couldn't establish connection");
            ex.getCause();
            System.out.println(  ex.getMessage());  ;
        }
        return dbConnection;
    }


}
