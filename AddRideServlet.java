/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.beans.RideBean;
import UWRideshare.services.ManageProfileServices;
import UWRideshare.services.RideServices;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author avibhullar
 */
public class AddRideServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try
        {
            HttpSession s=req.getSession(false);
        String path;
        String datetime;
             if(s!=null)
          {
              System.out.println("addrideservlet");
              RideBean objbean=new RideBean();
              int userid=(int)s.getAttribute("userid");
              System.out.println("userid"+userid);
              objbean.setSource(req.getParameter("textsource"));
              String stop1=req.getParameter("stop1");
              String stop2=req.getParameter("stop2");
              String stop3=req.getParameter("stop3");
              System.out.println(objbean.getSource());
              objbean.setDestination(req.getParameter("textdestination"));
              objbean.setCarname(req.getParameter("textcartype"));
              objbean.setSeats(Integer.parseInt(req.getParameter("textseats")));
             // String path1=req.getParameter("textpath");
              
              String path1="";
              boolean flag1,flag2,flag3;
              flag1=false;
              flag2=false;
              flag3=false;
              if(!stop1.equalsIgnoreCase("none"))
              {
                   flag1=true;
              }
              if(!stop2.equalsIgnoreCase("none"))
              {
                   flag2=true;
              }
               if(!stop3.equalsIgnoreCase("none"))
               {
                   flag3=true;
               }
                 if(flag1 && flag2 && flag3)
                     path1= path1+""+stop1+","+stop2+","+stop3;
                else if(flag1 && flag2)
                    path1=path1+stop1+","+stop2;
                else if(flag1 && flag3)
                    path1=path1+stop1+","+stop3;
                else if(flag2 && flag3)
                    path1=path1+stop2+","+stop3;
                else if(flag1)
                    path1=path1+stop1;
                else if(flag2)
                    path1=path1+stop2;
                else if(flag3)
                    path1=path1+stop3;
                    
              if(path1.trim().length() > 0)
                  path=objbean.getSource()+","+path1+","+objbean.getDestination();
              else
                  path=objbean.getSource()+","+objbean.getDestination();
              objbean.setPath(path);
              datetime=req.getParameter("textdate")+" "+req.getParameter("texttime");
              objbean.setDatetime(datetime);
              objbean.setStatus(true);
              objbean.setUserid(userid);
            //  objbean.setSeats(Integer.parseInt(req.getParameter("textseats")));
              objbean.setCost(Double.parseDouble(req.getParameter("textcost")));
             // objbean.setCarname(req.getParameter("textcartype"));
              
               Boolean msg=RideServices.addRide(objbean);
              if(msg)
              {
                  
                  resp.sendRedirect("DriverPanel.jsp?msg=success");
              }
              else
              {
                  resp.sendRedirect("DriverPanel.jsp?msg=fail");
              }
          }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
         
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
}
