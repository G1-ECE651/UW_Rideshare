/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.email.SendMail;
import UWRideshare.services.ManageProfileServices;
import UWRideshare.services.OTPServices;
import UWRideshare.services.SignUpServices;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author avibhullar
 */
public class EmailPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email=req.getParameter("textemail");
        String msg;
        boolean flag=false;
       if(SignUpServices.checkEmail(email))
       {
           String password = ManageProfileServices.getPassword(email);
                    
                     msg = SendMail.sendMail(email, "Your password For UWRideshare Is:" + password, "Password Recovery");
                    if (msg.equalsIgnoreCase("sent")) {
                        msg="sent";
                        resp.sendRedirect("RecoverPassword.jsp?msg="+msg);
                    } else {
                        resp.sendRedirect("RecoverPassword.jsp?msg="+msg);
                    }
       }
       else
       {
           msg="Not Registered";
           resp.sendRedirect("RecoverPassword.jsp?msg="+msg);
       }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

}