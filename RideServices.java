/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.services;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author avibhullar
 */
public class RideServices {
        public static boolean addRide(RideBean objbean)
    {
        Connection conn=null;
        PreparedStatement pstmt=null;
        try
        {
            conn=DBConnection.connect();
            pstmt=conn.prepareStatement("insert into rides (source,destination,path,status,datetime,userid,seats) values (?,?,?,?,?,?,?) ");
            pstmt.setString(1, objbean.getSource());
            pstmt.setString(2, objbean.getDestination());
            pstmt.setString(3, objbean.getPath());
            pstmt.setBoolean(4, objbean.isStatus());
            pstmt.setString(5, objbean.getDatetime());
            pstmt.setInt(6, objbean.getUserid());
            pstmt.setInt(7, objbean.getSeats());
            
            int a=pstmt.executeUpdate();
            if(a>0)
            {
                return true;
            }
            else
                return false;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        finally
        {
            try
            {
                pstmt.close();
                conn.close();
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        }
        return false;
    }
    
    public static boolean changeStatus(int rideid)
    {
        Connection conn=null;
        PreparedStatement pstmt=null;
        PreparedStatement pstmt1=null;
        try
        {
            pstmt=conn.prepareStatement("update rides set status=? where rideid=?");
            pstmt.setBoolean(1,false);
            pstmt.setInt(2,rideid);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        finally
        {
            try{
                pstmt.close();
                conn.close();
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        }
        return false;
    }
}
