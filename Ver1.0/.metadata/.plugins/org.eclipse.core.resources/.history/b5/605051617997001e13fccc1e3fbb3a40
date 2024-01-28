<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="checkCheaper.Goods" %>
<%@ page import="checkCheaper.OrderGoods" %>
<jsp:useBean id="orderGoods" class="checkCheaper.OrderGoods" scope="request"/>

<%-- session에 담긴 cartList 확인용 --%>
<%
ArrayList<Goods> sessionCart = (ArrayList<Goods>)session.getAttribute("cartlist");

System.out.println("장바구니 리스트 세션 확인용");
if(sessionCart!=null){
	for(int i=0; i<sessionCart.size(); i++){
		System.out.print(sessionCart.get(i).getGoodsName()+" ");
	}
	System.out.println("");
}
%>
<%
if(sessionCart!=null){
	for(Goods e : sessionCart){
		orderGoods.addGoods(e);
	}
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
	<%-- CSS Container : Responsive Web Design --%>
	<div id="wrap">
		<%-- Header --%>
		<%@ include file="header_cart.jsp" %>
		<%-- Header Section --%>
		<%@ include file="header_cart_section.jsp" %>
		<%-- Content Section(Can be Many Page)--%>
		<table class="table" style="margin-bottom : 30px;">
			<thead>
				<tr>
					<th class="scope">#</th>
					<th class="scope">상품명</th>
					<th class="scope">판매점</th>
					<th class="scope">주소</th>
					<th class="scope">품질</th>
					<th class="scope">재고수량</th>
					<th class="scope">가격(단가)</th>
					<th class="scope">현재선택수량</th>
					<th class="scope">주문수량 입력</th>
					<th class="scope">삭제 버튼</th>
				</tr>
			</thead>
			<tbody>
			<%
			ArrayList<Goods> list = orderGoods.getList();
			boolean sessionCartFlag=false;
			if(sessionCart!=null || list.size()!=0){
				sessionCartFlag=true;
				int num=0;
				for(int i=0; i<list.size(); i++){
			%>
				<tr>
					<%
					list.get(i).setTableRowNum(num);
					%>
					<td><%=num++ %></td>
					<td><%=list.get(i).getGoodsName()%></td>
					<td><%=list.get(i).getFranchiseName() %></td>
					<td><%=list.get(i).getFranchiseAddress() %></td>
					<td><%=list.get(i).getGoodsLevel() %></td>
					<td><%=list.get(i).getQuantity() %></td>
					<td><%=list.get(i).getPrice() %></td>
					<td id="curCnt<%=num-1%>">
					<%
						Goods target=null;
						String source=list.get(i).getGoodsName();
						for(Goods t : list){
							if(t.getGoodsName().equals(source)){
								target=t;
							}
						}
					%>
						<%
						if(target!=null){ 
							out.println(target.getInputQuantity());
						}
						%>
					</td>
					<td>
					<%-- 변경 수량 적용하고 싶으면 이부분 변경하면됨. --%>
					<form action="inputQuantity_process.jsp">
						<input type="hidden" name="curNum" value="<%=num-1%>">
						<input type="number" name="inputQuantity" id="inputQuantityId<%=num-1%>">
						<button type="submit" class="btn btn-success">수량적용하기</button>
					</form>
					</td>
					<td>
						<button type="button" class="btn btn-danger">
							<a href="cart_delete.jsp?num=<%=num-1%>">삭제</a>
						</button>
					</td>
				</tr>
				<%
				}
				%>
			<%
			}
			%>
			</tbody>
		</table>
		<%
		if(sessionCartFlag){
			out.println("<hr>");
		%>
		<%@ include file="order_buy_form.jsp" %>
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
	%>
</body>
</html>