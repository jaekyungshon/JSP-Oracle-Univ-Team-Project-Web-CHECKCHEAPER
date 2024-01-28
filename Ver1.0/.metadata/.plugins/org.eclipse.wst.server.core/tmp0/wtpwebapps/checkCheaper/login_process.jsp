<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
String userID = request.getParameter("i_id");
String userPW = request.getParameter("i_pw");
String userType = null;
//System.out.println(userID.getClass().getName()); // 타입 확인
//System.out.println(userPW.getClass().getName());
%>

<%
String sql = null;
Statement stmt = null;
ResultSet rs = null;
String colNameID = null;
String colNamePW = null;
%>

<%
//System.out.println(userID);

if(userID.contains("mbr")){ // mbr001
	sql = "SELECT MBR_ID, MBR_PW FROM member";
	colNameID = "MBR_ID";
	colNamePW = "MBR_PW";
	userType="member";
}
else if(userID.contains("store")){ // store001
	sql = "SELECT FRCS_ID, FRCS_PW FROM franchise";
	colNameID = "FRCS_ID";
	colNamePW = "FRCS_PW";
	userType="store";
}
else{
	sql = "SELECT ADMIN_ID, ADMIN_PW FROM admingm";
	colNameID = "ADMIN_ID";
	colNamePW = "ADMIN_PW";
	userType="admin";
}
stmt = conn.createStatement();
rs = stmt.executeQuery(sql);

boolean flag=false;
while(rs.next()){
	String targetID = rs.getString(colNameID);
	String targetPW = rs.getString(colNamePW);
	if(targetID.equals(userID) && targetPW.equals(userPW)){
		flag=true;
		break;
	}
	//System.out.println(rs.getString("MBR_ID"));
}

if(rs!=null){
	rs.close();
}
if(stmt!=null){
	stmt.close();
}
if(conn!=null){
	conn.close();
}

if(flag){
	session.setAttribute("userID", userID);
	session.setAttribute("userType", userType);
	session.removeAttribute("cartlist");
	session.removeAttribute("tableNum");
	System.out.println("회원 로그인 세션 설정 완료");
	response.sendRedirect("dash.jsp?flag=0");
}
else{
	response.sendRedirect("index.jsp");
}
%>