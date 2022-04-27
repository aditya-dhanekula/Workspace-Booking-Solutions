<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="bitshyd.dbmsproject.web.model.Location"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bitshyd.dbmsproject.web.model.User"%>
<%@page import="bitshyd.dbmsproject.web.model.Service"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<%
if (session.getAttribute("UserID") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Admin")) {
	response.sendRedirect("Error");
}

String ActionType = (String) request.getAttribute("ActionType");
User objUser = (User) request.getAttribute("model");
ArrayList<Service> arrServices = objUser.getStaffServices();
ArrayList<Location> arrLocations = (ArrayList<Location>) request.getAttribute("Locations");
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

<link rel="stylesheet" href="assets/css/spur.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
<script src="../js/chart-js-config.js"></script>
<link rel="stylesheet" href="assets/css/profile1.css">
<link rel="stylesheet" href="assets/css/spur.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link
	href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>


<title>Add Edit Staff</title>

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

h1 {
	font-family: Calibri;
	font-size: 25pt;
	font-weight: bold;
	color: black;
	text-align: center;
}

table {
	font-family: Calibri;
	color: rgb(21, 48, 197);
	font-size: 19pt;
	font-style: normal;
	font-weight: bold;
	border-collapse: collapse;
}

table.inner {
	border: 0px
}

