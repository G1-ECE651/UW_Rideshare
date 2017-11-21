<%-- 
    Document   : Login
    Created on : 25 Oct, 2017, 7:52:31 PM
    Author     : tanay
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
       <meta name="google-signin-client_id" content="658838576787-qcb4tsn8pj2h0l72dojajaq0jvabqqn9.apps.googleusercontent.com">

	<meta charset="utf-8">
	
	
	<title>UWRideshare: Login</title>
	         <link href="https://fonts.googleapis.com/css?family=Poppins:300" rel="stylesheet">

	<link rel="stylesheet" href="css/theme-yellow.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/animate.css" />
	 <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700|Montserrat:400,700">
	
  </head>
  
  <body>
      
              <script src="https://apis.google.com/js/platform.js" async defer></script>

      <div id="fb-root"></div>



<script>
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
//    document.getElementById('status').innerHTML = response;
    if (response.status === 'connected') {
       document.getElementById('status').innerHTML = 'connected'; 
      testAPI();
    } else {
  //    document.getElementById('status').innerHTML = 'Please log ' +
    //    'into this app.';
        
    }
  }

  function checkLoginState() {
      
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1534383156677825',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.10' // use graph api version 2.8
  });


  FB.getLoginStatus(function(response) {
     
    statusChangeCallback(response);
  });

  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  
  function testAPI() {
      document.getElementById('status').innerHTML = 'In Test Api';
                console.log('Welcome!  Fetching your information.... ');
                FB.api('/me', {fields: 'name, email'}, function (response) {
                    /*console.log('Successful login for: ' + response.name);
                     document.getElementById('status').innerHTML =
                     'Thanks for logging in, ' + response.name;
                     document.getElementById('eid').innerHTML =
                     'Your ID is, '+response.id; */
                     //document.getElementById('status').innerHTML =
                     //'Your email is, ' +response.email;
                    
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            if (this.responseText === "newone")
                            {
                                window.location.href="AddContact.jsp?email="+response.email;
                            }
                            else if(this.responseText === "pass")
                            {
                                 //HttpSession s=req.getSession();
                                // String w=""+response.email;
                               
                               // resp.sendRedirect("loginwithfacebook?email="+w);
                               // window.location.href="loginwithfacebook?email="+response.email;
                                var url = "loginwithfacebook";
                                var params = "email=" + response.email ;
                                xhttp.open("POST", url, true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send(params);
                                window.location.href="DriverPanel.jsp";
                            }
                            else if(this.responseText === "Error")
                            {
                                document.getElementById('status').innerHTML ='Error While login';
                               // window.location.href="Login.jsp?msg=Error";
                                
                            }
                            else if(this.responseText === "Inactive User")
                            {
                                document.getElementById('status').innerHTML ='User Blocked by Admin';
                                //window.location.href="Login.jsp?msg=Inactive User";
                            }
                            else if(this.responseText === "Login Unsuccessful")
                            {
                                document.getElementById('status').innerHTML ='Login Unsuccessful';
                                //window.location.href="Login.jsp?msg=Login Unsuccessful";
                            }
                            else if(this.responseText==="nonver")
                            {
                               // HttpSession s=req.getSession();
                               // s.setAttribute("email",objbean.getEmail());
                               // resp.sendRedirect("VerificationPage.jsp");
                                window.location.href="VerificationPage.jsp?email="+response.email;
                            }
                            else if(this.responseText==="already")
                            {
                                document.getElementById('status').innerHTML ='Account with same email id exists';
                                //window.location.href="Login.jsp?msg=already";
                            }
                            else
                            {
                                 document.getElementById('status').innerHTML =this.responseText;
                                                    
                                // window.location.href="Login.jsp?msg=Login Unsuccessful";
                            }
                        }
                    };
                    var url = "facebooklogin";
                    var params = "email=" + response.email + "&id=" + response.id +"name="+response.name;
                    xhttp.open("POST", url, true);
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhttp.send(params);
                });
            }
  
  FB.logout(function(response) {
   // Person is now logged out
});
  
 /* function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }    */
    
    function onSignIn(googleUser) {
                var profile = googleUser.getBasicProfile();
            /*    document.write('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                document.write('Name: ' + profile.getName());
                document.write('Image URL: ' + profile.getImageUrl());
                document.write('Email: ' + profile.getEmail()+'<br>'); // This is null if the 'email' scope is not present.*/
               
               var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                             if (this.responseText === "newone")
                            {
                              // document.getElementById('status').innerHTML ='Error @@@@@@@ login';

                                window.location.href="AddContact.jsp?email="+profile.getEmail();
                                
                            }
                            else if(this.responseText === "pass")
                            {
                                
                                var url = "loginwithgoogle";
                                var params = "email=" + profile.getEmail() ;
                                xhttp.open("POST", url, true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send(params);
                                window.location.href="DriverPanel.jsp";
                            }
                            else if(this.responseText === "Error")
                            {
                                document.getElementById('status').innerHTML ='Error While login';
                                
                            }
                            else if(this.responseText === "Inactive User")
                            {
                                document.getElementById('status').innerHTML ='User Blocked by Admin';
                            }
                            else if(this.responseText === "Login Unsuccessful")
                            {
                                document.getElementById('status').innerHTML ='Login Unsuccessful';
                            }
                            else if(this.responseText==="nonver")
                            {
                                window.location.href="VerificationPage.jsp?email="+profile.getEmail();
                            }
                            else if(this.responseText==="already")
                            {
                                document.getElementById('status').innerHTML ='Account with same email id exists';
                            }
                            else
                            {
                                 document.getElementById('status').innerHTML =this.responseText;
                            }
                        }
                    };
                                //                     document.getElementById('status').innerHTML ='jjjiiiii';

                    var url = "googlelogin";
                    var params = "email=" + profile.getEmail() + "&id=" + profile.getId();
                    xhttp.open("POST", url, true);
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhttp.send(params);
            }

            
            function signOut() {
                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                    document.write('User signed out.');
                });
            }
