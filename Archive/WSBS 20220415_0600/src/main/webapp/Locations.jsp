<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.google.protobuf.StringValue"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bitshyd.dbmsproject.web.model.Location"%>
 <%
if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Admin")){
	response.sendRedirect("Error.jsp");
}
%> 
<%
	ArrayList<Location> arrLocations = (ArrayList<Location>) request.getAttribute("model");
%>

<!doctype html>
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
<link rel="stylesheet" href="assets/css/profile1.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>

<title>Locations</title>

<style>
body {
	background: #74ebd5; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ACB6E5, #74ebd5);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

th {
	text-align: center;
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
		<%@ include file="AdminSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<h2 class="display-4"
				style="text-align: center; color: black; font-weight: bold;">Locations</h2>
			<br>

			<form id="frmLocation" name="frmLocation"
				action="Location" method="post">
				<h2 class="display-6"
					style="text-align: center; color: black; font-weight: bold;">
					<a href="javascript:form_submit('add', 0)" class="button-81"
						role="button"> Add New Location </a>
				</h2>
				<br>
				<%if (arrLocations == null || arrLocations.isEmpty() ) {%>

				<%} else {%>
				<table align="center" style="width: 80%" class="table table-hover table-bordered">
					<thead class="thead-dark">
						<tr>

							<th scope="col">Name</th>
							<th scope="col">Big Spaces</th>
							<th scope="col">Small Spaces</th>
							<th scope="col">Status</th>
							<th scope="col" style="text-align: center;">Actions</th>

						</tr>
					</thead>
					<% for (Iterator<Location> i=arrLocations.iterator(); i.hasNext();) {
							Location objLocation = i.next(); %>
					<tr>
						<td style="color: black; font-weight: bold; text-align: left; "><%=objLocation.getLocationName()%></td>
						<td style="color: black; font-weight: bold; text-align: right;"><%=objLocation.getBigWorkSpaces() %></td>
						<td style="color: black; font-weight: bold;text-align: right;"><%=objLocation.getSmallWorkSpaces()%></td>
						<td style="color: black; font-weight: bold;text-align: center;"><%=objLocation.getLocationStatus()%></td>
						<td style="text-align: center;" >
							<%if (objLocation.getLocationStatusID()== 1) {%> 
							<a href="javascript:form_submit('block', <%=objLocation.getLocationID()%>)"
							style="color: red;">Block <i class="fas fa-times"></i></a> <%} else { %>
							<a href="javascript:form_submit('unblock', <%=objLocation.getLocationID()%>)"
							style="color: green;">Unblock <i class="fas fa-check"></i></a> <%} %>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:form_submit('edit', <%=objLocation.getLocationID()%>)"
							style="color: black;">Edit <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-pencil-square"
									viewBox="0 0 16 16">
  <path
										d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
										d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg>
						</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:form_submit('delete', <%=objLocation.getLocationID()%>)"
							style="color: black;">Delete <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  <path 
										d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
  <path fill-rule="evenodd"
										d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
</svg>
						</a></td>
					</tr>

					<%}%>

				</table>
				<%} %>
				<input type="hidden" id="actionType" name="actionType" /> <input
					type="hidden" id="id" name="id" />
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function form_submit(type, id)
		{
			document.getElementById("actionType").value = type;
			document.getElementById("id").value = id;
			document.getElementById("frmLocation").submit();
			return false;
		}
	</script>
	<%@ include file="Footer.jsp"%>

</body>
</html>