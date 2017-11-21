<%-- 
    Document   : ChangePassword
    Created on : Nov 6, 2017, 11:10:51 PM
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
	
		<!-- //Page info -->
		
		<div class="wrap">
			<div class="row">
				<!--- Content -->
				<div class="content one-half modal">
					<!--Login-->
					<div class="box">
						<form action="changepassword" onsubmit="return validateForm()" method="post" id="form">
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
                                                    <div class="f-row">
								<div class="full-width">
									<label for="password">Your Old Password</label>
									<input type="password" name="textoldpassword" id="textoldpassword" placeholder="Old Password" required />
								</div>
								
							</div>
							<div class="f-row">
								<div class="full-width">
									<label for="password">Your New Password</label>
									<input type="password" name="textnewpassword" id="textnewpassword" placeholder="New Password" required />
								</div>
								
							</div>
							<div class="f-row">
								<div class="full-width">
									<label for="password">Confirm New Password</label>
									<input type="password" name="textconfirmpassword" id="textconfirmpassword" placeholder="Confirm Password" required />
								</div>
								
							</div>
							
							
								
							
							<div class="f-row">
								<div class="full-width">
									<input type="submit" value="Update Account Password" class="btn color medium full" />
								</div>
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
					<!--//Login-->
				</div>
				<!--- //Content -->
			</div>
		</div>
	</main>
	<!-- //Main -->
	
	<!-- Footer -->
	
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

