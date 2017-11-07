/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.services;

import UWRideshare.db.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
