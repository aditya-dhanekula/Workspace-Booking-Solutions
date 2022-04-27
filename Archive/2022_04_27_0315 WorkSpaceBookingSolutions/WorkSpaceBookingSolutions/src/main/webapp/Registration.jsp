<%@page import="java.sql.Date"%>
<%@page import="bitshyd.dbmsproject.web.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User objUser = (User) request.getAttribute("model");
String OTPDivDisplayStyle = "Block";
String RegDivDisplayStyle = "Block";

if (objUser.getOTP() == "") {
	OTPDivDisplayStyle = "None";
	objUser.setUserPassword("");
} else {

	RegDivDisplayStyle = "None";
}
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<!--meta tag to make site responsive-->
<meta http-equiv="X-UA-Compatible" contents="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Membership/Login</title>
<link rel="stylesheet" href="assets/css/styles.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link
	href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>




<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.loginpage {
	width: 360px;
	padding: 2% 0 0;
	margin: auto;
	/* background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4bpTKyoUO1rY2YNXKIz4MIh7lQdXvUD90f49gl2hUK1nQA8mr-FUKKktdEDGuVxe5DDc&usqp=CAU"); */
}

.forms {
	position: absolute; /*was relative*/
	z-index: 1;
	background-color: var(- -first-color-lighten);
	border-radius: 1rem;
	max-width: 360px;
	width: 100%;
	margin: 0 auto 100px;
	padding: 2rem 1rem;
	text-align: center;
	box-shadow: 0 8px 20px rgba(35, 0, 77, .2);
	animation-duration: .4s;
	animation-name: animate-login;
}

/* .forms input{
	font-family: "Roboto", sans-serif;
	font-weight: bold;
	background: #F5B7B1 ;
	width: 100%;
	color: black;
	margin: 0 0 15px;
	font-size: 14px;
	padding: 10px;
border: 3px dotted purple;
border-radius: 25px;
} */

.login__input {
	border: none;
	outline: none;
	font-size: var(- -normal-font-size);
	font-weight: 700;
	color: var(- -first-color-dark);
}

.login__input::placeholder {
	font-size: var(- -normal-font-size);
	font-family: var(- -body-font);
	color: var(- -first-color-light);
}
</style>

</head>

