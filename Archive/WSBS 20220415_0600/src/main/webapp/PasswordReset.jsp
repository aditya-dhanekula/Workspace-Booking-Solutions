<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bitshyd.dbmsproject.web.model.User"%>
<!DOCTYPE html>
<%
User objUser = (User) request.getAttribute("model");
%>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="assets/css/spur.css">
<title>Reset Password</title>
<style>
body {
	background: #74ebd5; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ACB6E5, #74ebd5);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
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

.button {
	width: 120px;
	height: 40px;
	cursor: pointer;
	font-size: 20px;
	font-weight: bold;
	color: black;
	background: #CFE2F7;
	border: 2px solid black;
	box-shadow: 5px 5px 0 black, -5px -5px 0 black, -5px 5px 0 black, 5px
		-5px 0 black;
	transition: 500ms ease-in-out;
}

td {
	color: black;
}
}
</style>
</head>

<body>
	<br />
	<br />
	<h1>RESET PASSWORD</h1>
	<br />
	<%if (objUser.getUserId()> 0) {%>
	<p align="center">
		<br />
		<br />New password updated Successfully!! Click the below link to
		login. <br /> <a href="Login">Login</a>
	</p>
	<%}
	else {
	%>
	<form id="frmPasswordReset" name="frmPasswordReset"
		action="PasswordReset" method="post">
		<table align="center" cellpadding="10">
			<tr>
				<td colspan="2" align="center"></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><input type="text" id="username" name="username"
					value="<%=objUser.getUsername()%>" />
					<div id="usernameerror" style="color: red;"></div></td>
			</tr>
			<tr>
				<td>New Password</td>
				<td><input type="password" id="password" name="password" />
					<div id="passworderror" style="color: red;"></div></td>
			</tr>
			<tr>
				<td>Confirm Password</td>
				<td><input type="password" id="confirmPassword"
					name="confirmPassword" />
					<div id="confirmpassworderror" style="color: red;"></div></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div id="submiterror" style="color: red;"><%=objUser.getErrorMsg() %></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					id="btnResetPassword" name="btnResetPassword" class="button"
					onclick="javascript:form_resetPasswordCheck()" value="Submit" /></td>
			</tr>
		</table>
		<input type="hidden" id="actionType" name="actionType" value="save">
		<input type="hidden" id="key" name="key"
			value="<%=objUser.getFirstName()%>">
	</form>

	<script type="text/javascript">
		function form_resetPasswordCheck(){
			var valid=true;
			var username = document.getElementById('username').value;
			var password = document.getElementById('password').value;
			var confirmPassword = document.getElementById('confirmPassword').value;
			document.getElementById('submiterror').innerHTML = "";
			document.getElementById('usernameerror').innerHTML = "";
			document.getElementById('passworderror').innerHTML = "";
			document.getElementById('confirmpassworderror').innerHTML = "";	
			var passwordcheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
			
			if (username == null || username.trim() == "" ){
				document.getElementById('usernameerror').innerHTML = " Username is required ";
				valid=false; 				
			}
			if (password == null || password.trim() == ""){
				document.getElementById('passworderror').innerHTML = " New Password is required ";
				valid=false;
			}
			if (confirmPassword == null || confirmPassword.trim() == ""){
				document.getElementById('confirmpassworderror').innerHTML = " Confirm Password is required ";
				valid=false;
			}
			if (valid == false){
				
			}
			else if (!passwordcheck.test(password)) {
				document.getElementById('passworderror').innerHTML = " invalid password";
				valid=false;
			} 
			else if(password != confirmPassword){
				document.getElementById('confirmpassworderror').innerHTML = " password and confirm password do not match";
				valid=false;
			}
			if (valid== true){
				document.getElementById('frmPasswordReset').submit();
			}
		}
	</script>
	<%} %>
</body>
</html>