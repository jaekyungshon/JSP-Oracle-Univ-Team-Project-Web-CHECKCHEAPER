<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<% 
String inputBtnFlag = request.getParameter("btnFlag");
String btnFlagSession = (String)session.getAttribute("btnFlag");

if(btnFlagSession!=null){
	session.removeAttribute("btnFlag");
}

session.setAttribute("btnFlag", inputBtnFlag);
response.sendRedirect("dash.jsp?flag=1");
%>