<%@page import="bitshyd.dbmsproject.web.model.Location"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bitshyd.dbmsproject.web.model.Service"%>
<%
 if (session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null
		|| !session.getAttribute("UserRole").toString().equalsIgnoreCase("Admin")) {
	response.sendRedirect("Error.jsp");
} 
Location objLocation = (Location)request.getAttribute("model");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/spur.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">
<title>Add/Edit WorkSpace Location</title>
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
			<div style="align-content: center;">
			<h2 class="display-4"
					style="text-align: center; color: black; font-weight: bold;"><%=(objLocation.getLocationID()>0 ? "Edit Location" : "Add Location")%></h2>
			
				<br>
			<form id="frmAddEditLocation" name="frmAddEditLocation"
				method="post" action="Location">
				<table align="center" style="text-align: center:">
				<tr>
					<td><label for="locationName">Location Name</label></td> 
					<td><input type="text" id="locationName" name="locationName"
						class="form-control" value="<%=objLocation.getLocationName()%>"></td>
				</tr>
				<tr>
					<td><label for="bigSpaces" >Big Spaces </label></td>
					 <td><input type="number" id="bigSpaces" name="bigSpaces" min="1" max="100" class="form-control"
						value="<%=objLocation.getStrBigWorkSpaces()%>"></td>
				</tr>
				<tr>
					<td><label for="smallSpaces">Small Spaces </label> </td>
					<td><input type="number" id="smallSpaces" name="smallSpaces" min="1" max="100" class="form-control"
						value="<%=objLocation.getStrSmallWorkSpaces()%>"></td>
				</tr>
				<tr>
				<td colspan="2" align="center">
				<br/>
					<button type="button" id="btnSave" name="btnSave" class="button-81" onclick="javascript:OnSubmit()">Save</button>
						&nbsp;&nbsp;&nbsp;
					<button type="button" id="btnCancel" name="btnCancel" class="button-81" onclick="Javascript:OnCancel()">Cancel</button>

					<input type="hidden" id="actionType" name="actionType" value="save" />
					<input type="hidden" id="id" name="id" value="<%=objLocation.getLocationID()%>" />
				</td>
			</tr></table>
			</form>
		</div>	
			<script type="text/javascript">
		function OnCancel(){
			window.location.href = "Location";
		}
		
		function OnSubmit(){
			document.getElementById("frmAddEditLocation").submit();
		}
			
	</script>

			<%@ include file="Footer.jsp"%>
</body>
</html>