<%@page import="bitshyd.dbmsproject.web.model.Service"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Staff")){
	response.sendRedirect("Error.jsp");
}
ArrayList<Service> arrServices = (ArrayList<Service>) request.getAttribute("model");
String actionType=request.getAttribute("actionType").toString();
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
<link rel="stylesheet" href="assets/css/profile1.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
<title>Choose Services</title>
<link rel="stylesheet" href="assets/css/staffserviceofferingsstyles.css">
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

.form {
	padding: 0 16px;
	max-width: 750px;
	margin: 50px auto;
	font-size: 18px;
	font-weight: 600;
	line-height: 36px;
	background-color: #D1D7DC;
	position: relative;
	background: #DD5E89; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #F7BB97, #DD5E89);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #F7BB97, #DD5E89);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border-radius: 30px;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

label {
	font-family: Source Sans Pro;
	font-weight: 600;
	font-size: 36px;
	margin: 0.4rem;
	display: inline-block;
}
</style>

</head>

<body>
	<div class="dash">
		<%@ include file="StaffSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<main class="dash-content">
				<div class="container-fluid" style="text-align: center;">
					<h2 class="display-4" style="text-align: center; color: black; font-weight: bold;">Choose Services</h2>

					<form id="StaffServiceOffering" name="StaffServiceOffering"
						method="Post" action="StaffServiceOffering">
						<% if (arrServices != null) {%>
							<table align="center" style="width: 50%; border-style:none; " class="table table-hover table-bordered">
							<% for (Iterator<Service> i=arrServices.iterator(); i.hasNext();) {
												Service objService = i.next(); %>
						<tr>
						
							<td style="color: opacity; font-weight: bold; border: 1px solid black; text-align: left;">
								<%if (actionType.equalsIgnoreCase("Edit")) {%>
								<input type="checkbox"
									value="<%=objService.getServiceID()%>"
									<%=(objService.isSelected() ? "Checked": "")%> id="chkservice"
									name="chkservice" /> 
								<%} %>
								<label for="flexCheckDefault"><%=(objService.getServiceName() + " (Rs." + objService.getServicePrice() + ")")%>
								</label>
							</td>	
							<%if (actionType.equalsIgnoreCase("View")) {%>
							<td style="color: opacity; font-weight: bold; border: 1px solid black; text-align: left;">
								<label>
									<%=(objService.isSelected() ? "Offered": "Not Offered")%>
								</label>
							</td>
							<%} %>
						</tr>
						<%} %> 
						<tr>
							<td colspan="2" style="color: black; font-weight: bold; border: 1px solid black; text-align: center;">
									<%if (actionType.equalsIgnoreCase("View")) {%>
									<button type="submit" id="btnSubmit" name="btnSubmit"
											class=" button-81" onClick="javascript:form_submit('Edit')">Edit</button>
									<%} else { %>
									<button type="submit" id="btnSubmit" name="btnSubmit"
											class=" button-81" onClick="javascript:form_submit('Save')">Save</button>&nbsp;&nbsp;
									<button type="submit" id="btnCancel" name="btnCancel"
											class=" button-81" onClick="javascript:form_submit('Cancel')">Cancel</button>		
									<%} %>
									
							</td>
									
							</tr>
							</table>
						<% }%>
						<input type="hidden" id="actionType" name="actionType" value="edit" />
					</form>
				</div>
			</main>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>
	<script type="text/javascript">
	function form_submit(type, id)
	{
		document.getElementById("actionType").value = type;
		document.getElementById("StaffServiceOffering").submit();
		return false;
	}
	</script>
</body>
</html>