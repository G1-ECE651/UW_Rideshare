<%-- 
    Document   : DriverPanel
    Created on : 9 Nov, 2017, 7:08:49 PM
    Author     : avibhullar
--%>

<%@page import="UWRideshare.services.ManageProfileServices"%>
<%@page import="UWRideshare.beans.DriverBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Driver Panel</title>
	
	<link rel="stylesheet" href="css/theme-yellow.css" />
	<link rel="stylesheet" href="css/style.css"  />
	<link rel="stylesheet" href="css/animate.css" />	
	<link rel ="stylesheet" href = "css/jquery-ui.css"/>
	<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
	<link rel= "stylesheet" href = "modal.css">
	
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700|Montserrat:400,700">
	

  </head>
  
  <body>
      <%
            if(session!=null)
            {
                int userid=(int)session.getAttribute("userid");
               DriverBean objbean=ManageProfileServices.getDashboard(userid);
        %>
    <!-- Header -->
	<header class="header" role="banner">
		<div class="wrap">
			<!-- Logo -->
			<div class="logo">
					<a href="Home.jsp" title="Transfers"><img src="logos/uwlogo.png" width = "40px" height = "40px"alt="Transfers" />UWRideshare</a>
				</div>
			<!-- //Logo -->
			
			<!-- Main Nav -->
			<nav role="navigation" class="main-nav">
				<ul>
					<li><a href="Home.jsp" title="">Home</a></li>		
					
					
				</ul>
			</nav>
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
					<h1>Welcome, </h1>
					<nav role="navigation" class="breadcrumbs">
						<ul>
							<li><a href="Home.jsp" title="Home">Home</a></li>
							<li>Driver Panel</li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<!-- //Page info -->
		
		
		<div class="wrap">
			<div class="row">				
				<!--- Content -->
				
					<div id="myModal" class = "modal">
					<form  action="addride" method="post" id="form1">
						<div class = "modal-content" >
                                                    
                                                        
								<div  class = "modal-header" style= "text-align:center;">
                                                                    <%if (request.getParameter("msg")!=null) {
                                                                                if (request.getParameter("msg").equals("success"))
                                                                                out.println("<label>Ride Added Successfully</label>");
                                                                                else
                                                                                    out.println("<label >Error while adding a ride</label>");
                                                                            }
                                                                        else
                                                                         {

                                                                         }
                                                                        %>
								 <span class="close">&times;</span>
									<h3 style ="padding-top:10px;">PLEASE FILL IN THE RIDE DETAILS</h3>
								</div>								
							<div class="modal-body">
							<br>
							<label>Departure Date</label>
									<input type="text" name="textdate" id="textdate" required />
							<br>
							
							<label>Departure Time</label>
							<select name="texttime" required>
								<option></option>
								<option value= "5:00:00">5:00</option>
								<option value= "6:00:00">6:00</option>
								<option value= "7:00:00">7:00</option>
								<option value= "8:00:00">8:00</option>
								<option value= "9:00:00">9:00</option>
								<option value= "10:00:00">10:00</option>
								<option value= "11:00:00">11:00</option>
								<option value= "12:00:00">12:00</option>
								<option value= "13:00:00">13:00</option>
								<option value= "14:00:00">14:00</option>
								<option value= "15:00:00">15:00</option>
								<option value= "16:00:00">16:00</option>
								<option value= "17:00:00">17:00</option>
								<option value= "18:00:00">18:00</option>
								<option value= "19:00:00">19:00</option>
								<option value= "20:00:00">20:00</option>	
							</select>
							<br>							
							<br>
							<label>From</label>
                                                        <select name="textsource" id="textsource" required>
										<option selected>&nbsp;</option>								
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
									<br>
									<br>
										<label> TO (Destination)</label>
										<select name="textdestination" required>
										<option selected>&nbsp;</option>
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
										<br>
										<br>									
									<label>Select the first stop</label>
									<select id = "stop1"  name="stop1">
										<option selected>None</option>
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
                                                                        <label>Select the second stop </label>
										<select id = "stop2" name="stop2">
										<option selected>None</option>
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
										
										<label>Select the third stop </label>
										<select id = "stop3" name="stop3">
										<option selected>None</option>
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
										
									<br>	
									<br>
                                                                        <label>Number of seats available</label>
									<input type = "number" id = "textseats" name="textseats" required />
									<br>
									<label>Type of car </label>
									<input type = "text" id = "textcartype" name="textcartype" required />
									<br>
										<label>Amount (CAD)/Stop</label>
										<input type = "number" name="textcost" id="textcost" placeholder="COST(between two adjacent stops)" required/>
								
							</div>	
							
									
							<div class="modal-footer">
							<input type="submit" class = "btn medium" style= "margin-left:37%;"	/>
							</div>
                                                    
							</div>
						</form>
						
					</div> 
					<div id="myModal1" class = "modal">
					
						<div class = "modal-content" >
                                                   
								<div  class = "modal-header" style= "text-align:center;">
								 <span class="close">&times;</span>
									<h3 style ="padding-top:10px;">PROFILE DETAILS</h3>
								</div>			
								<div class="modal-body">
								<label>Your Email</label>
								<input type = "email" readonly value="<%= objbean.getEmail() %>"/>
								<br>
								<label> Your Full name </label>
								<input type = "text" readonly value="<%= objbean.getName()%>"/>
								<br>
								<label> Your Phone number</label>
								<input type = "number" readonly value="<%= objbean.getContact()%>" />
							<div class="modal-footer">
							
							</div>
								
						</div>
						</div>
						
					</div>
					<div id="myModal2" class = "modal">
                                            <form action="editprofile" method="post" id="form2">
						<div class = "modal-content" >
								<div  class = "modal-header" style= "text-align:center;">
								 <span class="close">&times;</span>
									<h3 style ="padding-top:10px;">EDIT PROFILE DETAILS</h3>
								</div>			
								<div class="modal-body">
								<label>Your Email</label>
								<input type = "email" readonly value="<%= objbean.getEmail() %>" />
								<br>
								<label> Your Full name </label>
								<input type = "text"  name="textname" value="<%= objbean.getName()%>" required/>
								<br>
								<label> Your Phone number</label>
								<input type = "text" name="textcontact" id="textcontact" value="<%=objbean.getContact() %>" required/>
								
							<div class="modal-footer">
							<input type="submit" class = "btn medium" style= "margin-left:37%;" value = "Save Updates"	/>
							</div>
								
						</div>
						</div>
                                            </form>
						
					</div>
				<div id="myModal3" class = "modal">
					
						<div class = "modal-content" >
								<div  class = "modal-header" style= "text-align:center;">
								 <span class="close">&times;</span>
									<h3 style ="padding-top:10px;">CHANGE PASSWORD</h3>
								</div>			
								<div class="modal-body">
								<form action="changepassword" onsubmit="return validateForm()" method="post" id="form3">
								<%
                                                            if (request.getParameter("msg") != null) {
                                                                if (request.getParameter("msg").equals("Missmatch")) {
                                                                %>
                                                                <label>You Entered Invalid Old Password</label>
                                                                <%
                                                                } else {
                                                                %>
                                                                <label>There Was An Error While Changing The Password...Try Again!!</label>
                                                                <%
                                                                        }
                                                                    }

                                                                %>
                                                                    <label>Your Previous Password</label>
								<input type="password" name="textoldpassword" id="textoldpassword" placeholder="Old Password" required />
								<br>
								<label> Your New Password</label>
								<input type="password" name="textnewpassword" id="textnewpassword" placeholder="New Password" required />
								<br>
								<label> Repeat New Password</label>
								<input type="password" name="textconfirmpassword" id="textconfirmpassword" placeholder="Confirm Password" required />
								
							<div class="modal-footer">
							<input type="submit" class = "btn medium" style= "margin-left:37%;" value = "Save Updates"	/>
							</div>
							</form>
                                                                    <script>
                                                            function validateForm()
                                                            {
                                                                var newpwd = document.getElementById("textnewpassword").value.trim();
                                                                var conpwd = document.getElementById("textconfirmpassword").value.trim();
                                                                if (newpwd != conpwd)
                                                                {
                                                                    window.alert("Confirm Password Correctly!!!");
                                                                    document.getElementById("textconfirmpassword").focus();
                                                                    return false;
                                                                }
                                                                return true;
                                                            }
                                                        </script>
						</div>
						</div>
						
					</div>	
					
				<div class="three-fourth content">
                                    <div  style = "padding-top:1px;"id="map" class = "gmap1"></div>
				</div>
				<!--- //Content -->
				
				<!--- Sidebar -->
				<aside class="one-fourth sidebar right">
					<!-- Widget -->
					<div class="widget">
						<ul class="categories">
							<li class="active"><a>Hey, Would you like to?</a></li>
							<li><a id = "myBtn" style="cursor: pointer;">Offer a Ride</a></li>
							<li><a id = "myBtn1" style = "cursor:pointer;">View Profile</a></li>
							<li><a id = "myBtn2" style = "cursor:pointer;">Edit Profile</a></li>
							<li><a id = "myBtn3" style = "cursor:pointer;">Change Password</a></li>
                                                        <li><a href="ViewPrevRides.jsp" style = "cursor:pointer;">View Previous Rides</a></li>
							<li><a href="logout" style = "cursor:pointer;">Logout</a></li>
							
						</ul>
					</div>
					<!-- //Widget -->
					
					<!-- Widget -->
					
					<!-- //Widget -->
					
					<!-- Widget -->
					
					<!-- //Widget -->
					
					<!-- Widget -->
					<div class="widget">
						<h4>Having any issues?</h4>
						<div class="textwidget">
							<p>Call our customer services team on the number below to speak to one of our advisors who will help you with all of your needs.</p>
							<p class="contact-data"><span class="ico phone black"></span> 519 781 3561</p>
						</div>
					</div>
					<!-- //Widget -->
				</aside>
				<!--- //Sidebar -->
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
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src = "js/jquery.js"></script>
	<script src = "js/jquery-ui.js"></script>
	<script type = "text/javascript">
	
// Get the modal
var modal = document.getElementById('myModal');
var modal1 = document.getElementById('myModal1');
var modal2 = document.getElementById('myModal2');
var modal3 = document.getElementById('myModal3');
// Get the button that opens the modal
var btn = document.getElementById('myBtn');
var btn1 = document.getElementById('myBtn1');
var btn2 = document.getElementById('myBtn2');
var btn3 = document.getElementById('myBtn3');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
var span1 = document.getElementsByClassName("close")[1];
var span2 = document.getElementsByClassName("close")[2];
var span3 = document.getElementsByClassName("close")[3];

// When the user clicks the button, open the modal 
btn.onclick = function() {
modal.style.display = "block";
}
btn1.onclick = function() {
modal1.style.display = "block";
}
btn2.onclick = function() {
modal2.style.display = "block";
}
btn3.onclick = function () {
modal3.style.display = "block";
}
// When the user clicks on <span> (x), close the modal
span.onclick = function() {  
modal.style.display = "none";	
}
span1.onclick = function() {
modal1.style.display = "none";
}
span2.onclick = function () {
modal2.style.display = "none"; 
}
span3.onclick = function () {
modal3.style.display = "none"; 
}
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "block";
    }
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "block";
    }
}
</script>

<script type="text/javascript">

 $( "#textdate" ).datepicker({minDate: 0});
</script>

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
<script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 17
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNutTcDKVXE8OwFLN3idpuqZq7Vo3RTDI&callback=initMap">
    </script>
<%
             }
             else
             {
        %>
        <h4>Your Session Expired....Please Login Again!! </h4>
        
        <%        
             }
        %>
  </body>
</html>