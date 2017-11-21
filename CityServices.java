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
    import java.util.ArrayList;

    /**
     *
     * @author tanay
     */
    public class CityServices {

        
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
             else if((newpath[i].equalsIgnoreCase(Destination))&&(flag==true)&&(i>id))
             {
                 flag1=true;
             }
         }
         return flag1;
     }
    }
