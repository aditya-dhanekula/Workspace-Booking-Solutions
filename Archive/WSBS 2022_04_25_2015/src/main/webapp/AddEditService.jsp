<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bitshyd.dbmsproject.web.model.Service"%>
<%
if (session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null
		|| !session.getAttribute("UserRole").toString().equalsIgnoreCase("Admin")) {
		response.sendRedirect("Error.jsp");
}
%>

<%
Service objService = (Service) request.getAttribute("model");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/spur.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">
<title>Add Edit Service</title>
<style type="text/css">
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
		<%@ include file="AdminSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<div align="center">
				<h2 class="display-4"
					style="text-align: center; color: black; font-weight: bold;"><%=(objService.getServiceID()>0 ? "Edit Service" : "Add Service") %></h2>
				<br>
				<form id="AddEditService" method="post" action="Service">
					<table><tr>
							<td><label for="ServiceName">Service Name</label> </td>
						<td> 
						<input type="text" id="ServiceName" name="ServiceName" value="<%=objService.getServiceName().toString()%>"/>
						</td>
					</tr>
					<tr>
						<td><label for="ServicePrice">Service Price (Rs)</label> </td>
						<td><input type="text" id="ServicePrice" name="ServicePrice" value="<%=objService.getServicePrice()%>"/></td> 
					</tr>
					<tr>
						<td><label for="UnitType">Unit</label> </td>
						<td><input type="text" id="UnitType" name="UnitType" value="<%=objService.getUnitType()%>"/></td> 
					</tr>
					<tr>
					<td colspan="2" style="text-align: center;">
						<input type="hidden" name="ServiceID" value="<%=objService.getServiceID()%>"/>
						<input type="submit" class="button-81" style="" value="Save" />&nbsp; &nbsp; &nbsp; 
						<input type="button" class="button-81" style="" value="Cancel" onclick="javascript:window.location.href='Service'" />
					</td>
				</tr></table>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="Footer.jsp"%>
</body>
</html>