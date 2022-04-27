<%@page import="bitshyd.dbmsproject.web.model.User"%>
<%@page import="bitshyd.dbmsproject.web.model.Service"%>
<%@page import="bitshyd.dbmsproject.web.model.WorkSpace"%>
<%@page import="javax.management.MalformedObjectNameException"%>
<%@page import="bitshyd.dbmsproject.web.model.Location"%>
<%@page import="bitshyd.dbmsproject.web.model.NewBooking"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% 
if(session.getAttribute("UserID") == null ){
	response.sendRedirect("Error.jsp"); 
}
	String UserRole = session.getAttribute("UserRole").toString();
	NewBooking objBooking= (NewBooking) request.getAttribute("model");
%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="assets/css/spur.css">
<link rel="stylesheet" href="assets/css/profile1.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">
<title><%=UserRole.equalsIgnoreCase("Customer")== true ? "Work Space Booking": "Slot Availability"%></title>


<style>

/* ::selection {
  color: black;

} */
body {
	background: #74ebd5; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ACB6E5, #74ebd5);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	font-family: 'Roboto Condensed', sans-serif;
}

input[type=checkbox] {
	/* Double-sized Checkboxes */
	-ms-transform: scale(2); /* IE */
	-moz-transform: scale(2); /* FF */
	-webkit-transform: scale(2); /* Safari and Chrome */
	-o-transform: scale(2); /* Opera */
	padding: 10px;
}

