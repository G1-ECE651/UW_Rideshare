<%-- 
    Document   : VerificationPage
    Created on : Nov 1, 2017, 5:30:47 PM
    Author     : avibhullar
--%>

<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
	
	
	<title>UWRideshare: Login</title>
	
	<link rel="stylesheet" href="css/theme-yellow.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/animate.css" />
	 <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700|Montserrat:400,700"> 
	
  </head>
  
  <body>
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
					
					<li><a href = "Login.jsp" title = "">Login</a></li>
					
					
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
					<h1>Activate your account</h1>
					<!--<nav role="navigation" class="breadcrumbs">
						<ul>
							<li><a href="index.html" title="Home">Home</a></li>
							<li>Login</li>
						</ul>
					</nav>-->
				</div>
			</div>
		</header>
		<!-- //Page info -->
		
		<div class="wrap">
			<div class="row">
				<!--- Content -->
				<div class="content one-half modal">
					<!--Login-->
					<div class="box"><h2 style = "text-align: center;">Account Verification<img style = "padding-left:10px;"src = "logos/acc_vef.png"/></h2> 
                                            
						<fieldset id="form">
                                                    <label  id="lbmsg" ></label>
                                                        <%
                                                            if(request.getParameter("msg")!=null)
                                                            {
                                                                if(request.getParameter("msg").equals("Error"))
                                                               {
                                                        %>
                                                       <label >There Was An Error Verifying Your Account....Try Again</label> 
                                                        <%
                                                                }
                                                                else
                                                                {

                                                                }
                                                            }

                                                        %>
							<div class="f-row" >
								<div class="full-width" style = "text-align:center;">
									<h4>Send OTP to:</h4>
							</div>
							<div class = "full-width">	
                                                                        <button onclick="emailOTP()" class = "btn color medium" style="margin-left:15%;">Email</button>
                                                                        <button onclick="smsOTP()" class = "btn color medium" style="margin-left:15%;">Phone Number</button>
								<%--  <input type="submit" id="phone" value="Phone Number" class = "btn color medium" style = "margin-left:12%;"/>  --%>
								</div>
							</div>
							<div class="f-row">
								<div class="full-width">
									<label for="password">Enter OTP here:</label>
									<input type="number" id="textotp" name="textotp" placeholder="Enter OTP Here" required />
                                                                         <input type="hidden" id="hiddenotp" name="hiddenotp"><br><br>
                                                                            <%
                                                                                        String email1 = request.getParameter("email");
                                                                                        String email=(String) session.getAttribute("email");
                                                                                        session.setAttribute("email", email);
                                                                                        session.setAttribute("email1", email1);
                                                                            %>
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
									
                                                                        <button onclick="verifyOTP()" class="btn color medium full">SUBMIT</button>
								</div>
							</div>
							
							<p>Haven't received OTP?<br /><a href="#">Click here</a> to resend OTP.</p>
						</fieldset>
					</div>
					<!--//Login-->
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

                               <%--    NOT SURE WILL USE THIS           function smsOTP()
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
                                                            document.getElementById("lbmsg").innerHTML = "Your contact Is Not Registered With Us.";
                                                        } 
                                                        else
                                                        {
                                                            document.getElementById("lbmsg").innerHTML = "OTP Has Been Sent To Your Registered number.";
                                                            document.getElementById("hiddenotp").value = this.responseText;
                                                            document.getElementById("textotp").focus();
                                                        }
                                                    }
                                                };
                                                var url = "smsotp";
                                                xhttp.open("GET", url, true);
                                                xhttp.send();
                                            }
--%>
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
