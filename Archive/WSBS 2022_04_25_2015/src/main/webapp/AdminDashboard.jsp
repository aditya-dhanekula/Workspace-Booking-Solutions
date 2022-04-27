<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Admin")){
	response.sendRedirect("Error.jsp");
}
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
<script src="assets/js/chart-js-config.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="assets/plugins/fontawesome-free/css/all.min.css">

<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet" href="assets/css/profile1.css">
<link rel="stylesheet" href="assets/css/adminlte.min.css">
<link rel="stylesheet" href="assets/css/cpscommon.css">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>

<title>Work Space Booking Solutions</title>

<style>

/* ::selection {
  color: black;

} */
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
</style>
</head>

<body>
	<div class="dash">
		<%@ include file="AdminSideMenu.jsp"%>
		<div class="dash-app">
			<%@ include file="Topbar.jsp"%>

			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="">
						<div class="">
							<h2 class="display-4"
								style="text-align: center; color: black; font-weight: bold;">Dashboard</h2>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- Small boxes (Stat box) -->
					<div class="row">
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-dark">
								<div class="inner">
									<h3>7</h3>

									<p>Total Locations</p>
								</div>
								<div class="icon">
									<i class="fa fa-book"></i>
								</div>
								<a href="Location" class="small-box-footer">More info
									<i class="fas fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-teal">
								<div class="inner">
									<h3>
										120<sup style="font-size: 20px"></sup>
									</h3>

									<p>Total Work Spaces</p>
								</div>
								<div class="icon">
									<i class="fa fs-workspace"></i>
								</div>
								<a href="WorkSpace" class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-primary">
								<div class="inner">
									<h3>
										39<sup style="font-size: 20px"></sup>
									</h3>

									<p>Staff Count</p>
								</div>
								<div class="icon">
									<i class="fa fa-car"></i>
								</div>
								<a href="Staff" class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-gray">
								<div class="inner">
									<h3>
										169<sup style="font-size: 20px;"></sup>
									</h3>

									<p>User Count</p>
								</div>
								<div class="icon">
									<i class="fa fa-users"></i>
								</div>
								<a href="SearchCustomer" class="small-box-footer">More info
									<i class="fas fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
					</div>
					<!-- /.row -->
					<!-- Main row -->
					<div class="row"></div>
					<!-- /.row (main row) -->
					<main class="dash-content">
						<div class="container-fluid">
							<!-- h1 class="dash-title">Chart.js</h1>
		                    <p class="mb-5"> These charts are made using the Chart.js library. You can find more examples and ways to configure the charts in the <a href="http://chartjs.org" target="_blank">Chart.js Documentation</a>. </p> -->
							<div class="row">
								<div class="col-xl-6">
									<div class="card spur-card">
										<div class="card-header">
											<div class="spur-card-icon">
												<i class="fas fa-chart-bar"></i>
											</div>
											<div class="spur-card-title">Booking Statistics</div>
											<!-- <div class="spur-card-menu">
		                                        <div class="dropdown show">
		                                            <a class="spur-card-menu-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                            </a>
		                                            
		                                        </div>
		                                    </div> -->
										</div>
										<div class="card-body spur-card-body-chart">
											<canvas id="spurChartjsTwoBars"></canvas>
											<script>
		                                        var ctx = document.getElementById("spurChartjsTwoBars").getContext('2d');
		                                        var myChart = new Chart(ctx, {
		                                            type: 'bar',
		                                            data: {
		                                                labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
		                                                datasets: [{
		                                                    label: 'Blue',
		                                                    data: [12, 19, 3, 5, 2],
		                                                    backgroundColor: window.chartColors.primary,
		                                                    borderColor: 'transparent'
		                                                }, {
		                                                    label: 'Red',
		                                                    data: [4, 12, 11, 2, 14],
		                                                    backgroundColor: window.chartColors.danger,
		                                                    borderColor: 'transparent'
		                                                }]
		                                            },
		                                            options: {
		                                                legend: {
		                                                    display: false
		                                                },
		                                                scales: {
		                                                    yAxes: [{
		                                                        ticks: {
		                                                            beginAtZero: true
		                                                        }
		                                                    }]
		                                                }
		                                            }
		                                        });
		                                    </script>
										</div>
									</div>
								</div>
								<div class="col-xl-6">
									<div class="card spur-card">
										<div class="card-header">
											<div class="spur-card-icon">
												<i class="fas fa-chart-bar"></i>
											</div>
											<div class="spur-card-title">Daily Revenue</div>

										</div>
										<div class="card-body spur-card-body-chart">
											<canvas id="spurChartjsDougnut"></canvas>
											<script>
		                                        var ctx = document.getElementById("spurChartjsDougnut").getContext('2d');
		                                        var myChart = new Chart(ctx, {
		                                            type: 'doughnut',
		                                            data: {
		                                                labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
		                                                datasets: [{
		                                                    label: 'Week',
		                                                    data: [12, 19, 3, 5, 50],
		                                                    backgroundColor: [
		                                                        window.chartColors.primary,
		                                                        window.chartColors.secondary,
		                                                        window.chartColors.success,
		                                                        window.chartColors.superwarning,
		                                                        window.chartColors.info,
		                                                    ],
		                                                    borderColor: '#fff',
		                                                    fill: false
		                                                }]
		                                            },
		                                            options: {
		                                                legend: {
		                                                    display: false
		                                                }
		                                            }
		                                        });
		                                    </script>
										</div>
									</div>
								</div>

							</div>

						</div>
						<form id="AdminDashBoard" method="post" action="Dashboard">
							<input type="submit" class="button-81" value="Send Feedback Request Emails" />
						</form>
					</main>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
	</div>

	<!-- ./wrapper -->
	<%@ include file="Footer.jsp"%>


	<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>

</body>
</html>