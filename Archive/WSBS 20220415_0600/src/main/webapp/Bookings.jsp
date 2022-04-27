<%@page import="java.util.Iterator"%>
<%@page import="bitshyd.dbmsproject.web.model.WorkSpaceBooking"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Customer")){
	response.sendRedirect("Error.jsp");
	return;
}
	ArrayList<WorkSpaceBooking> arrFutureBookings=(ArrayList<WorkSpaceBooking>) request.getAttribute("modelFutureBookings");
	ArrayList<WorkSpaceBooking> arrRunningBookings=(ArrayList<WorkSpaceBooking>) request.getAttribute("modelRunningBookings");
	ArrayList<WorkSpaceBooking> arrPastBookings=(ArrayList<WorkSpaceBooking>) request.getAttribute("modelPastBookings");
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
<title>Bookings</title>
<style>
body {
	background: #74ebd5; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ACB6E5, #74ebd5);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	font-family: 'Roboto Condensed', sans-serif;
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
</style>


</head>

<body>
	<div class="dash">
		<%@ include file="CustomerSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<main class="dash-content">
				<form id="frmBookings" name="frmBookings" method="post"
					action="Bookings">

					<!-- 	BookingId, CustomerId, CustomerFirstName, CustomerLastName, WorkSpaceId, LocationId, LocationName, WorkSpaceName, StaffId, 
		StaffFirstName, StaffLastName, ModelId, Model, CarRegistrationNumber, CheckinTime, CheckoutTime, ChargedAmount, RefundAmount, 
		MinutesToCheckinFromNow, BookingstatusId, Bookingstatus, IsProcessed, BookedTime, FeedbackKey, 
		FeedbackId, OverallRating, RatingOnStaff, FeedbackText, FeedbackTime
 -->
					<h4>Running Bookings</h4>
					<% if (arrRunningBookings==null || arrRunningBookings.isEmpty()){%>
					<p align="center">No Running Bookings at this time</p>
					<%}else {%>
					<table class="table table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>Booking Id</th>
								<th>Location</th>
								<th>Work Space Name</th>
								<th>Checkin Time</th>
								<th>Checkout Time</th>
							</tr>
						</thead>
						<%for (Iterator<WorkSpaceBooking> i=arrRunningBookings.iterator(); i.hasNext();){
								WorkSpaceBooking objBooking = i.next();%>
						<tr>
							<td style="color: black; font-weight: bold;"><%=objBooking.getBookingId()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getLocationName()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getWorkSpaceName()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getCheckinTime().toString()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getCheckoutTime().toString()%></td>
						</tr>
						<%}%>
					</table>
					<%}%>
					<br />
					<br />
					<h4>Future Bookings</h4>
					<% if (arrFutureBookings == null || arrFutureBookings.isEmpty()){%>
					<p align="center">No Future Bookings at this time</p>
					<%}else {%>
					<table class="table table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>Booking Id</th>
								<th>Location</th>
								<th>Work Space Name</th>
								<th>Checkin Time</th>
								<th>Checkout Time</th>
								<th>Actions</th>

							</tr>
						</thead>
						<%for (Iterator<WorkSpaceBooking> i=arrFutureBookings.iterator(); i.hasNext();){
								WorkSpaceBooking objBooking = i.next();%>
						<tr>
							<td style="color: black; font-weight: bold;"><%=objBooking.getBookingId()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getLocationName()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getWorkSpaceName()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getCheckinTime().toString()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getCheckoutTime().toString()%></td>
							<td style="color: black; font-weight: bold;"><a
								href="javascript:onCancel(<%=objBooking.getBookingId()%>, <%=objBooking.getMinutesToCheckinFromNow()%>)">
									Cancel<% if(objBooking.getMinutesToCheckinFromNow()<60) {%> with
									zero refund<%}%>
							</a> &nbsp;&nbsp; <%if (objBooking.getMinutesToCheckinFromNow()>120) {%>
								<a href="javascript:onModify(<%=objBooking.getBookingId()%>)">Modify</a>
								<%}%></td>
						</tr>
						<% }%>
					</table>
					<%}%>

					<br />
					<br />
					<h4>Booking History</h4>
					<% if (arrPastBookings == null || arrPastBookings.isEmpty()){%>
					<p align="center">No Booking History at this time</p>
					<%}else {%>
					<table class="table table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>Booking Id</th>
								<th>Location</th>
								<th>Work Space Name</th>
								<th>Checkin Time</th>
								<th>Checkout Time</th>
								<th>Booking Status</th>
								<th>Amount</th>
								<th>Process Status</th>
								<th>Feedback</th>
							</tr>
						</thead>
						<%for (Iterator<WorkSpaceBooking> i=arrPastBookings.iterator(); i.hasNext();){
								WorkSpaceBooking objBooking = i.next();%>
						<tr>
							<td style="color: black; font-weight: bold;"><%=objBooking.getBookingId()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getLocationName()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getWorkSpaceName()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getCheckinTime().toString()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getCheckoutTime().toString()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getBookingstatus()%></td>
							<td style="color: black; font-weight: bold;"><%=(objBooking.getChargedAmount()-objBooking.getRefundAmount())%></td>
							<td style="color: black; font-weight: bold;"><%=(objBooking.getIsProcessed()>0 ? "Processed": "Pending")%></td>
							<td>
								<% if (objBooking.getIsProcessed()>0 && objBooking.getFeedbackId()==0) {%>
								<a href="javascript:feedback(<%=objBooking.getBookingId()%>)">Feedback</a>
								<%} %>
							</td>
						</tr>
						<% }%>
					</table>
					<%}%>
					<input type="hidden" id="actionType" name="actionType" value="" />
					<input type="hidden" id="id" name="id" value="0" /> <input
						type="hidden" id="mts" name="mts" value="0" />
				</form>
			</main>
		</div>

	</div>
	<script type="text/javascript">
	function feedback(id){
		document.getElementById("actionType").value="feedback";
		document.getElementById("id").value=id;
		document.getElementById("frmBookings").submit();
		return false;		
	}
	function onCancel(id, mts){
		document.getElementById("actionType").value="cancel";
		document.getElementById("id").value=id;
		document.getElementById("mts").value=mts;
		document.getElementById("frmBookings").submit();
		return false;		
	}
	
	function onModify(id){
		document.getElementById("actionType").value="modify";
		document.getElementById("id").value=id;
		document.getElementById("frmBookings").submit();
		return false;		
	}
	
	
	</script>
	<%@ include file="Footer.jsp"%>
</body>
</html>