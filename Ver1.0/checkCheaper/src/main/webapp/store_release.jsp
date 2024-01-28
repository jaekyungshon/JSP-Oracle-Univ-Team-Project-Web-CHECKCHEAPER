<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<%
// 로그인 아이디
String storeID = (String)session.getAttribute("userID");

// DB 설정
PreparedStatement pstmt = null;
String sql = "SELECT orderdetail.ORDERDETAIL_ID, orderdetail.ORDR_ID, goods.GDS_NM, orderdetail.ORDERDETAIL_CNT, delivery.DELIVERY_BZENT_NM, delivery.DELIVERY_NUM "
		    +"FROM inventory, orderdetail, delivery, goods "
		    +"WHERE orderdetail.ORDR_ID=delivery.ORDR_ID and orderdetail.IVT_ID=inventory.IVT_ID and inventory.GDS_ID=goods.GDS_ID and "
		    +"orderdetail.RLS_FLAG=0 and inventory.FRCS_ID=?";
ResultSet rs = null;

// DB 실행
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, storeID);
rs=pstmt.executeQuery();

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
<!-- JS Function -->
<script>
	function confirmDialog(int flag){
		if(flag==1){
			alert("해당 상품을 출고 수락하였습니다.");
		}
		else{
			alert("해당 상품을 출고 거절하였습니다.");
		}
	}
</script>
</head>
<body>
	<%-- Navigation --%>
	<%@ include file="menu.jsp" %>
	<%-- Header --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-2"><strong>Release to your selling goods!</strong></h1>
		</div>
	</div>
	<%-- Header Section --%>
	<div class="container">
		<div class="container">
			<div class="text-center">
				<%
				out.println("<h3>");
				out.println("Hello, "+storeID+"! You can release to your selling-goods.");
				out.println("</h3>");
				%>
				<br><br>
			</div>
		</div>
	</div>
	<%-- Section --%>
	<hr>
	<section>
	<%
	String[] nameList = {"ORDR_ID","GDS_NM","ORDERDETAIL_CNT","DELIVERY_BZENT_NM","DELIVERY_NUM"};
	%>
		<div class="container">
			<table class="table table-striped table-hover" style="width:100%; text-align:center;">
				<thead>
					<tr>
					<%
					for(int i=0; i<nameList.length; i++){
					%>
						<th scope="col"><%=nameList[i] %></th>
					<%
					}
					%>
					<th scope="col">출고수락</th>
					<th scope="col">출고거절</th>
					</tr>
				</thead>
				<tbody>
				<%
				while(rs.next()){
					String orderdetail_id = rs.getString("ORDERDETAIL_ID");
				%>
					<tr>
				<%
					for(int i=0; i<nameList.length; i++){
						String e = rs.getString(nameList[i]);
				%>
						<td><%=e %></td>
				<%	
					}
				%>
					<td>
						<button type="button" class="btn btn-outline-success">
							<a href="store_release_process.jsp?rlsFlag=1&ordr=<%=orderdetail_id %>" onclick="confimDialog(1)">O</a>
						</button>
					</td>
					<td>
						<button type="button" class="btn btn-outline-danger">
							<a href="store_release_process.jsp?rlsFlag=0&ordr=<%=orderdetail_id %>" onclick="confimDialog(0)">X</a>
						</button>
					</td>
					</tr>
				<%
				}
				%>
				</tbody>
			</table>
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