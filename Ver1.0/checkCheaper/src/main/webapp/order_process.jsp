<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>
<%@ page import="checkCheaper.Goods" %>
<%@ include file="dbConn.jsp" %>
<%
ArrayList<Goods> cartList = (ArrayList<Goods>)session.getAttribute("cartlist"); // 주문한 장바구니 상품들
String curDate = LocalDate.now().toString(); // 주문일자(현재 날짜 기준)
String devDate=""; // 배송일자
int total_price=0; // 주문총금액
String orderName = request.getParameter("orderName"); // 수령인
String orderAddress = request.getParameter("orderAddress"); // 수령지
String orderTel = request.getParameter("orderPhone"); // 수령인전화번호
String orderPay = request.getParameter("orderPay"); // 결제수단
String userID = (String)session.getAttribute("userID"); // 회원아이디
int lastOrderKey=0; // 마지막 주문정보테이블 기본키
int lastOrderDetailKey=0; // 마지막 주문상세테이블 기본키
int lastDeliveryKey=0; // 마지막 배송테이블 기본키
String deliveryList[] = {"한진택배", "롯데택배", "우체국택배","CJ대한통운택배"}; // 배송사 리스트
int deliveryNum[] = {111111,211111,311111,411111}; // 운송장번호
int deliveryMin = 0; // 현재배송사개수
int deliveryMinIdx = 0; // 선정배송사인덱스
PreparedStatement pstmt = null;
ResultSet rs = null;

// 배송일자 구하기
System.out.println(LocalDate.now().getYear());
        System.out.println(LocalDate.now().getMonth());
        System.out.println(LocalDate.now().getDayOfMonth());
int curYear = LocalDate.now().getYear();
int curMonth = 12;
int curDay = LocalDate.now().getDayOfMonth();
int devDay = curDay+2;
devDate=String.format("%d-%d-%d",curYear,curMonth,devDay);

// 주문총금액 구하기
for(Goods e : cartList) {
	total_price += (Integer.parseInt(e.getPrice())*e.getInputQuantity());
}
System.out.println("총가격: "+total_price);

//주문정보 새로 들어갈 자리 기본키
String sql = "SELECT count(*) from orderinfo";
pstmt=conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
	lastOrderKey = Integer.parseInt(rs.getString("count(*)"));
}
System.out.println("주문정보 기본키: "+lastOrderKey);

// 주문상세 새로 들어갈 자리 기본키
sql = "SELECT count(*) from orderdetail";
pstmt=conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
	lastOrderDetailKey = Integer.parseInt(rs.getString("count(*)"));
}
System.out.println("주문상세 기본키: "+lastOrderDetailKey);

// 배송 새로 들어갈 자리 기본키
sql = "SELECT count(*) from delivery";
pstmt=conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
	lastDeliveryKey = Integer.parseInt(rs.getString("count(*)"));
}
System.out.println("배송 기본키: "+lastDeliveryKey);

// 가장 적게 업무하는 배송사 찾기
sql = "SELECT count(*) from delivery where DELIVERY_BZENT_NM=?";
pstmt=conn.prepareStatement(sql);
for(int i=0; i<4; i++){
	pstmt.setString(1, deliveryList[i]);
	rs=pstmt.executeQuery();
	while(rs.next()){
		int cnt = Integer.parseInt(rs.getString("count(*)"));
		if(i==0){
			deliveryMin=cnt;
		}
		else if(deliveryMin>cnt){
			deliveryMinIdx=i;
		}
	}
}
System.out.println("배송업체인덱스: "+deliveryMinIdx);

// 상품별 재고수량 상품객체에 넣기
sql = "SELECT * FROM inventory";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	int id = Integer.parseInt(rs.getString("IVT_ID"));
	for(Goods e : cartList){
		if(e.getInventoryKey()==id){
			e.setQuantity(rs.getString("IVT_CNT"));
		}
	}
}

