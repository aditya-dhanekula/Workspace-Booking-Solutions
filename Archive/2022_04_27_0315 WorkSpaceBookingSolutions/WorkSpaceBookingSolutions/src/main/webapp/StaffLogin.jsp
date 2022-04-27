<%@page import="bitshyd.dbmsproject.web.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%User objUser= (User) request.getAttribute("model"); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- ===== CSS ===== -->
<link rel="stylesheet" href="assets/css/styles.css">

<link rel="stylesheet" type="text/css"
	href="assets/css/loginsignup1.css">

<!-- ===== BOX ICONS ===== -->
<link
	href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>

<title>Staff Login Form</title>


<style>
/* body{
background-image: url("https://stimg.cardekho.com/images/carexteriorimages/930x620/Bentley/Flying-Spur/7776/1587104359393/front-left-side-47.jpg?tr=h-48");
  background-repeat: no-repeat;
   background-attachment: fixed;
  background-size: cover;
  
} */
/* .login__content{
opacity: 1;
} */
</style>

</head>
<body>
	<div class="container">
		<div class="forms-container">
			<div class="signin-signup">
				<form id="frmlogin" name="frmlogin" method="post" action="StaffLogin">
					<h2 class="title">Staff Login</h2>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" id="username"
							name="username" placeholder="Username"
							value="<%=objUser.getUsername()%>">
					</div>

					<div class="input-field">
						<i class="fas fa-user"></i> <input type="password" id="passwd"
							name="passwd" placeholder="Password">
					</div>
					<br> <a href="javascript:form_submit('fp')">Forgot password?</a><br>
					<div id="errormsg" style="color: red;"><%=objUser.getErrorMsg() %></div>
					<input type="submit" value="Login" class="btn solid"
						onclick="javascript:form_submit('StaffLogin');" />
					<input type="hidden" id="actionType" name="actionType"
						value="StaffLogin" />
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function form_submit(actionType){
		var username= document.getElementById("username").value.trim();
		var passwd= document.getElementById("passwd").value.trim();
		var objError= document.getElementById("errormsg");
		
		objError.innerHTML ="";
		
		if (actionType == "fp"){
			if (username == ""){
				objError.innerHTML = " Username is required to reset password ";
				return false;
			}
		}
		else{
			if (username == ""){
				objError.innerHTML = " Username is required ";
				return false;
			}
			else if(passwd = ""){
				objError.innerHTML = " Password is required ";
				return false;	
			}
					
		}
		document.getElementById("actionType").value=actionType;		
		document.getElementById('frmlogin').submit();
	}
	
	</script>
</body>
</html>