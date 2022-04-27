<%@page import="bitshyd.dbmsproject.web.model.Location"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bitshyd.dbmsproject.web.model.Service"%>
<%
/* if (session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null
		|| !session.getAttribute("UserRole").toString().equalsIgnoreCase("Admin")) {
	response.sendRedirect("Error.jsp");
} */
%>

<%
Location objLocation = (Location)request.getAttribute("model");
//System.out.println("Jsp page start");
//System.out.println("After taking users data");
//System.out.println("Total Objects " + ObjUsers.size());
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
<link
	href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700"
	rel="stylesheet">

<link rel="stylesheet" href="assets/css/profile1.css">
<link rel="stylesheet" href="assets/css/spur.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>

<title>Add/Edit WorkSpace Location</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">



</style>

<style>
body {
	background: #74ebd5; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ACB6E5, #74ebd5);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
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

h1, form, input, p {
	padding: 0;
	margin: 0;
	outline: none;
	font-family: Roboto, Arial, sans-serif;
	font-size: 16px;
	color: #666;
}

h1 {
	padding: 10px 0;
	font-size: 32px;
	font-weight: 300;
	text-align: center;
}

p {
	font-size: 12px;
}

hr {
	color: #a9a9a9;
	opacity: 0.3;
}

.main-block {
	max-width: 340px;
	padding: 10px 0;
	margin: auto;
	border-radius: 5px;
}

form {
	margin-left: 25%;
	margin-right: 25%;
	display: inline-block;
	width: 50%;
}
</style>
</head>

<body>
	<div class="dash">
		<%@ include file="AdminSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>

			<form id="frmAddEditLocation" name="frmAddEditLocation"
				method="post" action="Location">
				<div class="form-group ">
					<label style="font-weight: bold;">Location Name</label> <input
						type="text" id="locationName" name="locationName"
						class="form-control" value="<%=objLocation.getLocationName()%>">
				</div>

				<div class="form-group ">
					<label style="font-weight: bold;">Big WorkSpace Spaces </label> <input
						type="number" id="bigSpaces" name="bigSpaces" min="1" max="100"
						class="form-control"
						value="<%=objLocation.getStrBigWorkSpaces()%>">
				</div>
				<div class="form-group ">
					<label style="font-weight: bold;">Small WorkSpace Spaces </label> <input
						type="number" id="smallSpaces" name="smallSpaces" min="1"
						max="100" class="form-control"
						value="<%=objLocation.getStrSmallWorkSpaces()%>">
				</div>
				<button type="button" id="btnSubmit" name="btnSubmit"
					class="button-81" onclick="javascript:OnSubmit()"
					style="color: #79FE0C;">Submit</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" id="btnCancel" name="btnCancel"
					class="button-81" onclick="Javascript:OnCancel()"
					style="color: red;">Cancel</button>

				<input type="hidden" id="actionType" name="actionType" value="save" />
				<input type="hidden" id="id" name="id"
					value="<%=objLocation.getLocationID()%>" />
			</form>
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