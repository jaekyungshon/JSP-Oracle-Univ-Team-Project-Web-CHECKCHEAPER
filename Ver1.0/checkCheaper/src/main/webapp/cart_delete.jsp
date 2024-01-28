<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="checkCheaper.Goods" %>

<% 
ArrayList<Goods> cartList = (ArrayList<Goods>)session.getAttribute("cartlist");
int idx = Integer.parseInt(request.getParameter("num"));
if(cartList!=null){
	if(cartList.size()!=0){
		cartList.remove(idx);
		session.removeAttribute("cartlist");
		session.setAttribute("cartlist", cartList);
	}
}
response.sendRedirect("cart.jsp");
%>