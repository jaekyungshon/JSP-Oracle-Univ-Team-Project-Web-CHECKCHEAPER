<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="checkCheaper.Goods" %>
<%@ include file="dbConn.jsp" %>
<%
String adminID = (String)session.getAttribute("userID");
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
<script>
	function confirmA(int flag){
		if(flag==1){
			alert("해당 신상품을 상품 테이블에 업로드하였습니다.");
		}
		else{
			alert("해당 신상품은 심사 거절되었습니다.");
		}
	}
</script>
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
			<h1 class="display-2"><strong>Confirm to request goods!</strong></h1>
		</div>
	</div>
	<%-- Header Section --%>
	<div class="container">
		<div class="container">
			<div class="text-center">
				<%
				out.println("<h3>");
				out.println("Hello, "+adminID+"! Please to check request goods from store.");
				out.println("</h3>");
				%>
				<br><br>
			</div>
		</div>
	</div>
	<%-- Section --%>
	<div class="container">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">신상품명</th>
					<th scope="col">판매자(점)</th>
					<th scope="col">카테고리</th>
					<th scope="col">품질</th>
					<th scope="col">재고수량</th>
					<th scope="col">가격(단가)</th>
					<th scope="col">버튼</th>
					<th scope="col">버튼</th>
				</tr>
			</thead>
			<tbody>
				<%
				PreparedStatement pstmt = null;
				String sql = "SELECT * from releasehistory";
				ResultSet rs = null;
				
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					String category = rs.getString("CTGRY_ID");
					String gradeLevel = rs.getString("IVT_GRD_LEVEL");
				%>
					<tr>
						<td><%=rs.getString("RL_ID") %></td>
						<td><%=rs.getString("GDS_NM") %></td>
						<td><%=rs.getString("FRCS_ID") %></td>
						<td>
						<%
							if(category.equals("0")) out.println("채소");
							else out.println("과일");
						%>
						</td>
						<td>
						<%
							if(gradeLevel.equals("0")) out.println("최상급~상급");
							else if(gradeLevel.equals("1")) out.println("상급~중급");
							else out.println("중급~하급");
						%>
						</td>
						<td><%=rs.getString("IVT_CNT") %></td>
						<td><%=rs.getString("IVT_GDS_AMT") %>원</td>
						<td>
							<button type="button" class="btn btn-outline-primary" onclick="confirmA(1)">
								<a href="confirm_request_goods_process.jsp?btnFlag=1&RL_ID=<%=rs.getString("RL_ID") %>">수락</a>
							</button>
						</td>
						<td>
							<button type="button" class="btn btn-outline-danger" onclick="confirmA(0)">
								<a href="confirm_request_goods_process.jsp?btnFlag=0&RL_ID=<%=rs.getString("RL_ID") %>">거절</a>
							</button>
						</td>
					</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
<%
if(rs!=null){
	rs.close();
}
if(pstmt!=null){
	pstmt.close();
}
if(conn!=null){
	conn.close();
}
%>