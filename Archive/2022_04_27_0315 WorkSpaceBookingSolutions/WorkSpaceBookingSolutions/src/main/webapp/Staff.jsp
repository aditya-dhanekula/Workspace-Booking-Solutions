<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.google.protobuf.StringValue"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="bitshyd.dbmsproject.web.model.User"%>
<!DOCTYPE html>
<%
 if(session.getAttribute("UserID") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Admin")){
 	response.sendRedirect("Error");
 }
%>

<%
String strFieldName = "";
String strValue = "";
ArrayList<User> ObjStaff=null;
if(request.getParameter("FieldName") != null){
	strFieldName = request.getParameter("FieldName");
	strValue = request.getParameter("Value");
	ObjStaff = (ArrayList<User>) request.getAttribute("model");
}
%>
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

<title>Staff</title>

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
</style>
</head>

<body>
	<div class="dash">
		<%@ include file="AdminSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<p class="display-4"
				style="text-align: center; color: black; font-weight: bold;">Staff
				Search</p>

			<form id="frmStaff" name="frmStaff" action="Staff" method="post">
				<div style="text-align: center;">
					<label for="FieldName">Search By</label> &nbsp; <select
						name="FieldName" id="FieldName" style="height: 30px;">
						<option value="">Field Type</option>
						<option value="FirstName"
							<%=(strFieldName.equalsIgnoreCase("FirstName") ? "selected":"")%>>First
							Name</option>
						<option value="LastName"
							<%=(strFieldName.equalsIgnoreCase("LastName") ? "selected":"")%>>Last
							Name</option>
						<option value="PhoneNo"
							<%=(strFieldName.equalsIgnoreCase("PhoneNo") ? "selected":"")%>>Phone
							No</option>
						<option value="LocationName"
							<%=(strFieldName.equalsIgnoreCase("LocationName") ? "selected":"")%>>
							Location</option>
						<option value="City"
							<%=(strFieldName.equalsIgnoreCase("City") ? "selected":"")%>>City</option>
						<option value="Pincode"
							<%=(strFieldName.equalsIgnoreCase("Pincode") ? "selected":"")%>>Pincode</option>	
							
					</select> &emsp;&emsp; &emsp;<label for="Value">Value</label>&nbsp;<input
						type="text" name="Value" id="Value" value="<%=strValue%>">
					<input type="button" id="btnSearch" name="btnSearch" value="Search"
						class="button-81" onclick="javacript:form_submit('Search', 0)" />
				</div>
				<br>
				<h2 class="display-6"
					style="text-align: center; color: black; font-weight: bold;">
					<a href="javascript:form_submit('add', 0)" class="button-81"
						role="button"> Add Staff </a>
				</h2>
				<br>
				<% if (strFieldName != "" && (ObjStaff == null || ObjStaff.isEmpty())) { %>
				<h2 style="text-align: center; color: red;">No Staff found with
					given details</h2>
				<% } else if (strFieldName != ""){ %>
				<table class="table table-hover table-bordered">
					<thead class="thead-dark">
						<tr>
							<th scope="col" style="text-align: center;">Rating</th>
							<th scope="col" style="text-align: center;">First Name</th>
							<th scope="col" style="text-align: center;">Last Name</th>
							<th scope="col" style="text-align: center;">User Name</th>
							<th scope="col" style="text-align: center;">Work Location</th>
							<th scope="col" style="text-align: center;">City</th>
							<th scope="col" style="text-align: center;">Phone Number</th>
							<th scope="col" style="text-align: center;">User Status</th>
							<th scope="col" colspan="3" style="text-align: center;">
								Actions</th>
						</tr>
					</thead>
					<% for (Iterator<User> i=ObjStaff.iterator(); i.hasNext();) {
							User objUser = i.next(); %>
					<tr>
						<td style="color: black; font-weight: bold;"><%=objUser.getStaffRating()%></td>
						<td style="color: black; font-weight: bold;"><%=objUser.getFirstName()%></td>
						<td style="color: black; font-weight: bold;"><%=objUser.getLastName() %></td>
						<td style="color: black; font-weight: bold;"><%=objUser.getUsername() %></td>
						<td style="color: black; font-weight: bold;"><%=objUser.getWorkLocationName()%></td>
						<td style="color: black; font-weight: bold;"><%=objUser.getCity() %></td>
						<td style="color: black; font-weight: bold;"><%=objUser.getPhoneNo() %></td>

						<td style="color: black; font-weight: bold;"><%=objUser.getUserStatus() %></td>
						<td scope="row"><a
							href="javascript:form_submit('edit', <%=objUser.getUserId()%>)"
							style="color: black;">View/Edit<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-pencil-square"
									viewBox="0 0 16 16">
  <path
										d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
										d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg></a></td>
						<td scope="row">
							<% if (objUser.getUserStatusId() == 1) {%> <a
							href="javascript:form_submit('block', <%=objUser.getUserId()%>)"
							style="color: red;">Block <i class="fas fa-times"></i></a> <%}else { %>
							<a
							href="javascript:form_submit('activate', <%=objUser.getUserId()%>)"
							style="color: green;">Activate <i class="fas fa-check"></i></a> <%} %>
						</td>
						<td scope="row"><a href="javascript:form_submit('delete', <%= objUser.getUserId() %>)"
							style="color: black;">Delete<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  <path
										d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
  <path fill-rule="evenodd"
										d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
</svg></a></td>
					</tr>
					<%}%>
				</table>
				<%}%>
				<input type="hidden" id="actionType" name="actionType" /> <input
					type="hidden" id="id" name="id" />
			</form>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>


	<script type="text/javascript">
		function form_submit(type, id)
		{
			document.getElementById("actionType").value = type;
			document.getElementById("id").value = id;
			document.getElementById("frmStaff").submit();
			return false;
		}
	</script>
</body>
</html>