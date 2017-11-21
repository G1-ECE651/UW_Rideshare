/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.beans.DriverBean;
import UWRideshare.services.LoginServices;
import UWRideshare.services.ManageProfileServices;
import UWRideshare.services.SignUpServices;
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
public class GoogleLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pwd = req.getParameter("id");
        DriverBean objbean = LoginServices.authenticateDriver(email, pwd);
        if (objbean != null) {
            if (objbean.isStatus()) {
                if (objbean.getSignup().equalsIgnoreCase("google")) {
                    if (objbean.isVerified()) {
                        //int activityid = ManageProfileServices.addLoginTime(objbean.getUserid());
                        HttpSession s = req.getSession();
                        s.setAttribute("userid", objbean.getUserid());
                        s.setAttribute("email", email);
                         resp.getWriter().write("pass");
                       
                    }
                    else
                    {
                        resp.getWriter().write("nonver");
                    }

                } else {
                    resp.getWriter().write("Error");
                }

            } else {
                resp.getWriter().write("Inactive User");
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
            objbean1.setPassword(pwd);
            objbean1.setStatus(true);
            objbean1.setSignup("google");
            
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
           // resp.getWriter().write("Login Unsuccessful");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

}
