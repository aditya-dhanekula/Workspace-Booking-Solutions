<%@page import="bitshyd.dbmsproject.web.model.WorkSpaceBooking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<%
boolean isLoggedIn= false; 
if (session.getAttribute("UserID") != null && session.getAttribute("UserRole").toString().equalsIgnoreCase("Customer")){
	isLoggedIn= true;
}
WorkSpaceBooking objBooking=(WorkSpaceBooking) request.getAttribute("model"); 
%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/spur.css">
<title>Customer Feedback</title>
<link rel="stylesheet" href="assets/css/feedbackformstyles.css">

<style>
body {
	background: #74ebd5; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ACB6E5, #74ebd5);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

.dash-toolbar {
	background: black;
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	Chrome
	10-25,
	Safari
	5.1-6
	background
	:
	linear-gradient(
	to
	right
	,
	#ACB6E5
	,
	#74ebd5
	);
	/* z-index: -1;*/
}

.dash-content {
	padding: 0px;
}

.button {
	width: 120px;
	height: 40px;
	cursor: pointer;
	font-size: 20px;
	font-weight: bold;
	color: black;
	background: #CFE2F7;
	border: 2px solid black;
	box-shadow: 5px 5px 0 black, -5px -5px 0 black, -5px 5px 0 black, 5px
		-5px 0 black;
	transition: 500ms ease-in-out;
}

.button:hover {
	background-color: #CD6298;
	box-shadow: 20px 5px 0 black, -20px -5px 0 black;
}

.button:focus {
	outline: none;
}
</style>
</head>

<body>
	<div class="dash">
		<% if (isLoggedIn){ %>
			<%@ include file="CustomerSideMenu.jsp"%>
		<%} %>
		<div class="dash-app">
		<%if (isLoggedIn) {%>
			<%@ include file="Topbar.jsp"%>
		<%} %>
			<main class="dash-content">
				<br>
				<h2 class="display-4" style="text-align: center; color: black; font-weight: bold;">CUSTOMER FEEDBACK</h2>
				<div class="container-fluid">
					<%if (objBooking.getFeedbackId()>0) {%>
					<p align="center">
						Thank you for submitting the Feedback. This helps us to improve our services. <br /> 
						<%if (isLoggedIn) { %>
						<a href="Bookings"> click here to go back to Bookings </a>
						<%} else {%>
						You can close the browser window.
						<%} %>
					<%} else {%>

					 <div class="feedback">
						<p>
							Dear Customer,<br> Thank you for using our services. We would like to know how we performed. 
							Please spare some moments to give us your valuable feedback as it will help us in improving
							our service.
						</p>

						<form id="frmFeeback" name="frmfeedback" method="post" action="Bookings">
							<label>1. Your experience with our Service?</label><br> 
							<span class="star-rating"> 
								<input type="radio" name="servicerating" value="1"><i></i> 
								<input type="radio" name="servicerating" value="2"><i></i> 
								<input type="radio" name="servicerating" value="3"><i></i> 
								<input type="radio" name="servicerating" value="4"><i></i> 
								<input type="radio" name="servicerating" value="5"><i></i>
							</span>
							<div class="clear"></div>
							<hr class="survey-hr">
							<label>2. Friendliness and courtesy shown to you by our Staff</label><br> 
							<span class="star-rating"> 
								<input type="radio" name="staffrating" value="1"><i></i>
								<input type="radio" name="staffrating" value="2"><i></i>
								<input type="radio" name="staffrating" value="3"><i></i>
								<input type="radio" name="staffrating" value="4"><i></i>
								<input type="radio" name="staffrating" value="5"><i></i>
							</span>
							<div class="clear"></div>
							<hr class="survey-hr">
							<label for="m_3189847521540640526commentText">
							3. Any Other suggestions:</label><br /> <br />
							<textarea cols="55" name="commentText" rows="3" style=""></textarea>
							<br> <br>
							<div class="clear"></div>
							<div align="center">
								<input type="submit" id="btnSubmit" name="btnSubmit" class="button" value="Submit">
							</div>
							<input type="hidden" id="actionType" name="actionType" value="cstfeedback" /> 
							<input type="hidden" id="id" name="id" value="<%=objBooking.getBookingId()%>" />
						</form>
					</div>
					<%} %>
				</div>
			</main>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>