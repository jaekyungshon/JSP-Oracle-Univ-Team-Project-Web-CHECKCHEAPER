<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String memberType = (String)session.getAttribute("userType");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="./login.jsp">logout</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      <%-- Hamburger Menu --%>
      <a class="navbar-brand" href="dash.jsp?flag=0">Home</a>
      <a class="navbar-brand" href="order_history.jsp">Past Order</a>
      <a class="navbar-brand" href="#">Book Mark</a>
      <a class="navbar-brand" href="cart.jsp">Cart</a>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="dash.jsp?flag=0">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">즐겨찾기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="order_history.jsp">주문내역</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cart.jsp">장바구니</a>
        </li>
        <%
        if(memberType.equals("store")){
        %>
        <li class="nav-item">
          <a class="nav-link" href="request_goods.jsp">상품요청</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="store_inventory.jsp">재고관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="store_release.jsp">출고관리</a>
        </li>
        <%
        }
        %>
        <%
        if(memberType.equals("admin")){
        %>
        <li class="nav-item">
          <a class="nav-link" href="confirm_request_goods.jsp">상품요청확인</a>
        </li>
        <%
        }
        %>
      </ul>
    </div>
  </div>
</nav>