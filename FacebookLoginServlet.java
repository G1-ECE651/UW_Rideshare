/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.beans.DriverBean;
import UWRideshare.services.LoginServices;
import UWRideshare.services.SignUpServices;
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
public class FacebookLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pwd = req.getParameter("id");
        String name=req.getParameter("name");
       // System.out.println(email);
        DriverBean objbean = LoginServices.authenticateDriver(email, pwd);
        if (objbean != null) {
            if (objbean.isStatus()) {
                if (objbean.getSignup().equalsIgnoreCase("Facebook")) {
                    if (objbean.isVerified()) {
                        HttpSession s = req.getSession();
                        s.setAttribute("userid", objbean.getUserid());
                        s.setAttribute("email", email);
                        resp.getWriter().write("pass");
                    }
                    else
                    {
                         resp.getWriter().write("nonver");
                    }
                    }
                   

                 else {
                    //email id and password are not for facebook signup
                    resp.getWriter().write("Error");
                    //resp.sendRedirect("Login.jsp?msg=Error");
                }

            } else {
                //user has been blocked by admin
                resp.getWriter().write("Inactive User");
               // resp.sendRedirect("Login.jsp?msg=Inactive User");
            }
        } else {
            
            try {
               if(SignUpServices.checkEmail(email))
                {
                   resp.getWriter().write("already");
                }
                else
                {
                     DriverBean objbean1 = new DriverBean();
            objbean1.setEmail(email);
            objbean1.setName(name);
            objbean1.setPassword(pwd);
            objbean1.setStatus(true);
            objbean1.setSignup("facebook");
            
            if(SignUpServices.addUser(objbean1))
            {
               resp.getWriter().write("newone");
            }
            else
            {
                resp.getWriter().write("Login Unsuccessful1");
            }
                }
           
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
            //unsuccessful login
            //resp.getWriter().write("Login Unsuccessful");
            //resp.sendRedirect("Login.jsp?msg=Login Unsuccessful");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

   

}
