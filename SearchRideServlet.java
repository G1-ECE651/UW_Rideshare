/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.beans.RideBean;
import UWRideshare.beans.SearchRideBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tanay
 */
public class SearchRideServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try
       {
           SearchRideBean objbean=new SearchRideBean();
           objbean.setSource(req.getParameter("textsource"));
           objbean.setDestination(req.getParameter("textdestination"));
            objbean.setDatetime(req.getParameter("textdate"));
            ArrayList<RideBean> al=UWRideshare.services.RideServices.getRides(objbean);
            if(al.isEmpty())
            {
                resp.sendRedirect("Home.jsp?msg=No Rides found for specified details");
            }
            else
            {
                
            }
          
           
       }
       catch(Exception e)
       {
           System.out.println(e);
       }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

   
}
