/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.servlets;

import UWRideshare.services.OTPServices;
import UWRideshare.services.SignUpServices;
import java.io.IOException;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import org.apache.hc.client5.http.impl.sync.HttpClients;
import org.json.JSONObject;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.entity.*;
import org.apache.http.HttpResponse;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.omg.DynamicAny.NameValuePair;


/**
 *
 * @author tanay
 */
public class SMSOTPServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try {
           System.out.println("hi");
            HttpSession s = req.getSession(false);
            if (s != null) {
                String email = (String) s.getAttribute("email");
                 String email1=(String)s.getAttribute("email1");
                 String phnum=null;
                if(email!=null)
                 phnum = SignUpServices.returnMobile(email);
                else if(email1!=null)
                   phnum = SignUpServices.returnMobile(email1); 
                System.out.println(phnum);
                phnum="+"+phnum;
                if (phnum == null) {
                    resp.getWriter().write("not provided");
                } else if (phnum.equals("not registered")) {
                    resp.getWriter().write(phnum);
                } else {
                    System.out.println("in else");
                    int otp = OTPServices.otpGenerator();
                    String message = "Your OTP IS: "+otp;
                    try {
                        System.out.println("in else1");
                        final BasicNameValuePair[] data = {
                        new BasicNameValuePair("phone", phnum),
                        new BasicNameValuePair("message", message),
                        new BasicNameValuePair("key", "66a8f02843daa54c386f1f2acf32038a903f529f6WRQSDSCEXUmlalPnvqnip55q")
                            };
                        HttpClient httpClient = HttpClients.createMinimal();
                        HttpPost httpPost = new HttpPost("https://textbelt.com/text");
                        System.out.println("in else4");
                        httpPost.setEntity(new UrlEncodedFormEntity(Arrays.asList(data)));
                        HttpResponse httpResponse = httpClient.execute(httpPost);

                        String responseString = EntityUtils.toString(httpResponse.getEntity());
                        JSONObject response = new JSONObject(responseString);
                         System.out.println("testing");
                    } catch (Exception e) {
                        System.out.println("error" + e);
                    }
                    resp.getWriter().write(""+otp);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    
}
