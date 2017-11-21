/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.services;

/**
 *
 * @author avibhullar
 */
public class OTPServices {
     public static int otpGenerator()
    {
        int otp;
        while(true)
        {
          otp=(int)(Math.random()*10000); 
          if(otp>=1000 && otp<10000)
          {
            break;
          }
        }
        
        return otp;
    }
}