// 주문정보 레코드 삽입
sql = "INSERT INTO orderinfo values(?,?,?,?,?,?,?,?)";
pstmt=conn.prepareStatement(sql);
pstmt.setInt(1,lastOrderKey); // 주문정보코드
pstmt.setString(2,userID); // 회원아이디
pstmt.setString(3,curDate); // 주문일자
pstmt.setInt(4,total_price); // 주문총금액
pstmt.setInt(5,Integer.parseInt(orderPay)); // 결제수단
pstmt.setString(6,orderAddress); // 수령지
pstmt.setString(7,orderName); // 수령자
pstmt.setString(8,orderTel); // 수령인전화번호
pstmt.executeUpdate();
System.out.println("주문정보 레코드 삽입 성공");

// 배송 레코드 삽입
sql = "INSERT INTO delivery values(?,?,?,?,?,?)";
pstmt=conn.prepareStatement(sql);
pstmt.setInt(1,lastDeliveryKey); // 배송코드
pstmt.setInt(2,lastOrderKey); // 주문코드
pstmt.setString(3,devDate); // 배송일자
pstmt.setString(4,deliveryList[deliveryMinIdx]); // 배송업체
pstmt.setInt(5,deliveryNum[deliveryMinIdx]); // 운송장번호
pstmt.setInt(6,0); // 배송완료여부

pstmt.executeUpdate();
System.out.println("배송 레코드 삽입 성공");

// 주문상세 레코드 삽입
sql = "INSERT INTO orderdetail values(?,?,?,?,?)";
pstmt=conn.prepareStatement(sql);
for(Goods e : cartList){
	pstmt.setInt(1,lastOrderDetailKey++);
	pstmt.setInt(2,lastOrderKey);
	pstmt.setInt(3,e.getInventoryKey());
	pstmt.setInt(4,e.getInputQuantity());
	pstmt.setInt(5,0);
	pstmt.executeUpdate();
}
System.out.println("주문상세 레코드 삽입 성공");

// 선택 상품 재고 수량 갱신
sql = "UPDATE inventory SET IVT_CNT=? WHERE IVT_ID=?";
pstmt=conn.prepareStatement(sql);
for(Goods e : cartList){
	pstmt.setInt(1,Integer.parseInt(e.getQuantity())-e.getInputQuantity());
	pstmt.setInt(2,e.getInventoryKey());
	pstmt.executeUpdate();
}

session.removeAttribute("cartlist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CheckCheaper</title>
<!-- Bootstrap CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-
pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-
xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="css/footer.css" type="text/css">
<link rel="stylesheet" href="css/dash_section_input.css" type="text/css">
</head>
<body>
	<%-- Navigation --%>
	<%@ include file="menu.jsp" %>
	<%-- Header --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-2"><strong>Thank you for buying!</strong></h1>
		</div>
	</div>
	<%-- Header Section --%>
	<div class="container">
		<div class="container">
			<div class="text-center">
				<%
				out.println("<h3>");
				out.println("Hello, "+userID+"! You can check to your current order!");
				out.println("</h3>");
				%>
				<br><br>
			</div>
		</div>
	</div>
	<%-- Section --%>
	<section>
		<div class="container">
			<div class="alert alert-success" role="alert">
			  <h4 class="alert-heading">주문완료!</h4>
			  <p>현재까지의 주문 내역을 확인하고 싶다면 <a href="order_history.jsp" class="alert-link">여기</a>를 클릭하세요!</p>
			  <hr>
			  <p class="mb-0">배송정보, 주문번호를 간단하게 아래 박스에서 확인할 수 있습니다.</p>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-6">
					<div class="card">
						<div class="card-body">
							<h5 class="cart-title">주문코드</h5>
							<p class="cart-text"><%=lastOrderKey %></p>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="card">
						<div class="card-body">
							<h5 class="cart-title">배송정보</h5>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">배송업체: <%=deliveryList[deliveryMinIdx] %></li>
								<li class="list-group-item">배송일자: <%=devDate %></li>
								<li class="list-group-item">운송장번호: <%=deliveryNum[deliveryMinIdx] %></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<button type="button" class="btn btn-outline-dark">
				<a href="dash.jsp?flag=0">Home으로 돌아가기</a>
			</button>
		</div>
	</section>
</body>
</html>

<% 
if(rs!=null){
	rs.close();
}
if(pstmt!=null){
	pstmt.close();
}
if(conn!=null){
	conn.close();
}
%>