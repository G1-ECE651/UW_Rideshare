/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.services;

import UWRideshare.db.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author avibhullar
 */
public class UserMaintenanceServices {
     public static boolean verifyAccount(String email)
  {
      Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.connect();
            pstmt = conn.prepareStatement("update drivermaster set verified=? where email=?");
            pstmt.setBoolean(1,true);
            pstmt.setString(2,email);
            int a = pstmt.executeUpdate();
            if (a > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return false;
  }
     
     public static int getUserid(String email)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
       int userid = -1;
        try {
            conn = DBConnection.connect();
            pstmt = conn.prepareStatement("select userid from drivermaster where email=?");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                userid=rs.getInt("userid");
                return userid;
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return userid;
    }
}
