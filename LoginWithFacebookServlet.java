/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.services.UserMaintenanceServices;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tanay
 */
public class LoginWithFacebookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // HttpSession s=req.getSession(false);
        // String email="";
        // if(s!=null)
       // System.out.println("kkkk");
           String  email =req.getParameter("email");
      int userid=UserMaintenanceServices.getUserid(email);
      if(userid!=-1)
      {
         // System.out.println("oooooo");
                        HttpSession s1 = req.getSession();
                        s1.setAttribute("userid", userid);
                        s1.setAttribute("email", email);
                        RequestDispatcher rd = req.getRequestDispatcher("DriverPanel.jsp");
                        rd.forward(req, resp);
      }
      else
      {
          
      }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

  
}
