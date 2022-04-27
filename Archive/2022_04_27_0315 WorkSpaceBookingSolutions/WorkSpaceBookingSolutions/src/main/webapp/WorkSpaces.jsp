<%@page import="java.util.Iterator"%>
<%@page import="bitshyd.dbmsproject.web.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

 <%
if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Admin")){
	response.sendRedirect("Error.jsp");
}
%> 
<%
	LocationsSpacesAndStaff objLocSpaceStaff = (LocationsSpacesAndStaff) request.getAttribute("model"); 
	ArrayList<Location> arrLocations =  objLocSpaceStaff.getArrLocations();
	ArrayList<WorkSpace> arrSpaces = objLocSpaceStaff.getArrWorkSpaces();
	ArrayList<User> arrStaff = objLocSpaceStaff.getArrStaff();
%>
<!doctype html>
<html>
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

<title>Work Spaces</title>

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

input[type=checkbox] {
	/* Double-sized Checkboxes */
	-ms-transform: scale(2); /* IE */
	-moz-transform: scale(2); /* FF */
	-webkit-transform: scale(2); /* Safari and Chrome */
	-o-transform: scale(2); /* Opera */
	padding: 10px;
}
</style>
</head>

<body>
	<div class="dash">
		<%@ include file="AdminSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>

			<p class="display-4"
				style="text-align: center; color: black; font-weight: bold;">Work Spaces</p>
			<br />
			<form id="frmWorkSpaces" name="frmWorkSpaces"
				action="WorkSpace" method="post">
				<div style="text-align: center;">
					<label for="LocationId">Location</label>&nbsp; <select
						id="LocationId" name="LocationId">
						<option value="0">Select</option>
						<% for (Iterator<Location> i= arrLocations.iterator(); i.hasNext();) {
							Location objLocation = i.next(); %>
						<option value=<%=objLocation.getLocationID()%>
							<%=objLocation.getSelectIfLocationMatches(objLocSpaceStaff.getSelectedLocationId())%>><%=objLocation.getLocationName() %></option>
						<%} %>
					</select> <input type="button" id="btnSearch" name="btnSearch"
						value="Search" onclick="javascript:form_submit('search', 0)"
						class="button-81" />
				</div>
				<% if (objLocSpaceStaff.getSelectedLocationId() > 0){%>
				<div style="text-align: right">
					<label for="btnAssign">Staff</label> <select id="staffId"
						name="staffId">
						<option value="0">Select</option>
						<% if (arrStaff != null && !arrStaff.isEmpty())
							for (Iterator<User> i= arrStaff.iterator(); i.hasNext();) {
								User objStaff = i.next(); %>
						<option value="<%=objStaff.getUserId()%>"
							<%=((objStaff.getUserId() == objLocSpaceStaff.getSelectedStaffId()) ? "selected": "")%>>
							<%=objStaff.getFirstName() + " " + objStaff.getLastName()%></option>
						<%} %>
					</select> <input type="button" id="btnAssign" name="btnAssign"
						value="Assign" onclick="javacript:form_submit('assign', 0)"
						class="button-81" />
				</div>
				<% if (arrSpaces == null || arrSpaces.isEmpty()) {%>
				<div style="text-align: center;">No Work Spaces available
					for this WorkSpace Locations</div>
				<%} 
						else {%>
				<table 	class="table table-hover table-bordered">
					<thead class="thead-dark">
						<tr>
							<th scope="col" style="text-align: center;" >Select</th>
							<th scope="col" style="text-align: center;">Work Space Name (Price)</th>
							<th scope="col" style="text-align: center;">Staff Name</th>
							<th scope="col" style="text-align: center;">Staff Rating</th>
							<th scope="col" style="text-align: center;">Status</th>
							<th scope="col" style="text-align: center;">Actions</th>
						</tr>
					</thead>

					<% for (Iterator<WorkSpace> i=arrSpaces.iterator(); i.hasNext();) {
	 							WorkSpace objSpace = i.next(); %>
					<tr>
						<td scope="row" style="text-align: center;"><input
							type="checkbox" id="chkWorkSpace" name="chkWorkSpace"
							class="form-check-input"
							value="<%=objSpace.getWorkSpaceID()%>"></td>
						<td style="color: black; font-weight: bold;text-align: left;"><%=objSpace.getWorkSpaceName()%> (Rs.<%=objSpace.getWorkSpacePrice()%>)</td>
						<td style="color: black; font-weight: bold;text-align: left;"><%=(objSpace.getStaff()==null ? "": objSpace.getStaff().getFirstName() + " " + objSpace.getStaff().getLastName())%></td>
						<td style="color: black; font-weight: bold;text-align: left;"><%=(objSpace.getStaff()==null ? "": objSpace.getStaff().getStaffRating())%></td>
						<td style="color: black; font-weight: bold;text-align: center;"><%=objSpace.getWorkSpaceStatus()%></td>
						<td style="text-align: center;">
							<% if (objSpace.getWorkSpaceStatusId() == 1) {%>
								<a href="javascript:form_submit('block', <%=objSpace.getWorkSpaceID() %>)"
									style="color: red;">Block</a> <%}
								else {%>
								<a href="javascript:form_submit('unblock', <%=objSpace.getWorkSpaceID() %>)"
									style="color: green;"> Unblock</a> <%} %>
						</td>
					</tr>
					
					<%} %>
				</table>
				<%}
				}%>
				<input type="hidden" id="actionType" name="actionType" /> <input
					type="hidden" id="id" name="id" />
			</form>

		</div>
	</div>
	<script type="text/javascript">
		function form_submit(type, id) {
			document.getElementById("actionType").value = type;
			document.getElementById("id").value = id;
			document.getElementById("frmWorkSpaces").submit();
			return false;
		}
	</script>
	<%@ include file="Footer.jsp"%>
</body>
</html>