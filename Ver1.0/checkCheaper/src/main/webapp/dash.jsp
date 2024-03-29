<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
session.removeAttribute("tableNum");
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
	<%-- CSS Container : Responsive Web Design --%>
	<div id="wrap">
		<%-- Header --%>
		<%@ include file="header.jsp" %>
		<%-- Header Section --%>
		<%@ include file="header_section.jsp" %>
		<%-- Content Section(Can be Many Page)--%>
		<%@ include file="dash_section_input.jsp" %>
		<%
		boolean isInputProcessed = true;
		String flag = request.getParameter("flag");
		if(flag!=null && flag.equals("1")){
			isInputProcessed=true;
		}
		else{
			isInputProcessed=false;
		}
		if(isInputProcessed){
			%>
			<%@ include file="dash_section_price.jsp" %>
			<%
		}
		%>
		<%--Footer --%>
		<%@ include file="footer.jsp" %>
	</div>
	<%--세션 값 확인용 --%>
	<%
	String userid=(String)session.getAttribute("userID");
	String usertype=(String)session.getAttribute("userType");
	System.out.println(userid+" "+usertype);
	System.out.println("==================================");
	%>
</body>
</html>