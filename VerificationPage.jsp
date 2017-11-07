<%-- 
    Document   : VerificationPage
    Created on : Nov 1, 2017, 5:30:47 PM
    Author     : avibhullar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verification Page</title>
    </head>
    <body>
         <center>
                <fieldset id="form">
                <label  id="lbmsg" style="background-color: red"></label>
                
         <h2><b>Account Verification!</b></h2><br>
            <h5> SEND OTP TO:</h5><br>
            <button onclick="emailOTP()" style="background-color: #f9b332;color: black">Email</button>
            <br><br><br>
            <input type="number" id="textotp" name="textotp" placeholder="Enter OTP Here" required><br>
            <input type="hidden" id="hiddenotp" name="hiddenotp"><br><br>
            <%
                        String email = request.getParameter("email");
                        session.setAttribute("email", email);
            %>
            <label> Haven't received OTP?</label><br>
            <label> Click again to resend OTP</label><br><br><br>
            <button onclick="verifyOTP()" style="background-color: #f9b332;color: black">SUBMIT</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:cancelPass()">CANCEL</a>
            </fieldset>
           <!-- </form>-->
                </center>
                <script type="text/javascript">
            function emailOTP()
            {
                document.getElementById("lbmsg").innerHTML ="";
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        if (this.responseText == "failed")
                        {
                            document.getElementById("lbmsg").innerHTML = "There Was An Error Sending The OTP...Try Again!!!";
                        }
                        else if (this.responseText == "Not Registered")
                        {
                            document.getElementById("lbmsg").innerHTML = "Your Email Is Not Registered With Us.";
                        } 
                        else
                        {
                            document.getElementById("lbmsg").innerHTML = "OTP Has Been Sent To Your Registered Email.";
                            document.getElementById("hiddenotp").value = this.responseText;
                            document.getElementById("textotp").focus();
                        }
                    }
                };
                var url = "emailotp";
                xhttp.open("GET", url, true);
                xhttp.send();
            }
            
            function verifyOTP()
            {
               var otp=document.getElementById("textotp").value.trim();
               if(otp=="")
               {
                   document.getElementById("lbmsg").innerHTML="Please Enter The OTP";
                   document.getElementById("textotp").focus();
               }
               else
               {
                   var hidden=document.getElementById("hiddenotp").value.trim();
                   if(otp==hidden)
                   {
                       window.location.href="verify";
                   }
                   else
                   {
                       document.getElementById("lbmsg").innerHTML="The Entered OTP Is Incorrect";
                   }
               }
            }
            
            function cancelPass()
            {
                if(confirm("Account Verification Process Is Not Complete Yet.\nDoing This Will Not Verify Your Account. ")==true)
                {
                    window.location.href="Login.jsp";
                }
            }
            </script>
    </body>
</html>
