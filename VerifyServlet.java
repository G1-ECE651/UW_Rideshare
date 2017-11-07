/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.services.UserMaintenanceServices;
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
public class VerifyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s=req.getSession(false);
        String email=(String)s.getAttribute("email");
        if(UserMaintenanceServices.verifyAccount(email))
        {
            s.invalidate();
            resp.sendRedirect("Login.jsp");
        }
        else
        {
            resp.sendRedirect("VerificationPage.jsp?msg=Error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }


    }

   
    