</script>

    <!-- Header -->
	<header class="header" role="banner" style = "background:#191F26;">
		<div class="wrap">
			<!-- Logo -->
			<div class="logo">
				<a href="Home.jsp" title="Transfers"><img src="logos/uwlogo.png" width = "40px" height = "40px" alt="" />UWRideShare</a>
			</div>
			<nav role="navigation" class="main-nav">
				<ul>
					<li><a href="Home.jsp" title="">Home</a></li>			
					
					
				</ul>
			</nav>
			
		</div>
	</header>
	<!-- //Header -->
	
	<!-- Main -->
	<main class="main" role="main">
		<!-- Page info -->
		<header class="site-title color">
			<div class="wrap">
				<div class="container">
					<h1>Login</h1>
					<nav role="navigation" class="breadcrumbs">
						<ul>
							<li><a href="Home.jsp" title="Home">Home</a></li>
							<li>Login</li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<!-- //Page info -->
		
		<div class="wrap">
			<div class="row">
				<!--- Content -->
				<div class="content one-half modal">
					<!--Login-->
					<div class="box">
						<form action="login" method="post" id="form">
                                                    <div id="status"></div>
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
                                                                else if (request.getParameter("msg").equals("already")) {
                                                                    out.println("<label style='background-color:red'> !  Account with same email id exists</label>");
                                                                }
                                                                 else if (request.getParameter("msg").equals("Error")) {
                                                                    out.println("<label style='background-color:red'> !  There Was An Error While Logging In....Try Again</label>");
                                                                }
                                                               if(session!=null)
                                                            {
                                                                
                                                                session.invalidate();
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
                                                       
							<div class="f-row">
								<div class="full-width">
									<label for="username">Your Email</label>
									<input type="email" name="textemail" id="textemail" placeholder="Your Email Address" required  />
								</div>
							</div>
							<div class="f-row">
								<div class="full-width">
									<label for="password">Your password</label>
									<input type="password" name="textpassword" id="textpassword" placeholder="Your Password" required />
								</div>
									
							<div class = "imgContainer">
							
							<h3 style = "text-align:center; padding-top:20%;">You can also login using Facebook or Google</h3>
									<div class = "imgContent">
                                                                           
                                                                                <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                                                                                </fb:login-button></div>
									<%--	<div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" ></div>  --%>
										
                                                                        <div class="g-signin2" data-onsuccess="onSignIn"></div>
									<%--	<a  target= "_blank" href="https://accounts.google.com/ServiceLogin">
									<img src = "logos/google_logo.png" alt = "google" width = "80px" height = "80px" style= "margin-left:10%"/> </a> --%>
									</div>	
								</div>	
							
							
							<!--<div class="f-row">
								<div class="full-width check">
									<input type="checkbox" id="checkbox" />
									<label for="checkbox">Remember me next time</label>
								</div>
							</div>-->
							<div class="f-row">
								<div class="full-width">
									<input type="submit" value="Login" class="btn color medium full" />
								</div>
							</div>
							
							<p><a href="RecoverPassword.jsp">Forgotten password?</a><br />Dont have an account yet? <a href="SignUp.jsp">Sign up</a>.</p>
						</form>
                                        </div>                       
					</div>
					<!--//Login-->
				</div>
				<!--- //Content -->
			</div>
		</div>
	</main>
	<!-- //Main -->
	
	<!-- Footer -->
	<footer class="footer black" role="contentinfo" >
		<div class="wrap">
			<div class="row">
				<!-- Column -->
				<article class="one-half">
					<h6>UWRideshare Mission</h6>
					<p>We want to provide students and collegues a better, faster and more efficient form of transportation. So farewell to those long hours on the bus, it is time to get to your destination on time!</p>
				</article>
				<!-- //Column -->
				
				<!-- Column -->
				<article class="one-fourth">
					<h6>Need help?</h6>
					<p>Contact us via phone or email:</p>
					<p class="contact-data"><span class="ico phone"></span> +1-519-781-3561</p>
					<p class="contact-data"><span class="ico email"></span> <a href="mailto:uwrideshare@gmail.com">uwrideshare@gmail.com</a></p>
				</article>
				<!-- //Column -->
				
				<!-- Column -->
				<article class="one-fourth">
					<h6>Follow us</h6>
				<ul class="social">
						<li class="facebook"><a target= "_blank" href="https://facebook.com" title="facebook">facebook</a></li>
						<li class="twitter"><a href="https://twitter.com" title="twitter">twitter</a></li>
					<!--	<li class="gplus"><a href="#" title="gplus">google plus</a></li>
						<li class="linkedin"><a href="#" title="linkedin">linkedin</a></li>
						<li class="vimeo"><a href="#" title="vimeo">vimeo</a></li>
						<li class="pinterest"><a href="#" title="pinterest">pinterest</a></li> -->
					</ul>
				</article>
				<!-- //Column -->
			</div>
			
			<div class="copy">
				
				
				<nav role="navigation" class="foot-nav">
					<ul>
						<li><a href="Home.jsp" title="Home">Home</a></li>
						<!--<li><a href="#" title="Blog">Blog</a></li>
						<li><a href="#" title="About us">About us</a></li>						
						<li><a href="#" title="Terms of use">Terms of use</a></li>
						<li><a href="#" title="Help">Help</a></li>
						<li><a href="#" title="For partners">For partners</a></li> -->
					</ul>
				</nav>
			</div>
		</div>
	</footer>
	<!-- //Footer -->
	
	<!-- Preloader -->
	<div class="preloader">
		<div id="followingBallsG">
			<div id="followingBallsG_1" class="followingBallsG"></div>
			<div id="followingBallsG_2" class="followingBallsG"></div>
			<div id="followingBallsG_3" class="followingBallsG"></div>
			<div id="followingBallsG_4" class="followingBallsG"></div>
		</div>
	</div>
	<!-- //Preloader -->

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
	<script src="js/jquery.uniform.min.js"></script>
	<script src="js/jquery.datetimepicker.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/scripts.js"></script>
	
  </body>
</html>
