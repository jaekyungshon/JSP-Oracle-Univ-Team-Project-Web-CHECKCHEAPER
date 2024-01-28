<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="container">
<form action="order_process.jsp">
	<div class="row">
		<label for="inputOrderName">수령인</label>
		<input type="text" class="form-control" id="inputOrderName" name="orderName" placeholder="ex)홍길동">
		<label for="inputOrderTel">수령인 전화번호</label>
		<input type="text" class="form-control" name="orderPhone" id="inputOrderTel" placeholder="ex)010-1111-1111">
	</div>
	<div class="row">
		<label for="inputOrderAddress">수령지</label>
		<input type="text" class="form-control" name="orderAddress" id="inputOrderAddress" placeholder="ex)서울">
		<div class="form-check">
			<input type="radio" name="orderPay" id="payMoney" value="0">
			<label class="form-check-label" for="payMoney">현금</label>
			<input type="radio" name="orderPay" id="payCard" value="1">
			<label class="form-check-label" for="payCard">카드</label>
		</div>
	</div>
	<div class="container" style="display:flex; justify-content:center; margin-top:20px;">
		<button type="submit" class="btn btn-outline-dark btn-lg">결제하기</button>
	</div>
</form>
</div>