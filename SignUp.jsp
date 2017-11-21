<%-- 
    Document   : SignUp
    Created on : Oct 26, 2017, 12:07:30 AM
    Author     : avibhullar
--%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
	
	<title>Sign Up</title>
	
	<link rel="stylesheet" href="css/theme-yellow.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/animate.css" />
	<!--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700|Montserrat:400,700">-->
	

    
  </head>
  
  <body>
    <!-- Header -->
	<header class="header" role="banner" style ="background:#191F26;">
		<div class="wrap">
			<!-- Logo -->
			<div class="logo">
				<a href="Home.jsp" title="Transfers"><img src="logos/uwlogo.png" width = "40px" height = "40px" alt="" />UWRideShare</a>
			</div>
			<!-- //Logo -->
			
			
			<!-- //Main Nav -->
		</div>
	</header>
	<!-- //Header -->
	
	<!-- Main -->
	<main class="main" role="main">
		<!-- Page info -->
		<header class="site-title color">
			<div class="wrap">
				<div class="container">
					<h1>Register</h1>
					<nav role="navigation" class="breadcrumbs">
						<ul>
							<li><a href="Home.jsp" title="Home">Home</a></li>
							<li>Register</li>
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
                <script>
                    function validForm()
                    {
                        var pwd = document.getElementById("textpassword").value;
                        if(pwd == "")
                        {
                            window.alert("MUST ENTER PASSWORD");
                            return false;
                        }
                        var cnpwd = document.getElementById("textconfirmpassword").value;
                        if(cnpwd == "")
                        {
                            window.alert("MUST RE-ENTER PASSWORD");
                            return false;
                        }
                        else if(pwd!= cnpwd)
                        {
                            window.alert("PASSWORD DOESNT MATCH");
                            return false;
                        }
                        return true;
                    }
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
     
            <form action="signup" method="post" id="form" onsubmit="return validForm()">
                                                     <%if (request.getParameter("msg") != null) {
                                    out.println("<label>There Was An Error Signing Up...Try Again</label>");
                                }
                            %>

							<div class="f-row">
								<div class="full-width">
									<label for="name">Your Name </label>
									<input type="text" name="textname" id="textname" placeholder="Your Name" required/>
								</div>
							</div>
							<div class="f-row">
								<div class="full-width">
									<label for="email">Your email address</label>
									<input type="email" name="textemail" id="textemail" placeholder="Your Email Address" required onblur="checkEmail()" />
								</div>
							</div>
							<div class="f-row">
								<div class="full-width">
									<label for="phone">Your Phone number</label>
									<input type="number" name="textmobile" id="textmobile" placeholder="Mobile Number (with country code)" required />
								</div>
							</div>								
							<div class = "f-row"
							<div class="f-row">
								<div class="full-width">
									<label for="password">Your password</label>
									<input type="password" name="textpassword" id="textpassword" placeholder="Choose Password" required />
								</div>
							</div>
							<div class="f-row">
								<div class="full-width">
									<label for="password2">Repeat password</label>
									<input type="password" name="textconfirmpassword" id="textconfirmpassword" placeholder="Confirm Password" required />
								</div>
								
							</div>
											
							<div class="f-row">
								<div class="full-width check">
									<input type="checkbox" id="checkbox" required/>
									<label for="checkbox">I agree with terms and conditions.</label>
								</div>
								
							</div>
							<div class="f-row">
								<div class="full-width">
									<input type="submit" value="Create an account" class="btn color medium full" />
								</div>
							</div>
							
							<p>Already have an account? <a href="Login.jsp">Login</a>.</p>
						</form>
					</div>
					<!--//Login-->
				</div>
				<!--- //Content -->
			</div>
		</div>
	</main>
	<!-- //Main -->
	
	<!-- Footer -->
	<footer class="footer black" role="contentinfo">
		<div class="wrap">
			<div class="row">
				<!-- Column -->
				<article class="one-half">
					<h6>About us</h6>
					<p>We want to provide students and collegues a better, faster and more efficient form of transportation. So farewell to those long hours on the bus, it is time to get to your destination on time!</p>
				</article>
				<!-- //Column -->
				
				<!-- Column -->
				<article class="one-fourth">
					<h6>Need help?</h6>
					<p>Contact us via phone or email:</p>
					<p class="contact-data"><span class="ico phone"></span> +1 519 781 3561</p>
					<p class="contact-data"><span class="ico email"></span> <a href="mailto:uwrideshare@gmail.com">uwrideshare@gmail.com</a></p>
				</article>
				<!-- //Column -->
				
				<!-- Column --> 
				<article class="one-fourth">
					<h6>Follow us</h6>
					<ul class="social">
						<li class="facebook"><a href="#" title="facebook">facebook</a></li>
						<li class="twitter"><a href="#" title="twitter">twitter</a></li>
						
					</ul>
				</article>
				<!-- //Column -->
			</div>
			
			<div class="copy">
				
				
				<nav role="navigation" class="foot-nav">
					<ul>
						<li><a href="Home.jsp" title="Home">Home</a></li>
						
						
						
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
