<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="checkCheaper.Goods"%>
<%@ include file="dbConn.jsp" %>

<%-- dash_section_price.jsp : 장바구니 버튼 클릭시 넘겨받는 파라미터 --%>
<%
String cartFlag = request.getParameter("cartFlag");
String IVT_ID = request.getParameter("IVT_ID");
ArrayList<Goods> list;
%>
<%--넘겨받은 파라미터로 DB 조회 --%>
<%
PreparedStatement pstmt = null;
String sql = "SELECT * FROM inventory WHERE IVT_ID = ?";
ResultSet rs = null;

pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(IVT_ID));
rs = pstmt.executeQuery();

String GDS_NM = request.getParameter("GDS_NM");
String FRCS_NM = request.getParameter("FRCS_NM");
String FRCS_CO_ADDR = request.getParameter("FRCS_CO_ADDR");
rs.next();
String IVT_GRD_LEVEL = rs.getString("IVT_GRD_LEVEL");
String IVT_CNT = rs.getString("IVT_CNT");
String IVT_GDS_AMT = rs.getString("IVT_GDS_AMT");

%>
<%-- 장바구니에 담는 버튼이냐, 주문하기를 통한 장바구니 페이지 이동이냐 --%>
<%

list=(ArrayList<Goods>)session.getAttribute("cartlist");
Goods product = new Goods();
if(list==null){
	list=new ArrayList<Goods>();
}
else{
	session.removeAttribute("cartlist");
}
product.setInventoryKey(Integer.parseInt(IVT_ID));
product.setGoodsName(GDS_NM);
product.setFranchiseName(FRCS_NM);
product.setFranchiseAddress(FRCS_CO_ADDR);
product.setGoodsLevel(IVT_GRD_LEVEL);
product.setQuantity(IVT_CNT);
product.setPrice(IVT_GDS_AMT);
System.out.println("장바구니에 추가: "+product.getGoodsName());
%>
<%
if(list.size()!=0){
	boolean c = true;
	for(Goods t : list){
		if(t.getGoodsName().equals(product.getGoodsName()) && t.getFranchiseName().equals(product.getFranchiseName())){
			c=false; break;
		}
	}
	if(c){
		list.add(product);
		System.out.println("장바구니 담기 성공");
	}
	else{
		System.out.println("장바구니에 이미 존재");
	}
}
else{
	list.add(product);
}

session.setAttribute("cartlist", list);
if(cartFlag.equals("0")){
%>
<jsp:forward page="dash.jsp?flag=1"/>
<%
}
%>
<%
if(cartFlag.equals("1")){
	response.sendRedirect("cart.jsp");
}
%>
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