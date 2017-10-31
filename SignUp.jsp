<%-- 
    Document   : SignUp
    Created on : Oct 26, 2017, 12:07:30 AM
    Author     : avibhullar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <script>
             function checkEmail()
            {
                var email = document.getElementById("textemail").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        if (this.responseText == "false")
                        {
                            document.getElementById("lbmsg").innerHTML = "Email is already registered!!";
                            document.getElementById("textemail").focus();
                        } else
                        {
                            document.getElementById("lbmsg").innerHTML = "";
                        }
                    }
                };
                var url = "checkemail?email=" + email;
                xhttp.open("GET", url, true);
                xhttp.send();
            }

        </script>
    </head>
    <body>
               <form action="signup" method="post" id="form">
                <div class="form" style="background-color:#111; color: #f9b332">
                <fieldset >
                  <%if (request.getParameter("msg") != null) {
                                    out.println("<label style='background-color:red'>There Was An Error Signing Up...Try Again</label>");
                                }
                            %>
                            <div><b><h2>Signup with UWRideshare</h2></b></div><br>
                            <div> <h5>USING</h5> </div><br>
                            <div> <div class="g-signin2" data-onsuccess="onSignIn"></div>
                                <label> OR </label>
                                <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                                </fb:login-button></div>
                            <div> <h5>-OR USING EMAIL-</h5> </div>
                            <div > &nbsp;<input style="width: 240px;" type="email" name="textemail" id="textemail" placeholder="Your Email Address" required onblur="checkEmail()" ><br>
                                <label id="lbmsg" style="color:red"></label>
                                <br> 
                                <input style="width: 240px;" type="text" name="textname" id="textname" placeholder="Name" required><br><br>
                                <input style="width: 240px;" type="password" name="textpassword" id="textpassword" placeholder="Choose Password" required><br><br>
                                <input  style="width: 240px;" type="text" name="textmobile" id="textmobile" placeholder="Mobile Number (with country code)" required><br> <br>
                                <input type="submit" value="REGISTER" style="background-color: #f9b332;color: black; width: 240px"><br><br><br></div>
                            <div> 
                                <label> Already have an account?</label>
                                <a href="Login.jsp">Login</a></div><br>
                        </fieldset>
                    </div>
                </form>                   
    </body>
</html>
