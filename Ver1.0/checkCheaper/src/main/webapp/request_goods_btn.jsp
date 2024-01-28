<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<% 
String tableNum = request.getParameter("num");
session.removeAttribute("tableNum");
session.setAttribute("tableNum", Integer.toString(Integer.parseInt(tableNum)+1));
response.sendRedirect("request_goods.jsp");
%>