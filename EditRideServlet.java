/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.beans.RideBean;
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
public class EditRideServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try
        {
            HttpSession s=req.getSession(false);
            if(s!=null)
            {
                Double cost=Double.parseDouble(req.getParameter("textcost"));
                int rideid=Integer.parseInt(req.getParameter("rideid"));
                String cartype=req.getParameter("textcartype");
                int seats=Integer.parseInt(req.getParameter("textseats"));
                RideBean objbean=new RideBean();
                objbean.setRideid(rideid);
                objbean.setCarname(cartype);
                objbean.setCost(cost);
                objbean.setSeats(seats);
                boolean flag=UWRideshare.services.RideServices.updateride(objbean);
                if(flag)
                {
                    resp.sendRedirect("DriverPanel.jsp?msg=success");
                }
                else
                {
                     resp.sendRedirect("DriverPanel.jsp?msg=fail");
                }
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
