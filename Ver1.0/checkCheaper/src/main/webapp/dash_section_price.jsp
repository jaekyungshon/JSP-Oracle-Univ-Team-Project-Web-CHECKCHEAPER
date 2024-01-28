<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<%@ page import="checkCheaper.Goods" %>
<%@ include file="dbConn.jsp" %>
<script>
function addCartAlarm() {
	alert("해당 상품을 장바구니에 추가하였습니다.");
}
</script>
<%
// input Option들 세션에서 가져오기
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
ArrayList<String> options0 = (ArrayList<String>)session.getAttribute("inputOptions0"); // 업태
ArrayList<String> options1 = (ArrayList<String>)session.getAttribute("inputOptions1"); // 품목,지점,상품명
String btnFlag = (String)session.getAttribute("btnFlag");

System.out.println("<dash_section_price 세션 get 출력>");
System.out.println("options0 개수: "+options0.size());
System.out.print("options0(업태) 내용: ");
for(String e : options0){
	if(e.equals("")){
		System.out.print("null ");
	}
	else System.out.print(e+" ");
}
System.out.println();
System.out.println("options1 개수: "+options1.size());
System.out.print("options1 내용(품목,지점,상품명): ");
for(String e : options1){
	if(e.equals("")){
		System.out.print("null ");
	}
	else System.out.print(e+" ");
}
System.out.println("");
System.out.println("===============================");
%>
<%
// DB 조건 설정.
PreparedStatement pstmt = null;
String sql = "SELECT DISTINCT * FROM inventory,goods,franchise "
		   + "WHERE goods.GDS_ID=inventory.GDS_ID and franchise.FRCS_ID=inventory.FRCS_ID ";
ResultSet rs = null;

if(!options1.get(2).equals("")) { // 상품명 기재
	sql+="and goods.GDS_NM='"+options1.get(2)+"' ";
}
if(!options1.get(0).equals("")){ // 품목 기재
	sql+="and goods.CTGRY_ID="+options1.get(0)+" ";
}
if(!options0.get(0).equals("")){ // 업태 선택 한개이상인 경우.
	for(int i=0; i<options0.size(); i++){
		if(i==0) {
			if(options0.size()-1>i) sql+="and (franchise.FRCS_TYPE="+options0.get(i)+" or ";
			else sql+="and (franchise.FRCS_TYPE="+options0.get(i)+") ";
		}
		else if(i==options0.size()-1){
			sql+="franchise.FRCS_TYPE="+options0.get(i)+") ";
		}
		else{
			sql+="franchise.FRCS_TYPE="+options0.get(i)+" or ";
		}
	}
}
if(!options1.get(1).equals("0")){ // 지점 기재: 전체 아닌 경우
	if(options1.get(1).equals("1")) sql+="and franchise.FRCS_CO_ADDR like '"+"%서울%'";
	if(options1.get(1).equals("2")) sql+="and franchise.FRCS_CO_ADDR like '"+"%경기도%'";
	if(options1.get(1).equals("3")) sql+="and franchise.FRCS_CO_ADDR like '"+"%인천%'";
	if(options1.get(1).equals("4")) sql+="and franchise.FRCS_CO_ADDR like '"+"%강원도%'";
	if(options1.get(1).equals("5")) sql+="and franchise.FRCS_CO_ADDR like '"+"%충청도%'";
	if(options1.get(1).equals("6")) sql+="and franchise.FRCS_CO_ADDR like '"+"%전라도%'";
	if(options1.get(1).equals("7")) sql+="and franchise.FRCS_CO_ADDR like '"+"%경상도%'";
	if(options1.get(1).equals("8")) sql+="and franchise.FRCS_CO_ADDR like '"+"%제주도%'";
}

System.out.println("Before: "+sql);

// 정렬 기능 추가.
if(btnFlag.equals("1")){ // 최저가순
	sql += " order by inventory.IVT_GDS_AMT";
}
else if(btnFlag.equals("2")){ // 주문량순
	sql += " order by inventory.IVT_GDS_ORDR_CNT desc";
}
else if(btnFlag.equals("3")){ // 할인가순
	// select * from inventory left outer join discount using(IVT_ID)을 합침.
	boolean whereFlag = false;
	sql = "SELECT inventory.IVT_ID,goods.GDS_NM, franchise.FRCS_NM, franchise.FRCS_CO_ADDR, inventory.IVT_GRD_LEVEL, inventory.IVT_CNT, "
		+ "inventory.IVT_GDS_AMT, discount.DSCNT_AMT FROM inventory "
		+ "INNER JOIN goods ON goods.GDS_ID=inventory.GDS_ID "
		+ "INNER JOIN franchise ON franchise.FRCS_ID=inventory.FRCS_ID "
		+ "LEFT OUTER JOIN discount ON inventory.IVT_ID=discount.IVT_ID ";
	if(!options1.get(2).equals("")) { // 상품명 기재
		if(!whereFlag) {
			sql += "WHERE ";
			whereFlag=true;
			sql+="goods.GDS_NM='"+options1.get(2)+"' ";
		}
		else{
			sql+="and goods.GDS_NM='"+options1.get(2)+"' ";
		}
	}
	if(!options1.get(0).equals("")){ // 품목 기재
		if(!whereFlag) {
			sql += "WHERE ";
			whereFlag=true;
			sql+="goods.CTGRY_ID="+options1.get(0)+" ";
		}
		else{
			sql+="and goods.CTGRY_ID="+options1.get(0)+" ";
		}
	}
	if(!options0.get(0).equals("")){ // 업태 선택 한개이상인 경우.
		for(int i=0; i<options0.size(); i++){
			if(i==0) {
				if(whereFlag){
					if(options0.size()-1>i) {sql+="and (franchise.FRCS_TYPE="+options0.get(i)+" or ";}
					else {sql+="and (franchise.FRCS_TYPE="+options0.get(i)+") ";}
				}
				else{
					sql += "WHERE ";
					whereFlag=true;
					if(options0.size()-1>i) {sql+="(franchise.FRCS_TYPE="+options0.get(i)+" or ";}
					else {sql+="(franchise.FRCS_TYPE="+options0.get(i)+") ";}
				}
			}
			else if(i==options0.size()-1){
				sql+="franchise.FRCS_TYPE="+options0.get(i)+") ";
			}
			else{
				sql+="franchise.FRCS_TYPE="+options0.get(i)+" or ";
			}
		}
	}
	sql += "order by DSCNT_AMT desc";
}
System.out.println("After: "+sql);