<body>

	<div class="container">
		<div class="loginpage">
			<div class="forms">
				<form id="registration" method="post" action="register">
					<!-- registrationForm -->
					<h2>Registraation</h2>
					<div id="registration" style="display: <%=RegDivDisplayStyle%>">
						<div class="left-box">
							<!-- <h1 class="login__title">Create Account</h1> -->
							<div class="login__box">
								<i class='bx bx-user login__icon'></i> <input type="text"
									id="firstname" name="firstname" placeholder="First Name"
									class="login__input" required
									value="<%=objUser.getFirstName()%>">
							</div>

							<div class="login__box">
								<i class='bx bx-user login__icon'></i> <input type="text"
									id="lastname" name="lastname" placeholder="Last name"
									class="login__input" value="<%=objUser.getLastName()%>">
							</div>
							<div class="login__box">
								<i class='bx bx-user login__icon'></i> <input type="date"
									id="birthday" name="birthday" class="login__input"
									style="color: var(- -first-color-light);"
									value="<%=objUser.getDOB()%>">

							</div>
							<div class="login__box">

								<i class='bx bx-user login__icon'></i>
								<table>
									<tr>
										<td><input type="radio" id="rdMale" name="Gender"
											value="Male"
											<%=(objUser.getGender().equalsIgnoreCase("Male") ? "checked": "")%>
											class="login__input" />
											<div
												style="color: var(- -first-color-light); font-size: var(- -normal-font-size); font-family: var(- -body-font);">Male</div>
										</td>
										<td><input type="radio" id="rdFemale" name="Gender"
											value="Female"
											<%=(objUser.getGender().equalsIgnoreCase("Female") ? "checked": "")%>
											class="login__input" />
											<div
												style="color: var(- -first-color-light); font-family: var(- -body-font);">Female</div></td>
									</tr>
								</table>
							</div>

							<div class="login__box">
								<i class='bx bxs-user-circle login__icon'></i> <input
									type="text" id="username" name="username"
									placeholder="Username" class="login__input"
									value="<%=objUser.getUsername()%>">
							</div>
							<div id="usererror" style="color: red;"></div>

							<div class="login__box">
								<i class='bx bx-lock-alt login__icon'></i> <input
									type="password" id="password" name="password"
									placeholder="Password" class="login__input"
									value="<%=objUser.getUserPassword()%>">
							</div>
							<div id="passerror" style="color: red;"></div>

							<div class="login__box">
								<i class='bx bx-lock-alt login__icon'></i> <input
									type="password" id="confirmpassword" name="confirmpasswd"
									placeholder="Confirm Password" class="login__input">
							</div>

						</div>

						<div class="right-box">
							<div class="login__box">
								<i class='bx bx-at login__icon'></i> <input type="email"
									id="emailid" name="emailid" placeholder="Email ID"
									class="login__input" value="<%=objUser.getEmailID()%>">
							</div>
							<div id="emailerror" style="color: red;"></div>


							<div class="login__box">
								<i class='bx bx-phone login__icon'></i> <input type="number"
									id="phoneno" name="phoneno" placeholder="Mobile number"
									class="login__input" value="<%=objUser.getPhoneNo()%>">
							</div>
							<div id="numbererror" style="color: red;"></div>
							<div class="login__box">
								<i class='bx bx-home login__icon'></i> <input type="text"
									id="address" name="address" placeholder=" Residential Address"
									class="login__input"
									value="<%=objUser.getResidentialAddress()%>">
							</div>

							<div class="login__box">
								<i class='bx bx-home login__icon'></i> <input type="text"
									id="city" name="City" placeholder=" City" class="login__input"
									value="<%=objUser.getCity()%>">
							</div>

							<div class="login__box">
								<i class='bx bx-home login__icon'></i> <input type="text"
									name="Pincode" placeholder=" Pincode" class="login__input"
									value="<%=objUser.getPincode()%>">
							</div>
 						</div>
						<div style="color: red;">
							<%=objUser.getErrorMsg()%>
						</div>
						<a href="javascript:form_submitcheck()" class="login__button" >SIGN UP</a>
						<div>
							<span class="login__account">Already have an Account ?</span> <a
								href="Registration"> <span class="login__signup"
								id="sign-in">Sign In</span></a>
						</div>
					</div>

					<div id="divotp" style="Display:<%=OTPDivDisplayStyle%>;">
						<input type="text" id="OTP" name="OTP" placeholder="OTP"
							class="login__input" />
						<div style="color: red;">
							<%=objUser.getErrorMsg()%>
						</div>
						<input type="hidden" name="userType" value="13"> <a
							href="javascript:form_submitcheck()" class="login__button">Submit</a>
					</div>
				</form>

			</div>
		</div>
	</div>


	<script type="text/javascript">
function form_submitcheck()
{
	//document.getElementById('registration').submit();
	
	if(validation()){
		document.getElementById('registration').submit();
	}
}

function validation(){
var username = document.getElementById('username').value;
var email = document.getElementById('emailid').value;
var number = document.getElementById('phoneno').value;
var password = document.getElementById('password').value;
var valid=true;
var usercheck = /^[A-Za-z]{3,30}$/;
var emailcheck = /^[A-Za-z0-9_.]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{2,6}$/;
var numbercheck = /^[6789][0-9]{9}$/; 
var passwordcheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
if (usercheck.test(username)){
	document.getElementById('usererror').innerHTML = " ";
}
else{
	document.getElementById('usererror').innerHTML = " user name is invalid";
	valid= false;
}

if (emailcheck.test(email)){
	document.getElementById('emailerror').innerHTML = " ";
}
else{
	document.getElementById('emailerror').innerHTML = " invalid email id";
	valid=false;
}

if (numbercheck.test(number)){
	document.getElementById('numbererror').innerHTML = " ";
}
else{
	document.getElementById('numbererror').innerHTML = " invalid phone number, only 10 digits allowed";
	valid= false;
}

if (passwordcheck.test(password)){
	document.getElementById('passerror').innerHTML = " ";
}
else{
	document.getElementById('passerror').innerHTML = " invalid password";
	valid= false;
}
return valid;
}



</script>

	<script type="text/javascript">

const scriptURL='https://script.google.com/macros/s/AKfycbwVX6xKvrMemem3nr6qIKlWSlYoMWsK8J3iTrDTfKCnwVzXQVYPipdJvfydvd3OFEBbpg/exec'	

const form = document.forms['registration']

form.addEventListener('submit', e => {
              e.preventDefault()
              fetch(scriptURL, { method: 'POST', body: new FormData(form)})
                .then(response => alert("Thanks for Registering with us ! We Will Contact You Soon..."))
                .catch(error => console.error('Error!', error.message))
            })

 </script>
</body>
</html>
