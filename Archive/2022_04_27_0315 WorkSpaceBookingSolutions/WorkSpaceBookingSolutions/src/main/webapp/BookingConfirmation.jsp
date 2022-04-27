<%@page import="javax.management.MalformedObjectNameException"%>
<%@page import="bitshyd.dbmsproject.web.model.Service"%>
<%@page import="java.util.Iterator"%>
<%@page import="bitshyd.dbmsproject.web.model.NewBooking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% 
// if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null 
// 	|| !session.getAttribute("UserRole").toString().equalsIgnoreCase("Customer")){
// 	response.sendRedirect("Error.jsp"); 
//}
	NewBooking objBooking= (NewBooking) request.getAttribute("model");
%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/spur.css">
<link rel="stylesheet" href="assets/css/profile1.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">
<link rel="stylesheet" href="assets/css/bookconfo.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Booking Confirmation</title>
<style>
body {
	background: #4AC29A; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #BDFFF3, #4AC29A);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #BDFFF3, #4AC29A);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

.card-body {
	margin-left: 100px;
}

.card, .spur-card {
	align-content: center;
	align-items: center;
	justify-content: center;
	background: #d9a7c7; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #fffcdc, #d9a7c7);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #fffcdc, #d9a7c7);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: 0;
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

.card-header {
	background: #a8c0ff; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3f2b96, #a8c0ff);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3f2b96, #a8c0ff);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	color: black;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: left;
}

td {
	font-size: 1.5em;
}

.num {
	height: 24px;
	width: 24px;
	border-radius: 50%;
	border: 2px solid #40b3ff;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	margin-right: 12px;
	font-size: 12px;
}

.type:hover {
	transform: scale(1.2);
}

.title {
	display: flex;
	flex-direction: row;
	align-items: center;
}
</style>
</head>
<body style="width: 100%">

	<div class="dash">
		<%@ include file="CustomerSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<main class="dash-content"></main>

			<form id="frmbookingconfirm" name="frmbookingconfirm"
				action="NewBooking" method="post">
				<div id="divsearchinfo" align="center">
					<%if (objBooking.getActionType().equalsIgnoreCase("Pay")) {%>
					<h2>
						Your booking is confirmed with the below details.<br>
						<br> Your Booking Id:
						<%=objBooking.getBooking().getBookingId()%>.<br>
					</h2>
					<br>
					<h3>A confirmation Email with the booking details has been
						sent to your registered Email Id</h3>
					<br>
					<%} else { %>
					<h2 class="display-4"
						style="text-align: center; color: black; font-weight: bold;">Work Space
						Booking Confirmation</h2>
					<br>
					<%} %>
					<table class="table table-hover">
						<tr>
						<thead class="thead-dark">
							<th><label for="splocation">Location</label></th>
							<td class="table-light"><span name="splocation"
								class="UserData"><%=objBooking.getLocationName()%></span> <input
								type="hidden" name="location"
								value="<%=objBooking.getLocationId()%>" /></td>
							<th><label for="spSpace">Work Space Name (Hourly Price)</label></th>
							<td class="table-light"><span name="space" class="UserData"><%=objBooking.getBooking().getWorkSpaceName()%>
							 (Rs.<%=objBooking.getBooking().getHourlyWorkSpacePrice()%>) 
							</span>
								<input type="hidden" name="id"
								value="<%=objBooking.getBooking().getWorkSpaceId()%>" /></td>
						</thead>
						</tr>
						<tr>
						<thead class="thead-dark">
							<th><label for="spcheckin">Check in</label></th>
							<td class="table-light"><span name="spcheckin"
								class="UserData"><%=objBooking.getCheckin().replace('T', ' ')%></span> <input
								type="hidden" name="checkin"
								value="<%=objBooking.getCheckin()%>" /></td>
							<th><label for="spcheckout">Check out</label></th>
							<td class="table-light"><span name=spcheckout
								" class="UserData"><%=objBooking.getCheckout().replace('T', ' ')%></span> <input
								type="hidden" name="checkout"
								value="<%=objBooking.getCheckout()%>"></td>
						</thead>
						</tr>
						<tr>
						<thead class="thead-dark">
							<th><label for="spaceprice">Work Space Cost</label></th>
							<td class="table-light" style="text-align: center;">
									Rs.<%=objBooking.getBooking().getChargedAmount()%></td>
							<th><Label> Opted Services</Label></th>
							<td class="table-light">
								<% if (objBooking.getArrOptedServices() != null && !objBooking.getArrOptedServices().isEmpty()) {%>
								<ol>
									<% for (Iterator<Service> i = objBooking.getArrOptedServices().iterator();i.hasNext(); ){
	        								Service objService=i.next();%>
									<li><%=objService.getServiceName()%>&nbsp;(Rs.<%=objService.getServicePrice()%>  <%=objService.getUnitType()%>)</li>
									<%}%>
								</ol> <%}%> <input type="hidden" name="OptedServices"
								value="<%=objBooking.getOptedServices()%>" />
							</td>
						</thead>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;" class="table-warning">
							<span
								class="PayInfo">Payment for the booking  </span>
								 Rs.<b><%=objBooking.getBooking().getChargedAmount()%></b></td>
						</tr>
					</table>
				</div>
				<%if (objBooking.getActionType().equalsIgnoreCase("Pay") == false ) {%>
				<article class="card">


					<div class="container" align="center">
						<div class="card-body">
							<div class="payment-type">

								<h2 style="">Choose payment method below</h2>
								<br>
								<div class="types flex justify-space-between">
									<div class="type">
										<div class="logo">
											<a href="#" onclick="openCard()"> <i
												class="far fa-credit-card"></i></a>
										</div>
										<div class="text">
											<a href="#" onclick="openCard()">
												<p>Pay with Credit Card</p>
											</a>
										</div>
									</div>
									<div class="type selected">
										<div class="logo">
											<a href="#" onclick="openWallet()"> <i
												class="fab fa-paypal"></i></a>
										</div>
										<div class="text">
											<a href="#" onclick="openWallet()">
												<p>Pay with Wallet</p>
											</a>
										</div>
									</div>
									<div class="type">
										<div class="logo">
											<i class="fab fa-amazon"></i>
										</div>
										<div class="text">
											<p>Pay with Amazon</p>
										</div>
									</div>
								</div>
							</div>
							<br>
							<br>

							<div class="payment-info flex justify-space-between"
								style="display: block;" " id="myWallet">
								<div class="column billing" align="center">
									<div class="title">
										<div class="num">1</div>
										<h3>Booking Details</h3>
										<br>
									</div>
									<div class="field full">
										<label for="fullname" style="font-size: 1.1em;">Booking
											Name</label> <input type="text" id="fullname" name="fullname"
											style="text-align: center; max-width: 100%; font-size: 1.5em;"
											value="<%=objBooking.getCustomer().getFirstName() + "  " + objBooking.getCustomer().getLastName()%>" />
									</div>

									<div class="field full">
										<label for="WorkSpace" style="font-size: 1.1em;">Booked
											WorkSpace Space</label> <input type="text" id="WorkSpace"
											style="text-align: center; max-width: 8 0%; font-size: 1.5em;"
											name="WorkSpace" readonly
											value="<%=objBooking.getBooking().getWorkSpaceName()%>">
									</div>
								</div>
							</div>
							<br>

							<div class="payment-info flex justify-space-between"
								style="display: block;" " id="myWallet">
								<div class="column shipping" align="center">
									<div class="title">
										<div class="num">2</div>
										<h3>Pay from Wallet</h3>
										<br>
									</div>
									<div class="field full">
										<label for="balance" style="font-size: 1.1em;">Wallet
											Balance</label> <input type="text" id="balance" name="balance"
											style="text-align: center; font-size: 1.5em;"
											value="<%=objBooking.getCustomer().getWalletAmount()%>"
											readonly>
									</div>

									<div class="field full">
										<label for="payamount" style="font-size: 1.1em;">Amount
											to pay</label> <input type="text" id="payamount" name="payamount"
											style="text-align: center; font-size: 1.5em;" value="<%=objBooking.getBooking().getChargedAmount()%>"
											readonly>
									</div>
								</div>
							</div>

							<div class="payment-info flex justify-space-between" id="myCard">
								<div class="column shipping">
									<div class="title">
										<div class="num">2</div>
										<h4>Credit Card Info</h4>
									</div>
									<div class="field full">
										<label for="name">Card holder Name</label> <input id="name"
											type="text" placeholder="Full Name">
									</div>
									<div class="field full">
										<label for="address">Card Number</label> <input id="address"
											type="text" placeholder="1234-5678-9012-3456">
									</div>
									<div class="flex justify-space-between">
										<div class="field half">
											<label for="city">Exp. Month</label> <input id="city"
												type="text" placeholder="MM">
										</div>
										<div class="field half">
											<label for="state">Exp. Year</label> <input id="state"
												type="text" placeholder="yy">
										</div>
									</div>
									<div class="field full">
										<label for="zip">CVV Number</label> <input id="zip"
											type="text" placeholder="468">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="submiterror" align="center" style="color: red;"></div>
					<br />
					<div class="card-actions flex justify-space-between" align="center">
						&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
						&nbsp;&nbsp; &nbsp;
						<div class="flex-start" align="center">
							<button class="button button-primary" onclick="onCancelClick()"
								style="font-size: 1.3em;">Cancel</button>
						</div>
						&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
						<div class="flex-end" align="center">

							<button id="btnPay" name="btnPay" class="button button-primary"
								onclick="javascript:return form_submit()"
								style="font-size: 1.3em;">Pay Now</button>
						</div>
					</div>
				</article>
				<%} %>
				<input type="hidden" id="actionType" name="actionType" value="Pay" />
			</form>
		</div>
	</div>
	<script>
function onCancelClick() {
  	document.getElementById("actionType").value="Search";
  	document.getElementById("frmbookingconfirm").submit();
	return false;
}
function form_submit(){
	<%if (objBooking.getCustomer().getWalletAmount()< objBooking.getBooking().getChargedAmount())  {%>
		document.getElementById("submiterror").innerHTML = " No sufficient balance in the wallet to proceed ";
		return false;
	<%}%>
	
	document.getElementById("actionType").value="Pay";
  	document.getElementById("frmbookingconfirm").submit();
	return false;
}
</script>
	<script>
  document.getElementById("myCard").style.display = "none";

function openCard(){
  document.getElementById("myCard").style.display = "block";
  document.getElementById("myWallet").style.display = "none";
}

function openWallet(){
  document.getElementById("myWallet").style.display = "block";
  document.getElementById("myCard").style.display = "none";
}
</script>


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
	<script src="assets/js/spur.js"></script>

</body>
</html>