td {
	color: black;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>

<body>
	<div class="dash">
		<%@ include file="AdminSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>

			<h2 class="display-4"
					style="text-align: center; color: black; font-weight: bold;"><%=objUser.getUserId()>0 ? "Edit Staff": "Add Staff"%></h2>
			<br>
			<div class="container">
				<div class="loginpage">
					<div class="forms">
						<form id="frmStaffRegistration" name="frmStaffRegistration"
							action="Staff" method="post">
							<table align="center" cellpadding="10">
								<tr>
									<td>First Name</td>
									<td><input type="text" id="FirstName" name="FirstName"
										value="<%=objUser.getFirstName().toString()%>" /></td>
								</tr>
								<tr>
									<td>Last Name</td>
									<td><input type="text" id="LastName" name="LastName"
										value="<%=objUser.getLastName()%>" /></td>
								</tr>

								<tr>
									<td>Username</td>
									<td><input type="text" id="Username" name="Username"
										<%=(objUser.getUserId() == 0 ? "" : "disabled")%>
										value="<%=objUser.getUsername()%>" /></td>
								</tr>
								<%
								if (objUser.getUserId() == 0) {
								%>
								<tr>
									<td>Password</td>
									<td><input type="password" id="Password" name="Password"
										placeholder="Password" />
										<div id="passerror" style="color: red;"></div></td>
								</tr>
								<tr>
									<td>Confirm Password</td>
									<td><input type="password" id="ConfirmPassword"
										name="ConfirmPassword" placeholder="Password" />
								</tr>
								<%
								}
								%>
								<tr>
									<td>Date of Birth</td>
									<td><input type="text" placeholder=DD-MM-YYYY id="DOB"
										name="DOB" style="color: var(- -first-color-light);"
										onfocus="(this.type='date')" onblur="(this.type='text')"
										value="<%=(ActionType.equalsIgnoreCase("edit") ? objUser.getDOB() : "")%>" /></td>
								</tr>
								<tr>
									<td>Email Id</td>
									<td><input type="email" id="EmailId" name="EmailId"
										maxlength="100" value="<%=objUser.getEmailID()%>" /></td>
								</tr>
								<tr>
									<td>Mobile Number</td>
									<td><input type="number" id="MobileNumber"
										name="MobileNumber" value="<%=objUser.getPhoneNo()%>"
										style="max-width: 100%;" />
										<div id="numbererror" style="color: red;"></div></td>
								</tr>
								<tr>
									<td>Gender</td>
									<td><input type="radio" name="Gender" value="Male"
										<%=((ActionType.equals("edit") && objUser.getGender().equalsIgnoreCase("Male")) ? "checked" : "")%> />Male
										<input type="radio" name="Gender" value="Female"
										<%=((ActionType.equals("edit") && objUser.getGender().equalsIgnoreCase("Female")) ? "checked" : "")%> />Female
									</td>
								</tr>
								<tr>
									<td>Address</td>
									<td><textarea rows="2" cols="20" id="Address"
											name="Address"><%=objUser.getResidentialAddress()%></textarea>
								</tr>
								<tr>
									<td>Work Location</td>
									<td><select id="WorkLocation" name="WorkLocation"
										style="max-width: 100%;">
											<option value="">Select</option>
											<%
											for (Iterator<Location> i = arrLocations.iterator(); i.hasNext();) {
												Location objLocation = i.next();
											%>
											<option value="<%=objLocation.getLocationID()%>"
												<%=objLocation.getSelectIfLocationMatches(objUser.getWorkLocationId())%>><%=objLocation.getLocationName()%></option>
											<%
											}
											%>
									</select></td>
								</tr>
								<tr>
									<td>City</td>
									<td><input type="text" id="City" name="City"
										value="<%=objUser.getCity()%>" /></td>
								</tr>
								<tr>
									<td>Pincode</td>
									<td><input type="number" id="PinCode" name="PinCode"
										maxlength="6" value="<%=objUser.getPincode()%>" />
										<div id="pinerror" style="color: red;"></div></td>
								</tr>
								<tr>
									<td>Opted Services</td>
									<td>
										<%
										if (!arrServices.isEmpty()) {
										%>
										<table>
											<%
											for (Iterator<Service> i = arrServices.iterator(); i.hasNext();) {
												Service objService = i.next();
											%>
											<tr>
												<td><%=objService.getServiceName().toString()%></td>
											</tr>
											<%
											}
											%>
										</table> <%
										 	}
										 %>
									
								<tr>
									<td colspan="2" align="center">
									<input type="button" id="btnSubmit" name="btnSubmit" class="button-81"
										onclick="javascript:form_submitcheck()" value="SUBMIT" />&nbsp;&nbsp;
									<input type="button" if="btnCancel" name="btnCancel" class="button-81"
										onclick="javascript:form_Cancel()" value="Cancel" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="color: red;"><%=objUser.getErrorMsg()%>
									</td>
								</tr>
								<% if(objUser.getUserId()>0){ %>
								<tr>
									<td colspan="2" align="center">
										<h1>Reset Password</h1>
									</td>
								</tr>
								<tr>
									<td>New Password</td>
									<td><input type="password" id="NewPassword"
										name="NewPassword" />
										<div id="resetpasserror" style="color: red;"></div></td>
								</tr>
								<tr>
									<td>Confirm Password</td>
									<td><input type="password" id="ConfirmNewPassword" name="ConfirmNewPassword" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
									<input type="button" id="btnResetPassword" name="btnResetPassword"
										class="button-81"
										onclick="javascript:form_resetPasswordCheck()" value="Save" />
									</td> 
									
								</tr>
								<%}%>
							</table>
							<input type="hidden" id="actionType" name="actionType" value="save"> 
							<input type="hidden" id="id" name="id" value="<%=objUser.getUserId()%>">
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		function form_resetPasswordCheck(){
			var password = document.getElementById('NewPassword').value;
			var confirmPassword = document.getElementById('ConfirmNewPassword').value;
			if(password != confirmPassword){
				document.getElementById('resetpasserror').innerHTML = " password and confirm password do not match";
				return false;
			}
			var passwordcheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
			if (passwordcheck.test(password)) {
				document.getElementById('resetpasserror').innerHTML = " ";
			} else {
				document.getElementById('resetpasserror').innerHTML = " invalid password";
				return false;
			}
			document.getElementById('actionType').value = 'resetPassword';
			document.getElementById('frmStaffRegistration').submit();
		}
		
		function form_Cancel(){
			document.getElementById('actionType').value = 'Cancel';
			document.getElementById('frmStaffRegistration').submit();	
		}
		
		function form_submitcheck() {
			if (validation()) {
				document.getElementById('frmStaffRegistration').submit();
			}
		}
		
		function validation() {
			var id = document.getElementById('id').value;
			var number = document.getElementById('MobileNumber').value;
			var password = '';
			if (id == 0) {
				password = document.getElementById('Password').value;
			}
			var pincode = document.getElementById('PinCode').value;
			var valid = true;

			var numbercheck = /[0-9]{10}$/;
			var pincheck = /[0-9]{6}$/;
			var passwordcheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

			if (numbercheck.test(number)) {
				document.getElementById('numbererror').innerHTML = " ";
			} else {
				document.getElementById('numbererror').innerHTML = " invalid phone number, only 10 digits allowed";
				valid = false;
			}

			if (pincheck.test(pincode)) {
				document.getElementById('pinerror').innerHTML = " ";
			} else {
				document.getElementById('pinerror').innerHTML = " invalid pincode, only 6 digits allowed";
				valid = false;
			}

			if (id == 0) {
				if (passwordcheck.test(password)) {
					document.getElementById('passerror').innerHTML = " ";
				} else {
					document.getElementById('passerror').innerHTML = " invalid password";
					valid = false;
				}
			}

			return valid;
		}
	</script>

	<%@ include file="Footer.jsp"%>
</body>
</html>