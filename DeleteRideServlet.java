/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

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
 * @author tanay
 */
public class DeleteRideServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try
       {
          HttpSession s=req.getSession(false);
          if(s!=null)
          {
              int rideid=Integer.parseInt(req.getParameter("rideid"));
              Boolean msg1=RideServices.changeStatus(rideid);
              System.out.println(msg1);
              if(msg1)
              {
                  resp.sendRedirect("ViewPrevRides.jsp?msg=true");
              }
              else
              {
                  resp.sendRedirect("ViewPrevRides.jsp?msg=fail");
              }
          }
       }
       catch(Exception e)
       {
           System.out.println(e);
       }
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
        
}
