<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<section id="dashInputGroup">
	<form action="dash_section_input_process.jsp" name="price_select_form" method="post" id="dashForm">
		<div class="row">
			<div class="col" style="max-width:200px;">
				<label for="area" class="form-label"><strong>지역</strong></label>
				<select class="form-select" name="selectArea" id="area" aria-label="Default select example">
				  <option selected value="0">전체</option>
				  <option value="1">서울</option>
				  <option value="2">경기도</option>
				  <option value="3">인천</option>
				  <option value="4">강원도</option>
				  <option value="5">충청도</option>
				  <option value="6">전라도</option>
				  <option value="7">경상도</option>
				  <option value="8">제주도</option>
				</select>
			</div>
			<div class="col" style="width:700px">
				<label for="storetype" class="form-label"><strong>업태</strong></label>
				<div class="form-check form-check-inline">
					<input class="form-check-input" name="checkStoreType" type="checkbox" id="bigMarket" value="0">
  					<label class="form-check-label" for="bigMarket">대형마트</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" name="checkStoreType" type="checkbox" id="department" value="1">
  					<label class="form-check-label" for="department">백화점</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" name="checkStoreType" type="checkbox" id="superMarket" value="2">
  					<label class="form-check-label" for="superMarket">슈퍼마켓</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" name="checkStoreType" type="checkbox" id="convenience" value="3">
  					<label class="form-check-label" for="convenience">편의점</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" name="checkStoreType" type="checkbox" id="roadMarket" value="4">
  					<label class="form-check-label" for="roadMarket">전통시장</label>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col" style="max-width:200px;">
				<label for="goodstype" class="form-label"><strong>품목</strong></label>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="categoryOptions" id="vegetable" value="0">
				  <label class="form-check-label" for="vegetable">채소</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="categoryOptions" id="fruits" value="1">
				  <label class="form-check-label" for="fruits">과일</label>
				</div>
			</div>
			<div class="col">
				<label for="goods" class="form-label"><strong>상품명</strong></label>
				<input type="text" class="form-control" name="goodsName" id="goods" placeholder="ex)사과" aria-label="Goods" style="width:60%;">
			</div>
		</div>
		<div class="container" style="display:flex; justify-content:center; margin-top:20px;">
			<button type="submit" class="btn btn-outline-dark btn-lg">조회하기</button>
		</div>
	</form>
</section>
<hr style="width:60%; margin-bottom:40px;">

