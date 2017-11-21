/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.services.OTPServices;
import UWRideshare.services.SignUpServices;
import UWRideshare.email.SendMail;
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
public class EmailOTPServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try {
            HttpSession s = req.getSession(false);
           
            if (s != null) {
                String email = (String) s.getAttribute("email");
              String email1=(String)s.getAttribute("email1");
              if(email==null)
                  email=email1;
              
                  if ((SignUpServices.checkEmail(email))) {
                    int otp = OTPServices.otpGenerator();
                    
                    String msg = SendMail.sendMail(email, "Your OTP  Is:" + otp, "Verification");
                    if (msg.equalsIgnoreCase("sent")) {
                        resp.getWriter().write(""+otp);
                    } else {
                        resp.getWriter().write(msg);
                    }
                } else {
                    resp.getWriter().write("Not Registered");
                }
              
             
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
}