<%-- 
    Document   : Login
    Created on : 25 Oct, 2017, 7:52:31 PM
    Author     : tanay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="login" method="post" id="form">
                <div class="form" style="background-color:#111; color: #f9b332">
                <fieldset >
                    <%if (request.getParameter("msg") != null) {
                            if (request.getParameter("msg").equals("Inactive User")) {
                                out.println("<label style='background-color:red'> !  The User Is Blocked By The Admin</label>");
                            } else if (request.getParameter("msg").equals("Login Unsuccessful")) {
                                out.println("<label style='background-color:red'> !  The Email Or Password You Entered Is Incorrect</label>");
                            } else if (request.getParameter("msg").equals("Reset Password Successful")) {
                                out.println("<label style='background-color:red'> !  Your Password Has Been Reset Successfully</label>");
                            } else if (request.getParameter("msg").equals("Reset Password Failed")) {
                                out.println("<label style='background-color:red'> !  There Was An Error While Resetting The Password...Try Again</label>");
                            }
                             else if (request.getParameter("msg").equals("Error")) {
                                out.println("<label style='background-color:red'> !  There Was An Error While Logging In....Try Again</label>");
                            }
                        }
                    else
                    {
                        if(session!=null)
                        {
                            session.invalidate();
                        }
                    }
                    %>

                    <div><b><h2>Login to UWRideshare</h2><b></div><br>
                    <div><h5>USING</h5></div><br>
                        <div>
                            <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                        </fb:login-button></div>  
                    <div> <h5>-OR USING EMAIL-</h5> </div>
                    <div> <input type="email" name="textemail" id="textemail" placeholder="Your Email Address" required><br> <br>
                        <input type="password" name="textpassword" id="textpassword" placeholder="Enter Password" required><br> <br><br>
                        <input type="submit" value="LOGIN" style="background-color: #f9b332;color: black;width: 180px"><br><br><br></div>
                                
                      </fieldset>
                    </div>
            </form>
                
          <script type="text/javascript">
                    
            function statusChangeCallback(response) {
                console.log('statusChangeCallback');
                console.log(response);

                if (response.status === 'connected') {

                    testAPI();
                } else {

                    document.getElementById('status').innerHTML = 'Please log ' +
                            'into this app.';
                }
            }


            function checkLoginState() {
                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });
            }

            window.fbAsyncInit = function () {
                FB.init({
                    appId: '1906133609676574',
                    cookie: true,

                    xfbml: true,
                    version: 'v2.8'
                });



                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });

            };


            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));


            function testAPI() {
                console.log('Welcome!  Fetching your information.... ');
                 FB.api('/me', {fields: 'name, email'}, function (response) {
                  /*  console.log('Successful login for: ' + response.name);
                     document.getElementById('status').innerHTML =
                     'Thanks for logging in, ' + response.name;
                     document.getElementById('eid').innerHTML =
                     'Your ID is, '+response.id;
                     document.getElementById('em').innerHTML =
                     'Your email is, ' +response.email; */

                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            if (this.responseText === "active")
                            {
                                window.location.href="index.html";
                            } 
                            else if(this.responseText === "Error")
                            {
                                window.location.href="Login.jsp?msg=Error";
                            }
                            else if(this.responseText === "Inactive User")
                            {
                                window.location.href="Login.jsp?msg=Inactive User";
                            }
                            else if(this.responseText === "Login Unsuccessful")
                            {
                                window.location.href="Login.jsp?msg=Login Unsuccessful";
                            }
                        }
                    };
                    var url = "facebooklogin";
                    
                    var params = "email=" + response.email + "&id=" + response.id;
                    xhttp.open("POST", url, true);
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhttp.send(params);
                });
            }
            
            
           </script>
    </body>
</html>
