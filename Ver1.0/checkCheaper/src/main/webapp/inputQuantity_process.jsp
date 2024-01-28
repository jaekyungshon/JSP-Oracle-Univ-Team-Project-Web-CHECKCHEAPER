<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="checkCheaper.Goods"%>
<%@ page import="checkCheaper.OrderGoods"%>
<%@ page import="java.util.*"%>

<% 
ArrayList<Goods> sessionCart = (ArrayList<Goods>)session.getAttribute("cartlist");
ArrayList<Goods> newSessionCart = new ArrayList<Goods>();
int curNum = Integer.parseInt(request.getParameter("curNum"));
int inputQuantity = Integer.parseInt(request.getParameter("inputQuantity"));
System.out.println("curNum: "+curNum);
Goods target = null;
Goods old = null;

for(Goods e : sessionCart){
	//System.out.println(e.getTableRowNum());
	if(e.getTableRowNum()==curNum){
		e.setInputQuantity(inputQuantity);
	}
	newSessionCart.add(e);
}

session.removeAttribute("cartlist");
session.setAttribute("cartlist", newSessionCart);

response.sendRedirect("cart.jsp");
%>



