<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="checkCheaper.Goods" %>
<%@ include file="dbConn.jsp" %>

<%
String userID = (String)session.getAttribute("userID");
int tableNum=0;
String sessionTableNum = (String)session.getAttribute("tableNum");
if(sessionTableNum==null){
	tableNum=0;
}
else{
	tableNum=Integer.parseInt(sessionTableNum);
}
System.out.println("tableNum: "+tableNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CheckCheaper</title>
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
<link rel="stylesheet" href="css/footer.css" type="text/css">
<link rel="stylesheet" href="css/dash_section_input.css" type="text/css">
</head>
<body>
	<%-- Navigation --%>
	<%@ include file="menu.jsp" %>
	<%-- Header --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-2"><strong>Request New Goods</strong></h1>
		</div>
	</div>
	<%-- Header Section --%>
	<div class="container">
		<div class="container">
			<div class="text-center">
				<%
				out.println("<h3>");
				out.println("Hello, "+userID+"! You can request new goods to manager!");
				out.println("</h3>");
				%>
				<br><br>
			</div>
		</div>
	</div>
	<hr>
	<%-- Section --%>
	<div class="container">
		<button type="button" class="btn btn-outline-dark" style="float:right; margin-bottom:20px">
			<a href="request_goods_btn.jsp?num=<%=tableNum %>">상품 입력 추가하기</a>
		</button>
		<form action="request_goods_process.jsp">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">상품명(String)</th>
						<th scope="col">제조업체(String)</th>
						<th scope="col">품목(String)</th>
						<th scope="col">재고수량(int)</th>
						<th scope="col">품질(int)</th>
						<th scope="col">단가(int)</th>
					</tr>
				</thead>
				<tbody>
					<%
					for(int i=0; i<tableNum; i++){
					%>
						<tr>
							<td><%=i %></td>
							<td><input type="text" class="form-control" name="goodsName<%=i%>"></td>
							<td><input type="text" class="form-control" name="maker<%=i%>"></td>
							<td><input type="text" class="form-control" name="category<%=i%>"></td>
							<td><input type="text" class="form-control" name="inputQuantity<%=i%>"></td>
							<td><input type="text" class="form-control" name="gradeLevel<%=i%>"></td>
							<td><input type="text" class="form-control" name="price<%=i%>"></td>
							<td><input type="hidden" name="goodsCount<%= tableNum%>"></td>
						</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<div class="container" style="display:flex; justify-content:center; margin-top:20px;">
				<button type="submit" class="btn btn-outline-dark">요청하기</button>
			</div>
		</form>
	</div>
</body>
</html>