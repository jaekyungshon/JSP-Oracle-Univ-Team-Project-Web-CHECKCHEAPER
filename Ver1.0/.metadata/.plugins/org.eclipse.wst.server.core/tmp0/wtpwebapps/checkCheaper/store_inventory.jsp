<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="checkCheaper.SellingGoods" %>
<%@ include file="dbConn.jsp" %>
<%
String storeID = (String)session.getAttribute("userID");
PreparedStatement pstmt = null;
String sql="";
ResultSet rs=null;

ArrayList<SellingGoods> list = new ArrayList<>();

// 로그인 판매점이 판매중인 상품들 가져오기
sql = "SELECT IVT_ID, IVT_CNT, IVT_GRD_LEVEL, IVT_GDS_AMT, IVT_GDS_ORDR_CNT, inventory.GDS_ID, inventory.FRCS_ID, GDS_NM, FRCS_NM, FRCS_CO_ADDR "
    + "FROM inventory, goods, franchise "
    + "WHERE goods.GDS_ID=inventory.GDS_ID and inventory.FRCS_ID=? and franchise.FRCS_ID=inventory.FRCS_ID";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,storeID);
rs=pstmt.executeQuery();

while(rs.next()) {
	SellingGoods tmp = new SellingGoods();
	tmp.setIVT_ID(Integer.parseInt(rs.getString("IVT_ID")));
	tmp.setIVT_CNT(Integer.parseInt(rs.getString("IVT_CNT")));
	tmp.setIVT_GRD_LEVEL(Integer.parseInt(rs.getString("IVT_GRD_LEVEL")));
	tmp.setIVT_GDS_AMT(Integer.parseInt(rs.getString("IVT_GDS_AMT")));
	tmp.setIVT_GDS_ORDR_CNT(Integer.parseInt(rs.getString("IVT_GDS_ORDR_CNT")));
	tmp.setGDS_ID(Integer.parseInt(rs.getString("GDS_ID")));
	tmp.setFRCS_ID(rs.getString("FRCS_ID"));
	tmp.setFRCS_NM(rs.getString("FRCS_NM"));
	tmp.setFRCS_CO_ADDR(rs.getString("FRCS_CO_ADDR"));
	tmp.setGDS_NM(rs.getString("GDS_NM"));
	list.add(tmp);
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
	<%-- Navigation --%>
	<%@ include file="menu.jsp" %>
	<%-- Header --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-2"><strong>Manage to your selling goods!</strong></h1>
		</div>
	</div>
	<%-- Header Section --%>
	<div class="container">
		<div class="container">
			<div class="text-center">
				<%
				out.println("<h3>");
				out.println("Hello, "+storeID+"! You can manage to your goods-inventory.");
				out.println("</h3>");
				%>
				<br><br>
			</div>
		</div>
	</div>
	<%-- Section --%>
	<hr>
	<section>
		<div class="container" style="max-width:80%;">
			<table class="table table-striped table-hover" style="width:100%;">
				<thead>
					<tr>
						<th scope="col">재고코드</th>
						<th scope="col">판매자(점)</th>
						<th scope="col">판매주소</th>
						<th scope="col">상품명</th>
						<th scope="col">가격(단가)</th>
						<th scope="col">재고수량</th>
						<th scope="col">가격변경</th>
						<th scope="col">재고변경</th>
					</tr>
				</thead>
				<tbody>
					<%
					for(SellingGoods e : list){
					%>
						<tr>
							<td><%=e.getIVT_ID() %></td>
							<td><%=e.getFRCS_NM() %></td>
							<td><%=e.getFRCS_CO_ADDR() %></td>
							<td><%=e.getGDS_NM() %></td>
							<td><%=e.getIVT_GDS_AMT() %></td>
							<td><%=e.getIVT_CNT() %></td>
							<td>
								<form action="store_inventory_process.jsp" method="get">
									<input type="hidden" name="flag" value="IVT_GDS_AMT">
									<input type="hidden" name="curIVT_ID" value="<%=e.getIVT_ID() %>">
									<input type="number" name="inputPrice"">
									<button type="submit" class="btn btn-success">가격변경</button>
								</form>
							</td>
							<td>
								<form action="store_inventory_process.jsp" method="get">
									<input type="hidden" name="flag" value="IVT_CNT">
									<input type="hidden" name="curIVT_ID" value="<%=e.getIVT_ID() %>">
									<input type="number" name="inputCount"">
									<button type="submit" class="btn btn-success">재고변경</button>
								</form>
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