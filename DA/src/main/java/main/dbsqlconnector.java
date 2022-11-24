/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.swing.AbstractButton;
import javax.swing.JOptionPane;
public class dbsqlconnector {
    static String JDBC_DRIVER,DB_URL;
    String USER,PASS;
    Connection conn;
    Statement stmt;

    public dbsqlconnector()
    {
           // JDBC driver name and database URL
        JDBC_DRIVER = "com.mysql.jdbc.Driver";
        DB_URL = "jdbc:mysql://localhost:3306";
        USER = "root";
        PASS = "";
        conn = null;
        stmt = null;
        ResultSet rs=null;
        ResultSet rs1=null;
        try{
              //STEP 2: Register JDBC driver
              Class.forName("com.mysql.jdbc.Driver");

              //STEP 3: Open a connection
              System.out.println("Connecting to database...");

              conn = DriverManager.getConnection(DB_URL,USER,PASS);
            //STEP 4: Execute a query
              System.out.println("Creating statement...");
              stmt = conn.createStatement();
              String sq;
              sq = "create  database if not exists AIRLINE";
                stmt.execute(sq);
                System.out.println("Creating statement...");
                String sql="use AIRLINE";
                stmt.execute(sql);


           }catch(SQLException se1){                      //Handle errors for JDBC
              se1.printStackTrace();
              System.out.print(se1);
           }catch(Exception e){                            //Handle errors for Class.forName
              e.printStackTrace();
             System.out.print(e);

              }




    }
}