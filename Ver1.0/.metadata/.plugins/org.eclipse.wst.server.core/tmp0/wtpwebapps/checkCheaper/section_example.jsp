<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>

<section>
	<%
	Statement stmt = conn.createStatement();
	String sql = "SELECT * FROM member";
	ResultSet rs = stmt.executeQuery(sql);
	String colList[]={"MBR_ID","MS_ID","MBR_PW","MBR_NM","MBR_BD",
			"MBR_GD","MBR_EML_ADDR","MBR_TELLNO","MBR_ADDR"};
	%>
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
			%>
			</tr>
		</thead>
		<tbody>
		<%
		int idx=1;
		while(rs.next()){
			out.println("<tr>");
			out.println("<th scope='col'>");
			out.println(idx);
			out.println("</th>");
			for(int i=0; i<colList.length; i++){
				if(colList[i].equals("MBR_ID")){
					out.println("<th>");
					out.println(rs.getString(colList[i]));
					out.println("</th>");
				}
				else{
					out.println("<td>");
					out.println(rs.getString(colList[i]));
					out.println("</td>");
				}
			}
			out.println("</tr>");
			idx++;
		}
		if(rs!=null){
			rs.close();
		}
		if(stmt!=null){
			stmt.close();
		}
		if(conn!=null){
			conn.close();
		}
		%>
		</tbody>
	</table>
</section>