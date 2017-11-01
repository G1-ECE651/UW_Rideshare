/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.services;

import UWRideshare.beans.DriverBean;
import UWRideshare.db.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author tanay
 */
public class LoginServices {
    public static DriverBean authenticateDriver(String email,String pswd)
    {
            Connection conn=null;
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            DriverBean objbean=null;
            try
            {
                conn=DBConnection.connect();
                pstmt=conn.prepareStatement("select userid,password,status,signup,verified from drivermaster where email=?");
                pstmt.setString(1, email);
                rs=pstmt.executeQuery();
                if(rs.next())
                {
                   if(pswd.equals(rs.getString("password")))
                   {
                       objbean= new DriverBean();
                       objbean.setUserid(rs.getInt("userid"));
                       objbean.setVerified(rs.getBoolean("verified"));
                       objbean.setSignup(rs.getString("signup"));
                       objbean.setStatus(rs.getBoolean("status"));
                       return objbean;                       
                   }
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
            finally
            {
                try
                {
                rs.close();
                pstmt.close();
                conn.close();
                }catch(Exception e)
                {
                    System.out.println(e);
                }
                
            }
            return objbean;
    }
}
