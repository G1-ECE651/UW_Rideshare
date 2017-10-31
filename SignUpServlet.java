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
import javax.servlet.http.HttpSession;

/**
 *
 * @author avibhullar
 */
public class SignUpServlet extends HttpServlet {
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
            DriverBean objbean = new DriverBean();
            objbean.setEmail(req.getParameter("textemail"));
            objbean.setName(req.getParameter("textname"));
            objbean.setPassword(req.getParameter("textpassword"));
            objbean.setContact(req.getParameter("textmobile"));
       //     objbean.setType("User");
            objbean.setStatus(true);
            objbean.setSignup("Email");
            objbean.setVerified(false);
            
            if(SignUpServices.addUser(objbean))
            {
                HttpSession s=req.getSession();
                s.setAttribute("email", req.getParameter("textemail"));
               resp.sendRedirect("index.html");
            }
            else
            {
                resp.sendRedirect("SignUp.jsp?msg=Signup Failed");
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


