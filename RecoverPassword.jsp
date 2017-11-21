<%-- 
    Document   : RecoverPassword
    Created on : Nov 6, 2017, 10:35:57 PM
    Author     : avibhullar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
			<div class="">
				<a href="Home.jsp" alt="UWRideshare" /></a>
			</div>
			
		</div>
	</header>
	<!-- //Header -->
	
	<!-- Main -->
	<main class="main" role="main">
		<!-- Page info -->
		<header class="site-title color">
			<div class="wrap">
				<div class="container">
					<h1 style = "text-align:center; font-style:""Comic Sans MS", cursive, sans-serif; font-size: 35px;"">Recover Password </h1>
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
					<div class="box">
                                            <form action="emailpassword" method="post" id="form">
                                                <%
                                                    if(request.getParameter("msg")!=null)
                                                    {
                                                       
                                                        if(request.getParameter("msg").equalsIgnoreCase("Not Registered"))
                                                        {

                                                    %>
                                                    <label >Your email is not registered </label>
                                                    <%
                                                        }
                                                        else if(request.getParameter("msg").equalsIgnoreCase("sent"))
                                                        {

                                                    %> 
                                                    <label >&nbsp;&nbsp;Password has been sent to your registered email </label>
                                                    <%
                                                        }
                                                        else 
                                                        {
                                                    %>
                                                    <label >There Was An Error Sending The Password...Try Again!!! </label>
                                                    <%
                                                        }
                                                            }
                                                              else
                                                            {
                                                            }

                                                    %>
							<div class="f-row">
								<div class="full-width">
								<p style = "text-align:center;">Please enter the email address used for registration</p>
								<br>
									<label for="email">Your email address</label>
                                                                        <input type="email" id="textemail" name="textemail" required/>
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
                                                                    <input  type="submit" value="Recover Password" class="btn color medium full" />
								</div>
							</div>
							
							<p>Dont have an account yet? <a href="SignUp.jsp">Sign up</a>.</p>
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
	<footer class="footer black" role="contentinfo" >
		<div class="wrap">
			<div class="row">
				<!-- Column -->
				<article class="one-half">
					<h6>About Us</h6>
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