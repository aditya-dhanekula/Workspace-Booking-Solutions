<%@page import="java.util.Iterator"%>
<%@page import="bitshyd.dbmsproject.web.model.WorkSpaceBooking"%>
<%@page import="bitshyd.dbmsproject.web.model.Service"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null){
	response.sendRedirect("Error.jsp");
	return;
}

String userRole=session.getAttribute("UserRole").toString();
	ArrayList<WorkSpaceBooking> arrFutureBookings=(ArrayList<WorkSpaceBooking>) request.getAttribute("modelFutureBookings");
	ArrayList<WorkSpaceBooking> arrRunningBookings=(ArrayList<WorkSpaceBooking>) request.getAttribute("modelRunningBookings");
	ArrayList<WorkSpaceBooking> arrPastBookings=(ArrayList<WorkSpaceBooking>) request.getAttribute("modelPastBookings");
%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="assets/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700"
	rel="stylesheet">	
<link rel="stylesheet" href="assets/css/spur.css">
<link rel="stylesheet" href="assets/css/profile1.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">
<title>Bookings</title>
<style>
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
}
</style>

</head>

<body>
	<div class="dash">
	<%if (userRole.equalsIgnoreCase("Admin")) {%>
		<%@ include file="AdminSideMenu.jsp"%>
	<%}
	else if (userRole.equalsIgnoreCase("Staff")) {%> 
		<%@ include file="StaffSideMenu.jsp"%>
	<%} else {%>
		<%@ include file="CustomerSideMenu.jsp"%>
	<%}%>
		
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<h2 class="display-4"
					style="text-align: center; color: black; font-weight: bold;">Bookings</h2>
			<br/>
			<div style="align-content: center;"></div>
				<form id="frmBookings" name="frmBookings" method="post"
					action="Bookings">
					<h4>Running Bookings</h4>
					<% if (arrRunningBookings==null || arrRunningBookings.isEmpty()){%>
					<p align="center">No Running Bookings at this time</p>
					<%}else {%>
					<table class="table table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>Booking Id</th>
								<%if (userRole.equalsIgnoreCase("Admin") || userRole.equalsIgnoreCase("Staff")) {%>
								<th>Customer Name</th>
								<%} %>
								<th>Location</th>
								<th>Work Space Name</th>
								<th>Services</th>
								<th>Checkin Time</th>
								<th>Checkout Time</th>
								<th>Amount Paid</th>
							</tr>
						</thead>
						<%for (Iterator<WorkSpaceBooking> i=arrRunningBookings.iterator(); i.hasNext();){
								WorkSpaceBooking objBooking = i.next();%>
						<tr>
							<td style="color: black; font-weight: bold;"><%=objBooking.getBookingId()%></td>
							<%if (userRole.equalsIgnoreCase("Admin") || userRole.equalsIgnoreCase("Staff")) {%>
								<td style="color: black; font-weight: bold;">
									<%=objBooking.getCustomerFirstName()%> &nbsp;<%=objBooking.getCustomerLastName()%>
								</td>
								<%} %>
							<td style="color: black; font-weight: bold;"><%=objBooking.getLocationName()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getWorkSpaceName()%></td>
							<td style="color: black; font-weight: bold;">
								<% if (objBooking.getArrServices() != null && !objBooking.getArrServices().isEmpty()) {%>
									<ol>
										<% for (Iterator<Service> si = objBooking.getArrServices().iterator();si.hasNext(); ){
		        								Service objService=si.next(); %>
									<li><%=objService.getServiceName()%>&nbsp;(Rs.<%=objService.getServicePrice()%>  <%=objService.getUnitType()%>)</li>
									<%}%>
									</ol> <%}%> 
							</td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getStrCheckinTime()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getStrCheckoutTime()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getChargedAmount()%></td>
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
								<%if (userRole.equalsIgnoreCase("Admin") || userRole.equalsIgnoreCase("Staff")) {%>
								<th>Customer Name</th>
								<%} %>
								<th>Location</th>
								<th>Work Space Name</th>
								<th>Services</th>
								<th>Checkin Time</th>
								<th>Checkout Time</th>
								<th>Amount Paid</th>
								<% if (userRole.equalsIgnoreCase("Customer")) {%>
								<th>Actions</th>
								<%} %>
							</tr>
						</thead>
						<%for (Iterator<WorkSpaceBooking> i=arrFutureBookings.iterator(); i.hasNext();){
								WorkSpaceBooking objBooking = i.next();%>
						<tr>
							<td style="color: black; font-weight: bold;"><%=objBooking.getBookingId()%></td>
							<%if (userRole.equalsIgnoreCase("Admin") || userRole.equalsIgnoreCase("Staff")) {%>
								<td style="color: black; font-weight: bold;">
									<%=objBooking.getCustomerFirstName()%> &nbsp;<%=objBooking.getCustomerLastName()%>
								</td>
								<%} %>
							<td style="color: black; font-weight: bold;"><%=objBooking.getLocationName()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getWorkSpaceName()%></td>
							<td style="color: black; font-weight: bold;">
							<% if (objBooking.getArrServices() != null && !objBooking.getArrServices().isEmpty()) {%>
								<ol>
									<% for (Iterator<Service> si = objBooking.getArrServices().iterator();si.hasNext(); ){
	        								Service objService=si.next();%>
									<li><%=objService.getServiceName()%>&nbsp;(Rs.<%=objService.getServicePrice()%>  <%=objService.getUnitType()%>)</li>
									<%}%>
								</ol> <%}%> 
							
							</td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getStrCheckinTime()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getStrCheckoutTime()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getChargedAmount()%></td>
							<% if (userRole.equalsIgnoreCase("Customer")) {%>
								<td style="color: black; font-weight: bold;">
									<a href="javascript:onCancel(<%=objBooking.getBookingId()%>, <%=objBooking.getMinutesToCheckinFromNow()%>)">
										Cancel
										<% if(objBooking.getMinutesToCheckinFromNow()<240) {%>
										 (50% Refund)<%} else {%> (90% refund)
										<%} %>
									</a> 
								</td>
							<%}%>
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
								<%if (userRole.equalsIgnoreCase("Admin")|| userRole.equalsIgnoreCase("Staff")) {%>
								<th>Customer Name</th>
								<%} %>
								<th>Location</th>
								<th>Work Space Name</th>
								<th>Services</th>
								<th>Checkin Time</th>
								<th>Checkout Time</th>
								<th>Amount Paid</th>
								<th>Refund</th>
								<th>Status</th>
								<%if (userRole.equalsIgnoreCase("Customer")) {%>
								<th>Feedback</th>
								<%} %>
							</tr>
						</thead>
						<%for (Iterator<WorkSpaceBooking> i=arrPastBookings.iterator(); i.hasNext();){
								WorkSpaceBooking objBooking = i.next();%>
						<tr>
							<td style="color: black; font-weight: bold;"><%=objBooking.getBookingId()%></td>
							<%if (userRole.equalsIgnoreCase("Admin")|| userRole.equalsIgnoreCase("Staff")) {%>
								<td style="color: black; font-weight: bold;">
									<%=objBooking.getCustomerFirstName()%> &nbsp;<%=objBooking.getCustomerLastName()%>
								</td>
								<%} %>
							<td style="color: black; font-weight: bold;"><%=objBooking.getLocationName()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getWorkSpaceName()%></td>
							<td style="color: black; font-weight: bold;">
								<% if (objBooking.getArrServices() != null && !objBooking.getArrServices().isEmpty()) {%>
								<ol>
									<% for (Iterator<Service> si = objBooking.getArrServices().iterator();si.hasNext(); ){
	        								Service objService=si.next();%>
									<li><%=objService.getServiceName()%>&nbsp;(Rs.<%=objService.getServicePrice()%>  <%=objService.getUnitType()%>)</li>
									<%}%>
								</ol> <%}%> 
							</td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getStrCheckinTime()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getStrCheckoutTime()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getChargedAmount()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getRefundAmount()%></td>
							<td style="color: black; font-weight: bold;"><%=objBooking.getBookingstatus()%></td>
							
							<%if (userRole.equalsIgnoreCase("Customer")) {%>
							<td>
								<% if (objBooking.getFeedbackKey()>0 && objBooking.getFeedbackId()==0) {%>
								<a href="javascript:feedback(<%=objBooking.getBookingId()%>)">Feedback</a>
								<%} %>
							</td>
							<%} %>
						</tr>
						<% }%>
					</table>
					<%}%>
					<input type="hidden" id="actionType" name="actionType" value="" />
					<input type="hidden" id="id" name="id" value="0" /> 
					<input type="hidden" id="mts" name="mts" value="0" />
				</form>
			</div>
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