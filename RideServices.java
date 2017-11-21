/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.services;

import UWRideshare.beans.RideBean;
import UWRideshare.beans.SearchRideBean;
import UWRideshare.db.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
          String datetime=objbean.getDatetime();
        String[] date = datetime.split("\\s+");
            String datetime1=editDateTime(date[0]);
            datetime1=datetime1+" "+date[1];
            conn=DBConnection.connect();
            pstmt=conn.prepareStatement("insert into rides (source,destination,path,status,datetime,userid,seats,cost,carname) values (?,?,?,?,?,?,?,?,?) ");
            pstmt.setString(1, objbean.getSource());
            pstmt.setString(2, objbean.getDestination());
            pstmt.setString(3, objbean.getPath());
            pstmt.setBoolean(4, objbean.isStatus());
            pstmt.setString(5, datetime1);
            pstmt.setInt(6, objbean.getUserid());
            pstmt.setInt(7, objbean.getSeats());
            pstmt.setDouble(8, objbean.getCost());
            pstmt.setString(9,objbean.getCarname());
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
        try
        {
            conn=DBConnection.connect();
            pstmt=conn.prepareStatement("update rides set status=? where rideid=?");
            pstmt.setBoolean(1,false);
            pstmt.setInt(2,rideid);
             int a = pstmt.executeUpdate();
            if (a > 0) {
                return true;
            }
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
    
    public static ArrayList<RideBean> getDriverRides(int userid)
    {
        System.out.println("yyyywywywy");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<RideBean> al = null;
        RideBean objbean = null;
        changeStatusOfOldRides(userid);
        try {
            conn = DBConnection.connect();
            al=new ArrayList<RideBean>();
            pstmt = conn.prepareStatement("select rideid,source,destination,path,status,datetime,seats,cost,carname from rides where userid=?");
            pstmt.setInt(1, userid);
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                objbean=new RideBean();
                objbean.setRideid(rs.getInt("rideid"));
                objbean.setSource(rs.getString("source"));
                objbean.setDestination(rs.getString("destination"));
                objbean.setPath(rs.getString("path"));
                objbean.setStatus(rs.getBoolean("status"));
                objbean.setDatetime(rs.getString("datetime"));
                objbean.setSeats(rs.getInt("seats"));
                objbean.setCost(rs.getDouble("cost"));
                objbean.setCarname(rs.getString("carname"));
                if(objbean.isStatus())
                al.add(objbean);
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
        return al;
    }
    
    public static boolean changeStatusOfOldRides(int userid)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmt1=null;
        ResultSet rs = null;
        String prevdate="";
        try
        {
            conn = DBConnection.connect();
            pstmt = conn.prepareStatement("select datetime from rides where userid=?");
            pstmt.setInt(1, userid);
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                prevdate=rs.getString("datetime");
                String[] date = prevdate.split("\\s+");
                if (new SimpleDateFormat("yyyy-MM-dd").parse(date[0]).before(new Date()))
                {
                   // pstmt1=conn.prepareStatement("update rides set status=? where userid=?");
                  //  pstmt1.setBoolean(1,false);
                  //  pstmt1.setInt(2,userid);
                  //   int a = pstmt1.executeUpdate();
          //  if (a > 0) {
               
           // }
                }
            }
            return true;
             
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        finally
        {
            try
            {
                pstmt1.close();
                rs.close();
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
    public static String getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = new Date();
        String str = sdf.format(d);
        return str;
    }
    
    public static String editDateTime(String old_datetime)
            
    {
        String datetime;
        String[] date = old_datetime.split("/");
        datetime=date[2]+"-";
        datetime=datetime+date[0]+"-";
        datetime=datetime+date[1];
        return datetime;
    }
    public static ArrayList<RideBean> getRides(SearchRideBean objbean)
    {
         Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<RideBean> al = null;
        RideBean objbean1 = null;
        try {
            conn = DBConnection.connect();
            al=new ArrayList<RideBean>();
            
            String datetime=editDateTime(objbean.getDatetime());
            
            String query="select rideid,source,destination,path,status,userid,seats,cost,carname,datetime from rides where datetime like '%"+datetime+"%'";
            pstmt = conn.prepareStatement(query);
           // pstmt.setString(1, datetime);
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                System.out.println("have rides");
                if(CityServices.chkSrcDest(objbean.getSource(),objbean.getDestination(),rs.getString("path")) && (rs.getBoolean("status")))
                {
                    objbean1=new RideBean();
                    objbean1.setRideid(rs.getInt("rideid"));
                    objbean1.setSource(rs.getString("source"));
                    objbean1.setDestination(rs.getString("destination"));
                    objbean1.setPath(rs.getString("path"));
                    objbean1.setStatus(rs.getBoolean("status"));
                    objbean1.setDatetime(rs.getString("datetime"));
                    objbean1.setSeats(rs.getInt("seats"));
                    objbean1.setCarname(rs.getString("carname"));
                    objbean1.setCost(rs.getDouble("cost"));
                    objbean1.setUserid(rs.getInt("userid"));
                    al.add(objbean1);
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
        return al;
    }
}
