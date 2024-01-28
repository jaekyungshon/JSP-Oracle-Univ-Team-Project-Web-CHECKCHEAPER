<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="container">
	<div class="container">
		<div class="text-center">
			<%
			String userID = (String)session.getAttribute("userID");
			out.println("<h3>");
			out.println("Hello, "+userID+"! You can check to your buying cart!");
			out.println("</h3>");
			%>
			<br><br>
		</div>
	</div>
</div>