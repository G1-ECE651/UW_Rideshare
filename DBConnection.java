/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author tanay
 */
public class DBConnection {
    static Connection conn = null;
     public static Connection connect() {
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306/rideshare";
            conn = DriverManager.getConnection(url, "root", "root");
        } catch (Exception e) {
            System.out.println(e);
        }
        finally{
        
        return conn;
        }
    }
}
