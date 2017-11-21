/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

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
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try
        {
            HttpSession s=req.getSession(false);
            String email=(String)s.getAttribute("email");
            String pwd=req.getParameter("textnewpassword");
            if(ManageProfileServices.resetPassword(email, pwd))
            {
                s.invalidate();
                resp.sendRedirect("Login.jsp?msg=Reset Password Successful");
            }
            else
            {   s.invalidate();
                resp.sendRedirect("Login.jsp?msg=Reset Password Failed");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    

}