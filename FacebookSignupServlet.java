/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.beans.DriverBean;
import UWRideshare.services.SignUpServices;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tanay
 */
public class FacebookSignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
             System.out.println("hii there");    
            DriverBean objbean = new DriverBean();
            objbean.setEmail(req.getParameter("email"));
            objbean.setName(req.getParameter("name"));
            objbean.setPassword(req.getParameter("id"));
            objbean.setStatus(true);
            objbean.setSignup("Facebook");
            
            if(SignUpServices.addUser(objbean))
            {
               resp.getWriter().write("true");
            }
            else
            {
                resp.getWriter().write("false");
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
