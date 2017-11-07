/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.email;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author avibhullar
 */
public class SMTPAuthenticator extends Authenticator{
    private String username,password;
	public SMTPAuthenticator(String username,String password){
		this.username=username;
		this.password=password;
		
	}
    
	public javax.mail.PasswordAuthentication getPasswordAuthentication(){
		
		return new PasswordAuthentication(this.username,this.password);
	}
}