<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="checkCheaper.SellingGoods" %>
<%@ include file="dbConn.jsp" %>

<%
PreparedStatement pstmt=null;
String sql = "";

String flag = request.getParameter("flag");

if(flag.equals("IVT_GDS_AMT")){
	int IVT_ID = Integer.parseInt(request.getParameter("curIVT_ID"));
	int IVT_GDS_AMT = Integer.parseInt(request.getParameter("inputPrice"));
	
	sql = "UPDATE inventory SET IVT_GDS_AMT=? WHERE IVT_ID=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,IVT_GDS_AMT);
	pstmt.setInt(2,IVT_ID);
	pstmt.executeUpdate();
}
else{
	int IVT_ID = Integer.parseInt(request.getParameter("curIVT_ID"));
	int IVT_CNT = Integer.parseInt(request.getParameter("inputCount"));
	
	sql = "UPDATE inventory SET IVT_CNT=? WHERE IVT_ID=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,IVT_CNT);
	pstmt.setInt(2,IVT_ID);
	pstmt.executeUpdate();
}

if(pstmt!=null){
	pstmt.close();
}
if(conn!=null){
	conn.close();
}

response.sendRedirect("store_inventory.jsp");
%>