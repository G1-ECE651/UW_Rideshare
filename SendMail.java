/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UWRideshare.email;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author avibhullar
 */
public class SendMail {
        public static String sendMail(String toEmailId, String text, String subject) {

        try {

//--[ Set up the default parameters
            Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.transport.protocol", "smtp");
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.port", "587");
            p.put("mail.smtp.starttls.enable", "true");

//--[ Create the session and create a new mail message
            Authenticator auth = new SMTPAuthenticator("UWRideshare@gmail.com", "rideshare123");
            Session mailSession = Session.getInstance(p, auth);
            Message msg = new MimeMessage(mailSession);
//--[ Set the FROM, TO, DATE and SUBJECT fields
            msg.setFrom(new InternetAddress("UWRideshare@gmail.com"));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmailId));
            msg.setSentDate(new Date());
            msg.setSubject(subject);

//--[ Create the body of the mail
            msg.setText(text);
            Transport.send(msg);
            return "sent";
        } catch (Exception E) {
            System.out.println("Something gone wrong while sending mail!");
            return "failed";
        }
    }
}
