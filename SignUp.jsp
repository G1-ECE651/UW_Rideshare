<%-- 
    Document   : SignUp
    Created on : Oct 26, 2017, 12:07:30 AM
    Author     : avibhullar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            
            function statusChangeCallback(response) {
                console.log('statusChangeCallback');
                console.log(response);

                if (response.status === 'connected') {
                        console.log('Logged in.');
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
                    version: 'v2.10'
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
                   /* console.log('Successful login for: ' + response.name);
                     document.getElementById('status').innerHTML =
                     'Thanks for logging in, ' + response.name;
                     document.getElementById('eid').innerHTML =
                     'Your ID is, '+response.id;
                     document.getElementById('em').innerHTML =
                     'Your email is, ' +response.email; */

                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            if (this.responseText == "false")
                            {
                                document.getElementById("lbpopup").innerHTML = "There Was An Error Signing Up....Try Again";
                            } else
                            {
                                //window.location.href = "VerificationPage.jsp?email="+response.email;
                                window.location.href="index.html";
                            }
                        }
                    };
                    var url = "facebooksignup";
                    var params = "email=" + response.email + "&id=" + response.id + "&name=" + response.name;
                    xhttp.open("POST", url, true);
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhttp.send(params);
                });
            }
            
            

        </script>
    </head>
    <body>
               <form action="signup" method="post" id="form">
                <div class="form" style="">
                <fieldset >
                     <label style="background-color: red" id="lbpopup"></label>
                  <%if (request.getParameter("msg") != null) {
                                    out.println("<label style='background-color:red'>There Was An Error Signing Up...Try Again</label>");
                                }
                            %>
                            <div><b><h2>Signup with UWRideshare</h2></b></div><br>
                            <div> <h5>USING</h5> </div><br>
                            <div> 
                             
                                <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                                </fb:login-button></div>
                            <div> <h5>-OR USING EMAIL-</h5> </div>
                            <div > &nbsp;<input style="width: 240px;" type="email" name="textemail" id="textemail" placeholder="Your Email Address" required onblur="checkEmail()" ><br>
                                <label id="lbmsg" style="color:red"></label>
                                <br> 
                                <input style="width: 240px;" type="text" name="textname" id="textname" placeholder="Name" required><br><br>
                                <input style="width: 240px;" type="password" name="textpassword" id="textpassword" placeholder="Choose Password" required><br><br>
                                <input  style="width: 240px;" type="text" name="textmobile" id="textmobile" placeholder="Mobile Number (with country code)" required><br> <br>
                                <input type="submit" value="REGISTER" style="background-color: #f9b332; width: 240px"><br><br><br></div>
                            <div> 
                                <label> Already have an account?</label>
                                <a href="Login.jsp">Login</a></div><br>
             
                        </fieldset>
                    </div>
                </form>                   
    </body>
</html>
