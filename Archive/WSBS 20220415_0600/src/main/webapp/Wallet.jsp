<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Iterator"%>
<%@page import="bitshyd.dbmsproject.web.model.WalletTransaction"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% 
if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null 
	|| !session.getAttribute("UserRole").toString().equalsIgnoreCase("Customer")){
	response.sendRedirect("Error.jsp"); 
}
	ArrayList<WalletTransaction> arrTransactions = (ArrayList<WalletTransaction>) request.getAttribute("model");
	int WalletBalance = Integer.parseInt(request.getAttribute("WalletBalance").toString());
%>
<!doctype html>
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
<link rel="stylesheet" href="assets/css/wallet2.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">
<title>Wallet</title>


<style>
body {
	background: #74ebd5; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ACB6E5, #74ebd5);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	font-family: 'Roboto Condensed', sans-serif;
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

table {
	text-align: center;
}

td {
	color: #4c4a37;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 18px;
	line-height: 32px;
}
</style>
</head>

<body>
	<div class="dash">
		<%@ include file="CustomerSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>
			<main class="dash-content">
				<form id="frmWallet" name="frmWallet" method="post" action="Wallet">
					<h2 class="display-4"
						style="text-align: center; color: black; font-weight: bold;">My
						Wallet</h2>
					<div align="center" class="amount-box">
						<img style="width: 50px"
							src="https://lh3.googleusercontent.com/ohLHGNvMvQjOcmRpL4rjS3YQlcpO0D_80jJpJ-QA7-fQln9p3n7BAnqu3mxQ6kI4Sw"
							alt="wallet">
					</div>
					<div class="container-fluid">
						<div align="center">
							<br />
							<h3>Wallet Balance</h3>
							<p class="amount">
								<B>Rs. <%=WalletBalance %></B>
							</p>
							<label for="addamount">Add Amount</label> <input type="number"
								id="addamount" name="addamount" /> &nbsp;&nbsp;&nbsp; <input
								type="submit" class="button-81" id="btnAdd" name="btnAdd"
								value="Add" onclick="javascript:return form_submit()" />
							<div id="addAmounterror" Style="color: red;"></div>

						</div>
						<br />
						<div align="center">
							<h2 align="center">Transaction History</h2>
							<% if (arrTransactions != null && !arrTransactions.isEmpty()){%>
							<table class="table table-hover table-bordered">
								<thead class="thead-dark" style="text-align: center">
									<tr>
										<th>Transacted TS</th>
										<th>Transaction</th>
										<th>Amount</th>
										<th>Status</th>
									</tr>
								</thead>
								<%for (Iterator<WalletTransaction> i=arrTransactions.iterator(); i.hasNext();){
								WalletTransaction objTransaction = i.next();%>
								<tr>
									<td><%=objTransaction.getTimeCreate().toString()%></td>
									<td><%=objTransaction.getTransactionText() %></td>
									<td
										Style="text-align:right;<%=(objTransaction.getAmount() < 0 ? "color:red;":"color:green;")%>"><%=objTransaction.getAmount()%></td>
									<td><%=(objTransaction.getTransactionSuccess() > 0 ? "Success": "Failed")%></td>
								</tr>
								<% }%>
							</table>
							<%  
							}
							%>
						</div>

					</div>
				</form>
			</main>
		</div>
	</div>
	<script>
	function form_submit(){
		var addAmount = document.getElementById('addamount').value;
		if (addAmount < 50){
			document.getElementById('addAmounterror').innerHTML = " Minimum amount that can be added is Rs.50";
			return false;
		}
		return true;
	}
	
	</script>

	<%@ include file="Footer.jsp"%>
</body>
</html>