<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<!-- Bootstrap CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-
pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-
xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>
	<%-- CSS Container : Responsive Web Design --%>
	<div id="wrap" style="margin-top:20px">
		<%-- Header --%>
		<%@ include file="header.jsp" %>
		<%-- Header Section --%>
		<div class="container">
			<div class="container">
				<div class="text-center">
					<h3>If you want to use CheckCheaper, you should login!</h3>
					<br><br>
				</div>
			</div>
		</div>
		<%-- Content Section(Can be Many Page)--%>
		<section>
		<form action="login_process.jsp" name="login_info" method="get">
			<div class="form-floating mb-3">
			  <input type="text" class="form-control" name="i_id" id="floatingInput" placeholder="mbr0">
			  <label for="floatingInput">ID</label>
			</div>
			<div class="form-floating">
			  <input type="password" class="form-control" name="i_pw" id="floatingPassword" placeholder="Password">
			  <label for="floatingPassword">Password</label>
			</div>
			<div class="form-floating">
				<button type="submit" class="btn btn-dark">login</button>
			</div>
		</form>
		</section>
		<%--Footer --%>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>