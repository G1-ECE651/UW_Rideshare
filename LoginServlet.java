/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.beans.DriverBean;
import UWRideshare.services.LoginServices;
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
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String email = req.getParameter("textemail");
        String pwd = req.getParameter("textpassword");
        
        DriverBean objbean = LoginServices.authenticateDriver(email, pwd);
        if (objbean != null) {
            if (objbean.isStatus()) {
                if (objbean.getSignup().equalsIgnoreCase("Email")) {
                    if (objbean.isVerified()) {
                       
                        HttpSession s = req.getSession();
                        s.setAttribute("userid", objbean.getUserid());
                        s.setAttribute("email", email);
                        RequestDispatcher rd = req.getRequestDispatcher("DriverPanel.jsp");
                        rd.forward(req, resp);
                    }
                    else
                    {
                        HttpSession s = req.getSession();
                        s.setAttribute("email", email);
                        resp.sendRedirect("VerificationPage.jsp");
                    }

                } else {
                    resp.sendRedirect("Login.jsp?msg=Error");
                }

            } else {
                resp.sendRedirect("Login.jsp?msg=Inactive User");
            }
        } else {
            resp.sendRedirect("Login.jsp?msg=Login Unsuccessful");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    

}