.dash-toolbar {
	background: black;
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	Chrome 10-25, Safari 5.1-6
	background:linear-gradient(to right, #ACB6E5,#74ebd5);
}

th {
	text-align: center;
}

input, select {
	line-height: 2em; is (2 * default line height) 
	font: inherit;
}

option {
	padding: 5px 0;
}

.booknow {
	color: black;
	font-size: 1.3em;
}

.booknow:hover {
	color: black;
}

.checked {
	color: orange;
}
</style>
</head>
<body style="width: 100%">
	<div class="dash">
		<%if (UserRole.equalsIgnoreCase("Admin")) {%>
		<%@ include file="AdminSideMenu.jsp"%>
		<%} else if (UserRole.equalsIgnoreCase("Customer")) {%>
		<%@ include file="CustomerSideMenu.jsp"%>
		<%} else {%>
		<%@ include file="StaffSideMenu.jsp"%>
		<%} %>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<main class="dash-content">
				<form id="frmnewbooking" name="frmnewbooking" action="NewBooking"
					method="post">
					<div id="divsearchinfo"
						<%=(objBooking.getActionType().equalsIgnoreCase("Book") ? "Style='display:None;'" : "")%>
						align="center">
						<h2 class="display-4"
							style="text-align: center; color: black; font-weight: bold;"><%=UserRole.equalsIgnoreCase("Customer")== true ? "Work Space Booking": "Slot Availability"%></h2>
						<br>
						<table>
							<tr>
								<td><label for="location">Location</label></td>
								<td><select id="location" name="location"
									style="min-width: 100%; height: 30px;">
										<option value="0">Select</option>
										<% ArrayList<Location> arrLocations=objBooking.getArrLocations(); 
							            for (Iterator<Location> i=arrLocations.iterator();i.hasNext();){ 
							            	Location objLocation= i.next(); %>
										<option value="<%=objLocation.getLocationID()%>"
											<%=(objLocation.getLocationID()==objBooking.getLocationId() ? "selected": "")%>>
											<%=objLocation.getLocationName() %></option>
										<%} %>
								</select></td>
							</tr>
							<tr>
								<td><label for="checkin">Check in</label></td>
								<td><input type="datetime-local" size="" id="checkin"
									name="checkin" onchange="javascript:OnCheckinChange()" 
									value="<%=objBooking.getCheckin()%>"></td>
							</tr>
							<tr>
								<td><label for="checkout">Check out</label></td>
								<td><input type="datetime-local" id="checkout" name="checkout"
									 value="<%=objBooking.getCheckout()%>"></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><br /> <input type="button"
									class="button-81" id="btnsearch" name="btnsearch"
									value="Submit" onclick="javacript:form_submit ('Search', 0)" /></td>
							</tr>
						</table>
					</div>
					<% if (objBooking.getActionType().equalsIgnoreCase("Search")) {
		       
		       	ArrayList<WorkSpace> arrWorkSpaces= objBooking.getArrWorkSpaces();	
		       	
		       	if (arrWorkSpaces==null || arrWorkSpaces.isEmpty()){
		       %>
					<p align="center">Sorry!! No Work Spaces available for the
						given timings!!</p>
					<%} else {%><br />
					<br /> <label style="text-align: center;">Available Work Spaces are: <%=arrWorkSpaces.size()%></label>

					<table class="table table-hover table-bordered">

						<thead class="thead-dark">
							<tr>
								<th scope="col">Work Space Name (Hourly Price)</th>
								<th scope="col">Staff Name</th>
								<th scope="col">Staff Rating</th>
								<th scope="col">Services offered (Price)</th>
								<% if (UserRole.equalsIgnoreCase("Customer")) {%>
								<th scope="col">Actions</th>
								<%} %>
							</tr>
						</thead>
						<tr>
							<%for (Iterator<WorkSpace> ips=arrWorkSpaces.iterator();ips.hasNext();) {
			          	WorkSpace objSpace= ips.next();
			          	User staff=objSpace.getStaff();
			          	if (staff == null){
			          		staff=new User();
			          	}
			          %>
					<td style="color: black; font-weight: bold; border: 1px solid black; text-align: left;">
							<%=objSpace.getWorkSpaceName()%> (Rs.<%=objSpace.getWorkSpacePrice()%>)</td>
					<td style="color: black; font-weight: bold; border: 1px solid black;text-align: left;">
							<%= staff.getFirstName()%>&nbsp;<%=staff.getLastName()%></td>
					<td style="color: black; font-weight: bold; border: 1px solid black; text-align: right;">
						<span align="left"> &#9733&#9734&#9734&#9734&#9734</span> <%=staff.getStaffRating()%></td>
					<td style="color: black; font-weight: bold; border: 1px solid black;text-align: center;">
						<% 
			            	ArrayList<Service> arrServices=staff.getStaffServices();
			            	if (arrServices != null && !arrServices.isEmpty()){
			            	%>
								<ol>
									<% 	for (Iterator<Service> i=arrServices.iterator();i.hasNext();){
			            		Service objService=i.next();%>
									<li style="text-align: left;">
										<%=objService.getServiceName()%> (Rs.<%=objService.getServicePrice()%> <%=objService.getUnitType()%>)
									</li>
									<%} %>
								</ol> <%} %> <% if (UserRole.equalsIgnoreCase("Customer")) {%>
							</td>
							<td class="table-active "
								style="color: black; font-weight: bold; border: 1px solid black;">

								<a class="booknow"
								href="Javascript:form_submit('Book', <%=objSpace.getWorkSpaceID()%>)">Book
									Now </a>

							</td>
							<%} %>
						</tr>
						<%} %>

					</table>
					<%} 
		       	}%>

					<%if (objBooking.getActionType().equalsIgnoreCase("Book")) {
		       		User objStaff=objBooking.getStaff();
		       		ArrayList<Service> arrServices=null;
			       	if (objStaff!=null ){
			       		arrServices=objStaff.getStaffServices();
			       	}
			       	if (arrServices == null || arrServices.isEmpty()){%>
					<h2 align="center" style="color: red;">No Services are available for the selected Work Space.</h2>
					<%} else {%>
					<h2 align="center" style="color: black; font-weight: bold;">Choose
						the services you want</h2>
					<br>
					<%}%>

					<div id="divservices" align="center">
						<table class="table table-hover"
							style="border: 2px solid black; width: 40%;">
							<%if (arrServices != null){
						for (Iterator<Service> i=arrServices.iterator();i.hasNext();){
							Service objService=i.next();
							%>
							<tr>
								<td class=""
									style="border: 1px solid black; border-right-style: dotted;">
									<label for="optedservices"><%=objService.getServiceName()%>
										(Rs.<%=objService.getServicePrice()%>  <%=objService.getUnitType()%>)</label>
								</td>
								<td class=""
									style="border: 1px solid black; text-align: center;"><input
									type="checkbox" name="optedservices"
									value="<%=objService.getServiceID()%>"
									style="text-align: right;"></td>
							</tr>
							<%} 
						} %>

							<tr>
								<td class="table-active" style="text-align: center;"><br />
								<input type="button" class="button-81" id="btnservices"
									name="btnservices" value="Proceed" onclick="OnProceedClick()" />
									&nbsp;&nbsp;<input type="button" class="button-81" id="btnback"
									name="btnback" value="Back" onclick="OnBackClick()" /></td>
								<td class="table-active"></td>
							</tr>
						</table>
					</div>
					<%} %>
					<input type="hidden" id="actionType" name="actionType" value="" />
					<input type="hidden" id="id" name="id"
						value="<%=objBooking.getBooking().getWorkSpaceId()%>" />
				</form>
			</main>
		</div>
	</div>
	<script type="text/javascript">
  		function OnCheckinChange(){
  			document.getElementById('checkout').value=document.getElementById('checkin').value;
  		}
  		
  		function OnBackClick(){
  			form_submit("Search", 0);
  		}
  	
  		function OnProceedClick(){
  			document.getElementById("actionType").value="Proceed";
			document.getElementById("frmnewbooking").submit();
			return false;
  		}
  		
		function form_submit(type, id)
		{
			document.getElementById("actionType").value = type;
			document.getElementById("id").value = id;
			document.getElementById("frmnewbooking").submit();
			return false;
		}
  	
  	</script>

	<%@ include file="Footer.jsp"%>
</body>
</html>