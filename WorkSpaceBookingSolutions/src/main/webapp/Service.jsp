<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.google.protobuf.StringValue"%>
<%@page import="bitshyd.dbmsproject.web.model.Service"%>
<!DOCTYPE html>
<%
if(session.getAttribute("UserID") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Admin")){
	response.sendRedirect("Error.jsp");
}
%>

<%
ArrayList<Service> ObjServices=null;
//System.out.println("Jsp page start");
ObjServices = (ArrayList<Service>) request.getAttribute("model");
//System.out.println("After taking users data");
//System.out.println("Total Objects " + ObjUsers.size());
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

<title>Services</title>
</head>
<style>
.dash-toolbar {
	background: #1e293b;
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

.table {
	border: 1px solid black;
}
</style>
<body style="width: 100%;">

	<div class="dash">
		<%@ include file="AdminSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<form id="frmService" name="frmService" method="post" action="Service">
				<h2 class="display-4" style="text-align: center; color: black; font-weight: bold;">Services</h2>
				<h2 class="display-6" 
					style="text-align: center; color: black; font-weight: bold;">
					<button onClick="javascript:form_submit('add', 0)"
						class="button-81" role="button">Add New Service</button>
				</h2>
				<br>

				<table class="table table-hover table-bordered" align="center" Style="width:70%;">
					<thead class="thead-dark">
						<tr>
							<th scope="col" Style="text-align: center">Service Name</th>
							<th scope="col" Style="text-align: center">Price (Rs)</th>
							<th scope="col" Style="text-align: center">Unit</th>
							<th scope="col" Style="text-align: center">Status</th>
							<th scope="col" Style="text-align: center">Actions</th>
						</tr>
					</thead>
					<% for (Iterator<Service> i=ObjServices.iterator(); i.hasNext();) {
					Service objService = i.next(); %>
					<tr>

						<td class="table-active" style="color: black; font-weight: bold;text-align: left;"><%=objService.getServiceName()%></td>
						<td class="table-active"
							style="color: black; font-weight: bold; text-align: right"><%=objService.getServicePrice() %></td>
						<td class="table-active"
							style="color: black; font-weight: bold; text-align: right"><%=objService.getUnitType()%></td>
						<td class="table-active" style="color: black; font-weight: bold;text-align: center;"><%=objService.getServiceStatus() %></td>
						<td class="table-active" scope="row" style="text-align: center;">
						<% if (objService.getServiceStatusID() == 1) {%>
						<a href="javascript: form_submit('deactivate', <%=objService.getServiceID()%>)"
							style="color: red;">Block <i class="fas fa-times"></i></a>
						<%} else {%>
						<a
							href="javascript: form_submit('activate', <%=objService.getServiceID()%>)"
							style="color: green;">Activate <i class="fas fa-check"></i></a>
						<%} %>
						 &nbsp;&nbsp;&nbsp;&nbsp;<a
							href="javascript: form_submit('edit', <%=objService.getServiceID()%>)"
							style="color: black;">Edit<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-pencil-square"
									viewBox="0 0 16 16">
  <path
										d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
										d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg></a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="javascript: form_submit('delete', <%= objService.getServiceID()%>)"
							style="color: black;">Delete <svg
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
		document.getElementById("frmService").submit();
		return false;
	}
	</script>
</body>
</html>