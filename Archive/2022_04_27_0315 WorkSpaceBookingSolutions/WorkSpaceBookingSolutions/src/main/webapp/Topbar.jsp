<header class="dash-toolbar">
	<a href="#!" class="menu-toggle"> <i class="fas fa-bars whitecolor"></i>
	</a> <span style="color: white; font-size: x-large;">Welcome <%=session.getAttribute("Name").toString() %></span>

	<div class="tools">

		<div class="dropdown tools-item">

			<a href="#" class="" id="dropdownMenu1" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" onclick="openForm()">
				<!-- <button class="open-button" onclick="openForm()"> --> <i
				class="fas fa-user whitecolor"></i>
			<!-- </button> -->
			</a>

			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="dropdownMenu1">
				<!-- <a class="dropdown-item" href="Profile.jsp" > -->




				<div class="form-popup" id="myForm">
					<div class="cards">
						<header>
							<span class="mdi mdi-arrow-left mdi-24px"></span> <span
								class="mdi mdi-dots-horizontal mdi-24px"></span>
						</header>
						<main>
							<img
								src="https://www.prajwaldesai.com/wp-content/uploads/2021/02/Find-Users-Last-Logon-Time-using-4-Easy-Methods.jpg"
								alt="">
							<h2><%=session.getAttribute("Username").toString() %></h2>
							<div class="actions">
								<button class="main">Edit Details</button>
								<button class="main"
									onClick="javascript:window.location.href='Home'">
									Logout <i class="fas fa-sign-out-alt"></i>
								</button>

							</div>
						</main>
					</div>
				</div>

			</div>
		</div>
	</div>
</header>