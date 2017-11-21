<%-- 
    Document   : Home.jsp
    Created on : 9 Nov, 2017, 11:18:48 PM
    Author     : tanay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
	<meta charset="utf-8">
	
	
	<title>Home</title>
	
	<link rel="stylesheet" href="css/theme-yellow.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel ="stylesheet" href = "css/jquery-ui.css"/>
	<link rel="stylesheet" href="css/animate.css" />
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700|Montserrat:400,700">
	

   
  </head>
  
  <body class="home">
  
		<!-- Header -->
		<header class="header" role="banner" style = "background">
			<div class="wrap">
				<!-- Logo -->
				<div class="logo">
					<a href="Home.jsp" title="Transfers"><img src="logos/uwlogo.png" width = "40px" height = "40px"alt="Transfers" />UWRideshare</a>
				</div>
				<nav role="navigation" class="main-nav">
				<ul>
					<li class = "active"><a href="Home.jsp" title="">Home</a></li>
					
					<li><a href = "Login.jsp" title = "">Login</a></li>
					
					
					
				</ul>
			</nav>
				
			</div>
		</header>
	
	<!-- Main -->
	<main class="main" role="main">
		<!-- Intro -->
		<div class="intro">
			<div class="wrap">
				<div class="textwidget">
					<h1 class="wow fadeInDown" style= "color:#FCC307">Need a ride?</h1>
					<h2 class="wow fadeInUp" style= "color:#FCC307">You've come to the right place.</h2>
		<!--			<div class="actions">
						<a href="#services" title="Our services" class="btn large white wow fadeInLeft anchor">Our services</a>
						<a href="#booking" title="Make a booking" class="btn large color wow fadeInRight anchor">Make a booking</a>
					</div> -->
				</div>
			</div>
		</div>
		<!-- //Intro -->
		
		<!-- Search -->
		<div class="advanced-search color" id="booking">
                                                        <%
                                        if(request.getParameter("msg")!=null)
                                        {
                                          if(request.getParameter("msg").equals("empty")){  
                                                
                                    %>
                                    <div>  <label><b> <strong><font size="5">No rides found</font> </strong></b></label>  </div>
                                    <%
                                        }
}
                    
                                    %>
			<div class="wrap">
				<form role="form" action="SearchRides.jsp" method="post"> 
					<!-- Row -->
					<div class="f-row">
						<div class="form-group datepicker one-third">
							<label for="dep-date">Departure date and time</label>
							<input type="text"  name="textdate" id="textdate"  required/>
						</div>
						<div class="form-group select one-third">
							<label>Pick up location</label>
							<select name="textsource" required>
								<option selected>&nbsp;</option>
								<!--<optgroup label="Waterloo">-->
																							
								<!--</optgroup>-->
								<!--optgroup label="Kitchener">-->
								<option value="Toronto">Toronto</option>
								<option value="Smiths Falls">Smiths Falls</option>
								<option value="Perth">Perth</option>
								<option value="Hanover">Hanover</option>
								<option value="Gananoque<">Gananoque</option>
								<option value="Mississauga">Mississauga</option>
								<option value="Goderich">Goderich</option>
								<option value="Arnprior">Arnprior</option>
								<option value="Parry Sound">Parry Sound</option>
								<option value="Orangeville">Orangeville</option>
								<option value="Carleton Place">Carleton Place</option>
								<option value="Ottawa">Ottawa</option>
								<option value="Burlington">Burlington</option>
								<option value="St. Catharines">St. Catharines</option>
								<option value="Stratfor">Stratford</option>
								<option value="Hamilton">Hamilton</option>
								<option value="Oakville">Oakville</option>
								<option value="Oshawa">Oshawa</option>
								<option value="Brockville">Brockville</option>
								<option value="Richmond Hill">Richmond Hill</option>
								<option value="Pickering">Pickering</option>
								<option value="Newmarket">Newmarket</option>
								<option value="Owen Sound">Owen Sound</option>
								<option value="Aylmer">Aylmer</option>
								<option value="London">London</option>
								<option value="Vaughan">Vaughan</option>
								<option value="Windsor">Windsor</option>
								<option value="Kingston">Kingston</option>
								<option value="Renfrew">Renfrew</option>
								<option value="Shelburne">Shelburne</option>
								<option value="Brampton">Brampton</option>
								<option value="Cobourg">Cobourg</option>
								<option value="Ingersoll">Ingersoll</option>
								<option value="Hawkesbury">Hawkesbury</option>
								<option value="Fort Frances">Fort Frances</option>
								<option value="Markham">Markham</option>
								<option value="Kitchener">Kitchener</option>
								<option value="Guelph">Guelph</option>
								<option value="Ajax">Ajax</option>
								<option value="Peterborough">Peterborough</option>
								<option value="Aurora">Aurora</option>
								<option value="Welland">Welland</option>
								<option value="St. Thomas">St. Thomas</option>
								<option value="Orillia">Orillia</option>
								<option value="Cornwall">Cornwall</option>
								<option value="Collingwood">Collingwood</option>
								<option value="Brantford">Brantford</option>
								<option value="Woodstock">Woodstock</option>
								<option value="Cambridge">Cambridge</option>
								<option value="Waterloo">Waterloo</option>
								<option value="Whitby">Whitby</option>
								<option value="Niagara Falls">Niagara Falls</option>
								<option value="Midland">Midland</option>
								<option value="Petrolia">Petrolia</option>
								<option value="Milton">Milton</option>
								<option value="Sarnia">Sarnia</option>
								<option value="North Bay">North Bay</option>
								<option value="Belleville">Belleville</option>
								<option value="St. Marys">St. Marys</option>
								<option value="Barrie">Barrie</option>
								<option value="Thunder Bay">Thunder Bay</option>
								<option value="Halton Hills">Halton Hills</option>
								<option value="Tillsonburg">Tillsonburg</option>
								<option value="Port Colborne">Port Colborne</option>
								<option value="Dryden">Dryden</option>
								<option value="New Tecumseth">New Tecumseth</option>
								<option value="Bradford West Gwillimbury">Bradford West Gwillimbury</option>
								<option value="Thorold">Thorold</option>
								<option value="Penetanguishene">Penetanguishene</option>
								<option value="Sault Ste. Marie">Sault Ste. Marie</option>
								<option value="Whitchurch-Stouffville">Whitchurch-Stouffville</option>
								<option value="Lincoln">Lincoln</option>
								<option value="Fort Erie">Fort Erie</option>
								<option value="Grimsby">Grimsby</option>
								<option value="Tecumseh">Tecumseh</option>
								<option value="Georgina">Georgina</option>
								<option value="Wasaga Beach">Wasaga Beach</option>
								<option value="Niagara-on-the-Lake">Niagara-on-the-Lake</option>
								<option value="LaSalle">LaSalle</option>
								<option value="Pelham">Pelham</option>
								<option value="Amherstburg">Amherstburg</option>
								<option value="Innisfil">Innisfil</option>

								<!--</optgroup>-->
								
							</select>
						</div>
						<div class="form-group select one-third">
							<label>Drop off location</label>
							<select name="textdestination" required>
								<option selected>&nbsp;</option>
								<!--<optgroup label="Germany">-->
								<option value="Toronto">Toronto</option>
								<option value="Smiths Falls">Smiths Falls</option>
								<option value="Perth">Perth</option>
								<option value="Hanover">Hanover</option>
								<option value="Gananoque<">Gananoque</option>
								<option value="Mississauga">Mississauga</option>
								<option value="Goderich">Goderich</option>
								<option value="Arnprior">Arnprior</option>
								<option value="Parry Sound">Parry Sound</option>
								<option value="Orangeville">Orangeville</option>
								<option value="Carleton Place">Carleton Place</option>
								<option value="Ottawa">Ottawa</option>
								<option value="Burlington">Burlington</option>
								<option value="St. Catharines">St. Catharines</option>
								<option value="Stratfor">Stratford</option>
								<option value="Hamilton">Hamilton</option>
								<option value="Oakville">Oakville</option>
								<option value="Oshawa">Oshawa</option>
								<option value="Brockville">Brockville</option>
								<option value="Richmond Hill">Richmond Hill</option>
								<option value="Pickering">Pickering</option>
								<option value="Newmarket">Newmarket</option>
								<option value="Owen Sound">Owen Sound</option>
								<option value="Aylmer">Aylmer</option>
								<option value="London">London</option>
								<option value="Vaughan">Vaughan</option>
								<option value="Windsor">Windsor</option>
								<option value="Kingston">Kingston</option>
								<option value="Renfrew">Renfrew</option>
								<option value="Shelburne">Shelburne</option>
								<option value="Brampton">Brampton</option>
								<option value="Cobourg">Cobourg</option>
								<option value="Ingersoll">Ingersoll</option>
								<option value="Hawkesbury">Hawkesbury</option>
								<option value="Fort Frances">Fort Frances</option>
								<option value="Markham">Markham</option>
								<option value="Kitchener">Kitchener</option>
								<option value="Guelph">Guelph</option>
								<option value="Ajax">Ajax</option>
								<option value="Peterborough">Peterborough</option>
								<option value="Aurora">Aurora</option>
								<option value="Welland">Welland</option>
								<option value="St. Thomas">St. Thomas</option>
								<option value="Orillia">Orillia</option>
								<option value="Cornwall">Cornwall</option>
								<option value="Collingwood">Collingwood</option>
								<option value="Brantford">Brantford</option>
								<option value="Woodstock">Woodstock</option>
								<option value="Cambridge">Cambridge</option>
								<option value="Waterloo">Waterloo</option>
								<option value="Whitby">Whitby</option>
								<option value="Niagara Falls">Niagara Falls</option>
								<option value="Midland">Midland</option>
								<option value="Petrolia">Petrolia</option>
								<option value="Milton">Milton</option>
								<option value="Sarnia">Sarnia</option>
								<option value="North Bay">North Bay</option>
								<option value="Belleville">Belleville</option>
								<option value="St. Marys">St. Marys</option>
								<option value="Barrie">Barrie</option>
								<option value="Thunder Bay">Thunder Bay</option>
								<option value="Halton Hills">Halton Hills</option>
								<option value="Tillsonburg">Tillsonburg</option>
								<option value="Port Colborne">Port Colborne</option>
								<option value="Dryden">Dryden</option>
								<option value="New Tecumseth">New Tecumseth</option>
								<option value="Bradford West Gwillimbury">Bradford West Gwillimbury</option>
								<option value="Thorold">Thorold</option>
								<option value="Penetanguishene">Penetanguishene</option>
								<option value="Sault Ste. Marie">Sault Ste. Marie</option>
								<option value="Whitchurch-Stouffville">Whitchurch-Stouffville</option>
								<option value="Lincoln">Lincoln</option>
								<option value="Fort Erie">Fort Erie</option>
								<option value="Grimsby">Grimsby</option>
								<option value="Tecumseh">Tecumseh</option>
								<option value="Georgina">Georgina</option>
								<option value="Wasaga Beach">Wasaga Beach</option>
								<option value="Niagara-on-the-Lake">Niagara-on-the-Lake</option>
								<option value="LaSalle">LaSalle</option>
								<option value="Pelham">Pelham</option>
								<option value="Amherstburg">Amherstburg</option>
								<option value="Innisfil">Innisfil</option>
							</select>
						</div>
								
					</div>
					<!-- //Row -->
					
					
					<!-- //Row -->
					
					
					<div>
					
						<div class = "form-group right">
							<button type="submit" class="btn large black">Find a Ride</button>
						</div>
						<div class="form-group">
							<label>Want to offer a ride? <a href="Login.jsp" style="color:#000;"  onmouseover='this.style.textDecoration="underline"' 
								onmouseout='this.style.textDecoration="none"'>Please login </a> </label>
							
						</div>
							
					</div>
					<!--// Row -->
				</form>
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
<!--	<script src="js/jquery.datetimepicker.js"></script>-->
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/search.js"></script>
	<script src="js/scripts.js"></script>
	
		<script src = "js/jquery.js"></script>
	<script src = "js/jquery-ui.js"></script>
	<script>
	$(document).ready(function(){
   $('select').on('change', function(event ) {
       //restore previously selected value
       var prevValue = $(this).data('previous');
       $('select').not(this).find('option[value="'+prevValue+'"]').show();
       //hide option selected                
       var value = $(this).val();
       //update previously selected data
       $(this).data('previous',value);
       $('select').not(this).find('option[value="'+value+'"]').hide();
   });
});
</script>
<script type="text/javascript">

 $( "#textdate" ).datepicker({minDate: 0});
</script>
  </body>
</html>
