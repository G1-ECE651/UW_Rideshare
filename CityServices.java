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
public class CityServices {
        public static String returnCityIds(String names)
        {
            String newpath="";
           // ArrayList<String> stopnames;
            //stopnames= new ArrayList(Arrays.asList(names.split(",")));
            String[] stopnames = names.split(",", -1);
             Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try
            {
                conn = DBConnection.connect();
                for(int i=0;i<stopnames.length;i++)
                {
                    pstmt = conn.prepareStatement("select cityid from citytable where cityname=?");
                    pstmt.setString(1, stopnames[0]);
                    rs=pstmt.executeQuery();
                while(rs.next())
                {
                    if(i!=stopnames.length-1)
                    {
                        newpath=newpath+ rs.getInt("cityid")+",";
                    }
                    else
                    {
                         newpath=newpath+ rs.getInt("cityid");
                    }
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
                }
                catch(Exception e)
                {
                    System.out.println(e);
                }
            }
            return newpath;

        }
      
        
     public static String[] returnCityNames(String path)
     {
       String newpath[];
           // ArrayList<String> stopnames;
            //stopnames= new ArrayList(Arrays.asList(names.split(",")));
            String[] stopnames = path.split(",", -1);
            newpath=new String[stopnames.length];
             Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try
            {
                
                conn = DBConnection.connect();
                for(int i=0;i<stopnames.length;i++)
                {
                    pstmt = conn.prepareStatement("select cityname from citytable where cityid=?");
                    pstmt.setInt(1, Integer.parseInt(stopnames[0]));
                    rs=pstmt.executeQuery();
                while(rs.next())
                {
                   newpath[i]=rs.getString("cityname");
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
                }
                catch(Exception e)
                {
                    System.out.println(e);
                }
            }
            return newpath;   
     }
     public static boolean chkSrcDest(String source,String Destination,String path)
     {
         String[] newpath = path.split(",", -1);
         boolean flag=false;
         boolean flag1=false;
         int id=-1;
         for(int i=0;i<newpath.length;i++)
         {
             if(newpath[i].equalsIgnoreCase(source))
             {
                 flag=true;
                 id=i;
             }
             if((newpath[i].equalsIgnoreCase(Destination))&&(flag==true)&&(i>id))
             {
                 flag1=true;
             }
         }
         return flag1;
     }
    
}
