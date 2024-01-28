<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>

<%
String storeID = (String)session.getAttribute("userID"); // 판매자 아이디
String rlsFlag = request.getParameter("rlsFlag"); // 출고버튼 유형
String orderdetail_id = request.getParameter("ordr"); // 해당 주문상세아이디

PreparedStatement pstmt = null;
String sql = "UPDATE orderdetail set RLS_FLAG=1 WHERE ORDERDETAIL_ID=?";

if(rlsFlag.equals("1")){
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(orderdetail_id));
	pstmt.executeUpdate();
}

if(pstmt!=null){
	pstmt.close();
}
if(conn!=null){
	conn.close();
}
response.sendRedirect("store_release.jsp");
%>
