<%-- 
    Document   : ViewPrevRides
    Created on : 20 Nov, 2017, 1:10:30 AM
    Author     : tanay
--%>

<%@page import="UWRideshare.services.ManageProfileServices"%>
<%@page import="UWRideshare.beans.DriverBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="UWRideshare.services.RideServices"%>
<%@page import="UWRideshare.beans.RideBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
	
	
	<title>View Prev Rides</title>
	
	<link rel="stylesheet" href="css/theme-yellow.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel ="stylesheet" href = "css/jquery-ui.css"/>
	<link rel="stylesheet" href="css/animate.css" />
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700|Montserrat:400,700">
	<link rel="shortcut icon" href="images/favicon.ico">

   
  </head>
  
  <body>
       <%
            if(session!=null)
            {
                int userid=(int)session.getAttribute("userid");
               ArrayList<RideBean> al=RideServices.getDriverRides(userid);
        %>
    <!-- Header -->
	<header class="header" role="banner">
		<div class="wrap">
			<!-- Logo -->
			<div class="logo">
				<a href="Home.jsp" title="UWRideShare"><img src="logos/uwlogo.png" width = "40px" height = "40px" alt="UWRideShare"/>UWRideShare</a>
			</div>
			<!-- //Logo -->
			
			<!-- Main Nav -->
			<nav role="navigation" class="main-nav">
				<ul>
					<li><a href="Home.jsp" title="">Home</a></li>
					
					
					<li><a href="DriverPanel.jsp" title="">DashBoard</a></li>
				</ul>
			</nav>
			<!-- //Main Nav -->
		</div>
	</header>
	<!-- //Header -->
	
	<!-- Main -->
	<main class="main" role="main">
		<%if (request.getParameter("msg")!=null) {
                        if (request.getParameter("msg").equals("fail"))
                             out.println("<label style='background-color:red'>failed to delete ride</label>");
                       
                      }
                        else
                       {

                        }
                         %>
		<div class="wrap">
			<div class="row">
				<!--- Content -->
				<div class="full-width content">
					<h2 style = "color:#fff;">The available rides are below</h2>
					 <% 
                                             RideBean objbean1;
                                             DriverBean objbean2=ManageProfileServices.getDashboard(userid);
                                            if(al.isEmpty())
                                            {
                                            response.sendRedirect("DriverPanel.jsp");
                                            }
                                            for (int i = 0; i < al.size(); i++) {
                                                objbean1 = al.get(i);
                                               %>
						<!-- Item -->
						<article class="result">
							<div class="one-fourth heightfix" style="text-align:center;font-size: 30;"><h3 style = "padding-top:10%">
                                                               <%
                                                                    String[] newpath = objbean1.getPath().split(",", -1);
                                                                    for(int j=0;j<newpath.length;j++)
                                                                    {
                                                                        
                                                               %>
                                                               <%=newpath[j] %> - <br/>
                                                            <%
                                                                }
                                                            %>
                                                            </h3></div>
							<div class="one-half heightfix">
								<h3><%= objbean1.getCarname() %> <a href="javascript:void(0)" class="trigger color" title="Read more">?</a></h3>
								<ul>
									<li>
										<span class="ico people"></span>
										<p>Max <strong><%= objbean1.getSeats() %> people</strong> </p>
									</li>
									<li>
										<span class="ico phone"></span>
										<p> <strong><%= objbean2.getContact() %></strong> <br /></p>
									</li>
									<li>
										<span class="ico time"></span>
										<p>Departure Date and Time <br /><strong><%=objbean1.getDatetime() %></strong></p>
									</li>
								</ul>
							</div>
							<div class="one-fourth">
								<div>
									<div class="price"><%= objbean1.getCost() %><small>CAD</small></div>
									<span class="meta">per passenger/stop</span>
                                                                        <a href="deleteride?rideid=<%=objbean1.getRideid() %>" class="btn grey large">delete</a>
								</div>
							</div>
							<div class="full-width information">	
								<a href="javascript:void(0)" class="close color" title="Close">x</a>
                                                                <p>Driver's Name  :<%= objbean2.getName() %></p><br>
                                                                <p>Driver's Email :<%= objbean2.getEmail() %></p>
                                                        </div>
						</article>
						<!-- //Item -->
						<%
                                                    }
                                                %>
						<!-- //Item -->
						
					</div>
				</div>
				<!--- //Content -->
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
					<p class="contact-data"><span class="ico phone"></span> +1 555 555 555</p>
					<p class="contact-data"><span class="ico email"></span> <a href="mailto:uwrideshare@gmail.com">uwrideshare@gmail.com</a></p>
				</article>
				<!-- //Column -->
				
				<!-- Column -->
				<article class="one-fourth">
					<h6>Follow us</h6>
					<ul class="social">
						<li class="facebook"><a href="#" title="facebook">facebook</a></li>
						<li class="twitter"><a href="#" title="twitter">twitter</a></li>
						<li class="gplus"><a href="#" title="gplus">google plus</a></li>
						<li class="linkedin"><a href="#" title="linkedin">linkedin</a></li>
						<li class="vimeo"><a href="#" title="vimeo">vimeo</a></li>
						<li class="pinterest"><a href="#" title="pinterest">pinterest</a></li>
					</ul>
				</article>
				<!-- //Column -->
			</div>
			
			<div class="copy">
				<p>Copyright 2014, Themeenergy. All rights reserved. </p>
				
				<nav role="navigation" class="foot-nav">
					<ul>
						<li><a href="#" title="Home">Home</a></li>
						<li><a href="#" title="Blog">Blog</a></li>
						<li><a href="#" title="About us">About us</a></li>
						<li><a href="#" title="Terms of use">Terms of use</a></li>
						<li><a href="#" title="Help">Help</a></li>
						<li><a href="#" title="For partners">For partners</a></li>
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
	<script src="js/search.js"></script>
	<script src="js/scripts.js"></script>
	<script src = "js/jquery.js"></script>
	<script src = "js/jquery-ui.js"></script>
	<script type = "text/javascript">
</script>
<%
                                                    }
                                                %>
  </body>
</html>
