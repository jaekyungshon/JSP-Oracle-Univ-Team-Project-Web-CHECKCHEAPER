<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<% 
Connection conn = null;
try{
	String url = "jdbc:mysql://호스트/db명";
	String user = "root";
	String password = "비밀번호";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	//System.out.println("데이터베이스 연결 성공");
} catch (SQLException ex) {
	System.out.println("데이터베이스 연결 실패");
}
%>