// DB 검색
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

String[] colList={"상품명","판매점","주소","품질", "재고수량","가격(단가)"};
String[] colListDB={"GDS_NM","FRCS_NM","FRCS_CO_ADDR","IVT_GRD_LEVEL","IVT_CNT","IVT_GDS_AMT"};
%>
<section id="orderBtn" style="height:100px; float:right;">
	<button type="button" class="btn btn-outline-danger"><a href="dash_arrange_process.jsp?btnFlag=1">최저가순</a></button>
	<button type="button" class="btn btn-outline-danger"><a href="dash_arrange_process.jsp?btnFlag=2">주문량순</a></button>
	<button type="button" class="btn btn-outline-danger"><a href="dash_arrange_process.jsp?btnFlag=3">할인가순</a></button>
</section>
<section id="priceTable">
	<table class="table">
		<thead>
			<tr>
				<th scope='col'>#</th>
				<%
				for(int i=0; i<colList.length; i++){
					out.println("<th scope='col'>");
					out.println(colList[i]);
					out.println("</th>");
				}
				if(btnFlag.equals("3")){
					out.println("<th scope='col'>");
					out.println("할인가");
					out.println("</th>");
				}
				%>
				<th scope='col'>장바구니 버튼</th>
				<th scope='col'>주문 버튼</th>
			</tr>
		</thead>
		<tbody>
		<%
		int idx=1;
		while(rs.next()){
		%>
			<tr>
				<th scope="col"><%=idx++ %></th>
				<%
				for(int i=0; i<colListDB.length; i++){
					if(colListDB[i].equals("GDS_NM")){
						out.println("<th>");
						out.println(rs.getString(colListDB[i]));
						if(rs.getString("IVT_CNT").equals("0")){
							out.println("<span class='badge badge-danger'>품절</span>");
						}
						out.println("</th>");
					}
					else if(colListDB[i].equals("IVT_GRD_LEVEL")){
						out.println("<td>");
						int t = Integer.parseInt(rs.getString("IVT_GRD_LEVEL"));
						if(t==0){
							out.println("최상급~상급");
						}
						if(t==1){
							out.println("상급~중급");
						}
						if(t==2){
							out.println("중급~하급");
						}
						out.println("</td>");
					}
					else{
						out.println("<td>");
						out.println(rs.getString(colListDB[i]));
						out.println("</td>");
						if(i==colListDB.length-1 && btnFlag.equals("3")){ // 할인가 데이터
							String dscntAmt = rs.getString("DSCNT_AMT");
							//System.out.println("ds: "+dscntAmt+");
							out.println("<td>");
							if(dscntAmt==null){
								out.println("0");
							}
							else{
								out.println(dscntAmt);
							}
							out.println("</td>");
						}
					}
				}
				%>
				<%
				String IVT_ID = rs.getString("IVT_ID");
				String DB_GDS_NM = rs.getString("GDS_NM");
				String DB_FRCS_NM = rs.getString("FRCS_NM");
				String DB_FRCS_CO_ADDR = rs.getString("FRCS_CO_ADDR");
				String IVT_CNT = rs.getString("IVT_CNT");
				%>
				<td>
				<%
				if(IVT_CNT.equals("0")){
					out.println("<button type='button' class='btn btn-outline-primary' disabled>품절</button>");
				}
				%>
				<%
				if(!IVT_CNT.equals("0")){
				%>
					<button type="button" class="btn btn-outline-primary" onclick="addCartAlarm()">
						<a href="cart_insert_process.jsp?IVT_ID=<%=IVT_ID%>&cartFlag=0&GDS_NM=<%=DB_GDS_NM %>&FRCS_NM=<%=DB_FRCS_NM %>&FRCS_CO_ADDR=<%=DB_FRCS_CO_ADDR %>">장바구니 담기</a>
					</button>
				<%
				}
				%>
				</td>
				<td>
				<%
				if(IVT_CNT.equals("0")){
					out.println("<button type='button' class='btn btn-outline-primary' disabled>주문하기</button>");
				}
				%>
				<%
				if(!IVT_CNT.equals("0")){
				%>
					<button type="button" class="btn btn-outline-primary">
						<a href="cart_insert_process.jsp?IVT_ID=<%=IVT_ID%>&cartFlag=1&GDS_NM=<%=DB_GDS_NM %>&FRCS_NM=<%=DB_FRCS_NM %>&FRCS_CO_ADDR=<%=DB_FRCS_CO_ADDR %>">주문하기</a>
					</button>
				<%
				}
				%>
				</td>
			</tr>
			<%
			if(idx==300){
				break;
			}
			%>
		<%
		}
		%>
		</tbody>
	</table>
</section>
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