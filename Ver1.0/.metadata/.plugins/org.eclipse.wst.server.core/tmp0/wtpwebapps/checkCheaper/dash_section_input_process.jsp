<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("utf-8");
String[] storeType = request.getParameterValues("checkStoreType"); // 업태 type:String
String categoryOption = request.getParameter("categoryOptions"); // 품목
String area = request.getParameter("selectArea"); // 지역
String goodsName = request.getParameter("goodsName"); // 상품명
%>

<%
//System.out.println(storeType+" "+categoryOption+" "+area+" "+goodsName);
ArrayList<String> inputOptions0 = new ArrayList<String>(); // 업태
ArrayList<String> inputOptions1 = new ArrayList<String>(); // 품목,지역,상품명
if(storeType==null){
	inputOptions0.add("");
}
else{
	for(String e : storeType){
		inputOptions0.add(e);
	}
}
if(categoryOption==null){
	inputOptions1.add("");
}
else{
	inputOptions1.add(categoryOption);
}
inputOptions1.add(area); // selectd 0 : 전체
inputOptions1.add(goodsName); // 상품명 미기재 -> ""

// session 설정
ArrayList<String> options0 = (ArrayList<String>)session.getAttribute("inputOptions0");
ArrayList<String> options1 = (ArrayList<String>)session.getAttribute("inputOptions1");
String btnFlag = (String)session.getAttribute("btnFlag");

if(options0!=null){
	session.removeAttribute("inputOptions0");
}
if(options1!=null){
	session.removeAttribute("inputOptions1");
}
if(btnFlag!=null){
	session.removeAttribute("btnFlag");
}


session.setAttribute("inputOptions0", inputOptions0);
session.setAttribute("inputOptions1", inputOptions1);
session.setAttribute("btnFlag","0");
%>

<%
String flag="1";
response.sendRedirect("dash.jsp?flag="+flag);
%>

