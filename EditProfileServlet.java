/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.beans.DriverBean;
import UWRideshare.services.ManageProfileServices;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author avibhullar
 */
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try
       {
            HttpSession s=req.getSession(false);
            if (s!=null)
            {
                String name = req.getParameter("textname");
                String contact = req.getParameter("textcontact");
                int userid=(int)s.getAttribute("userid");
                if(ManageProfileServices.editProfile(name,contact,userid))
                {
                    resp.sendRedirect("DriverPanel.jsp");
                }
                else
                    resp.sendRedirect("DriverPanel.jsp");
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
