<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Customer")){
	response.sendRedirect("Error.jsp");
}
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
<link rel="stylesheet" href="assets/css/profile1.css">
<link rel="stylesheet" href="assets/css/spur.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Customer Dashboard</title>
<style>
body {
	background: black; /* fallback for old browsers */
	font-family: 'Roboto Condensed', sans-serif;
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

.card-body {
	margin-left: 100px;
}

.card, .spur-card {
	align-content: center;
	align-items: center;
	justify-content: center;
	/*margin-right: -200px;*/
	background: #74ebd5; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ACB6E5, #74ebd5);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: 0;
}

.card-header {
	background: #a8c0ff; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3f2b96, #a8c0ff);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3f2b96, #a8c0ff);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	color: whitesmoke;
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

.container {
	top: 0;
	bottom: 0;
	overflow: none;
}
</style>
</head>

<body>
	<div class="dash">
		<%@ include file="CustomerSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<br>
			<div class="container">
				<!-- <h2>Welcome !</h2> -->
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>

					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<a href="NewBooking"> <img src="images/services.png"
								alt="booknow" style="width: 100%;">
							</a>
						</div>

						<div class="item">
							<a href="Wallet"> <img src="images/services2.png"
								alt="wallet" style="width: 100%;"></a>
						</div>

						<div class="item">
							<a href="BookingHistory"> <img
								src="images/bookinghistory.png" alt="bookinghistory"
								style="width: 100%;"></a>
						</div>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>









	<%@ include file="Footer.jsp"%>
</body>
</html>