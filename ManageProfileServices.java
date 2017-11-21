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
public class ManageProfileServices {
    
    public static DriverBean viewProfile(int userid)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DriverBean objbean = null;
        try {
            conn = DBConnection.connect();
            pstmt = conn.prepareStatement("select email,name,contact from drivermaster where userid=?");
            pstmt.setInt(1, userid);
            System.out.println(userid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                
                objbean = new DriverBean();
                objbean.setEmail(rs.getString("email"));
                objbean.setName(rs.getString("name"));
                objbean.setContact(rs.getString("contact"));
                objbean.setUserid(userid);
                return objbean;
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
        return objbean;
    }
    
    
    public static boolean editProfile (String name,String contact,int userid)
    {
         Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.connect();
            pstmt = conn.prepareStatement("update drivermaster set contact=?, name=? where userid=?");
            pstmt.setString(1, contact);
            pstmt.setString(2, name);

            pstmt.setInt(3, userid);
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
    
    
    public static boolean addContact (String contact,String email)
    {
         Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.connect();
            pstmt = conn.prepareStatement("update drivermaster set contact=? where email=?");
            pstmt.setString(1, contact);
            pstmt.setString(2, email);
            
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
    
    
    public static String getPassword(String email)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
       String pwd = null;
        try {
            conn = DBConnection.connect();
            pstmt = conn.prepareStatement("select password from drivermaster where email=?");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                pwd=rs.getString("password");
                return pwd;
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
        return pwd;
    }
    
    public static String changePassword(String oldpwd, String newpwd,int userid) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        String msg=null;
        try {
            conn=DBConnection.connect();
            pstmt=conn.prepareStatement("select password from drivermaster where userid=?");
            pstmt.setInt(1,userid);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                if(rs.getString("password").equals(oldpwd))
                {
                    pstmt=conn.prepareStatement("update drivermaster set password=? where userid=?");
                    pstmt.setString(1, newpwd);
                    pstmt.setInt(2, userid);
                    int a=pstmt.executeUpdate();
                    if(a>0)
                    {
                        msg="Done";
                        return msg;
                    }
                }
                else
                {
                    msg="Missmatch";
                    return msg;
                }
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
        msg="Error";
        return msg;
    }
    public static boolean resetPassword(String email, String pwd) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn=DBConnection.connect();
            pstmt=conn.prepareStatement("update usermaster set password=? where email=?");
            pstmt.setString(1,pwd);
            pstmt.setString(2,email );
            int a=pstmt.executeUpdate();
            if(a>0)
            {
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
    
    public static DriverBean getDashboard(int userid)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DriverBean objbean = null;
        try {
            conn = DBConnection.connect();
            pstmt = conn.prepareStatement("select email,name,contact from drivermaster where userid=?");
            pstmt.setInt(1, userid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                objbean = new DriverBean();
                objbean.setEmail(rs.getString("email"));
                objbean.setName(rs.getString("name"));
                objbean.setContact(rs.getString("contact"));
                objbean.setUserid(userid);
                return objbean;
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
        return objbean;
    }
}
