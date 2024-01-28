<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="checkCheaper.Goods" %>
<%@ include file="dbConn.jsp" %>

<%-- 여기서, release 테이블에 레코드들을 삽입해야함. --%>
<%
String storeID = (String)session.getAttribute("userID");
int goodsCount = Integer.parseInt((String)session.getAttribute("tableNum"));
System.out.println("상품 요청 확인용: "+storeID);

PreparedStatement pstmt = null;
String sql="SELECT count(*) FROM releasehistory";
ResultSet rs = null;

int rl_id_idx = 0; // 요청DB 마지막 기본키
pstmt = conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	rl_id_idx=Integer.parseInt(rs.getString("count(*)"));
}

int gds_id_idx = 0; // 상품DB 마지막 기본키
sql="SELECT count(*) FROM goods";
pstmt = conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	gds_id_idx=Integer.parseInt(rs.getString("count(*)"));
}

int ivt_id_idx = 0; // 재고DB 마지막 기본키
sql="SELECT count(*) FROM inventory";
pstmt = conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	ivt_id_idx=Integer.parseInt(rs.getString("count(*)"));
}

for(int i=0; i<goodsCount; i++){
	String goodsName = request.getParameter("goodsName"+i);
	String maker = request.getParameter("maker"+i);
	String category = request.getParameter("category"+i);
	String inputQuantity = request.getParameter("inputQuantity"+i);
	String gradeLevel = request.getParameter("gradeLevel"+i);
	String price = request.getParameter("price"+i);
	
	sql="INSERT INTO releasehistory values(?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,rl_id_idx++);
	pstmt.setString(2,storeID);
	pstmt.setInt(3,gds_id_idx++);
	pstmt.setString(4,goodsName);
	pstmt.setString(5,maker);
	if(category.equals("0")){
		pstmt.setInt(6,0);
	}
	else{
		pstmt.setInt(6,1);
	}
	pstmt.setInt(7,ivt_id_idx++);
	pstmt.setInt(8,Integer.parseInt(inputQuantity));
	pstmt.setInt(9,Integer.parseInt(gradeLevel));
	pstmt.setInt(10,Integer.parseInt(price));
	pstmt.setInt(11,0);
	pstmt.executeUpdate();
	System.out.println("releasehistory 삽입 완료: "+goodsName);
	System.out.println(goodsName+" "+maker+" "+category+" "+inputQuantity+" "+gradeLevel+" "+price);
}
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
	<%--여기서 운영자에게 요청 완료됬다고 안내 메시지 출력해야함. --%>
	<%-- Navigation --%>
	<%@ include file="menu.jsp" %>
	<%-- Header --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-2"><strong>Success to request!</strong></h1>
		</div>
	</div>
	<%-- Header Section --%>
	<div class="container">
		<div class="container">
			<div class="text-center">
				<%
				out.println("<h3>");
				out.println("Hello, "+storeID+"! After manager checks and confirms, the update will proceed.");
				out.println("</h3>");
				%>
				<br><br>
			</div>
		</div>
	</div>
	<%-- Section --%>
	<section>
		<div class="container">
			<div class="alert alert-success" role="alert">
			  <h4 class="alert-heading">요청 성공!</h4>
			  <p>운영자가 처리하면, 개인 연락처로 DB 업데이트 완료 알림을 드립니다.</p>
			</div>
			<div class="container" style="display:flex; justify-content:center; margin-top:20px;">
				<button type="button" class="btn btn-outline-dark">
					<a href="dash.jsp?flag=0">Home으로 돌아가기</a>
				</button>
			</div>
		</div>
	</section>
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