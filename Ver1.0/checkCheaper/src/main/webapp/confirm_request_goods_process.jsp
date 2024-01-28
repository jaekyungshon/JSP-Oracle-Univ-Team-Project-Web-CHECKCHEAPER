<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="dbConn.jsp" %>

<%
String btnFlag = request.getParameter("btnFlag");
int RL_ID = Integer.parseInt(request.getParameter("RL_ID"));

PreparedStatement pstmt = null;
String sql = "SELECT * FROM releasehistory WHERE RL_ID=?";
ResultSet rs=null;

pstmt=conn.prepareStatement(sql);
pstmt.setInt(1,RL_ID);
rs=pstmt.executeQuery();

ArrayList<String> record = new ArrayList<>();
String nameList[] = {"RL_ID","FRCS_ID","GDS_ID","GDS_NM","GDS_MKR_NM","CTGRY_ID","IVT_ID","IVT_CNT","IVT_GRD_LEVEL","IVT_GDS_AMT","IVT_GDS_ORDR_CNT"};
while(rs.next()){
	for(int i=0; i<11; i++)
		record.add(rs.getString(nameList[i]));
}

// 수락 버튼
if(btnFlag.equals("1")){
	// 상품 삽입
	sql="INSERT INTO goods values(?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,Integer.parseInt(record.get(2)));
	pstmt.setString(2,record.get(3));
	pstmt.setString(3,record.get(4));
	pstmt.setInt(4,Integer.parseInt(record.get(5)));
	pstmt.executeUpdate();
	
	// 재고 삽입
	sql="INSERT INTO inventory values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,Integer.parseInt(record.get(6)));
	pstmt.setInt(2,Integer.parseInt(record.get(7)));
	pstmt.setInt(3,Integer.parseInt(record.get(8)));
	pstmt.setInt(4,Integer.parseInt(record.get(9)));
	pstmt.setInt(5,Integer.parseInt(record.get(10)));
	pstmt.setInt(6,Integer.parseInt(record.get(2)));
	pstmt.setString(7,record.get(1));
	pstmt.executeUpdate();
}
// 수락 및 거절 버튼 모두 releasehistory 레코드 삭제
sql="DELETE FROM releasehistory WHERE RL_ID=?";
pstmt=conn.prepareStatement(sql);
pstmt.setInt(1,RL_ID);
pstmt.executeUpdate();

// 페이지 돌아가기
response.sendRedirect("confirm_request_goods.jsp");
%>