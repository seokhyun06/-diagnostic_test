<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>

	<%
		String sql = "select p.p_city as 지역코드," +
					" case p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end as 지역명," +
					" count(p_city) as 검사건수" +
					" from TBL_PATIENT_202004 p, TBL_RESULT_202004 r" +
					" where p.p_no = r.p_no" +
					" group by p_city" +
					" order by p_city asc";
		
		Connection conn = DBConnect.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>지역별검사건수</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>

<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
<h2> 환자 조회 </h2>
	<table class = "table_style" style="width: 500px">
		<tr>
			<th> 지역코드 </th>
			<th> 지역명 </th>
			<th> 검사건수 </th>
		</tr>
			<%while(rs.next()) { %>
		<tr>
			<td><%= rs.getString("지역코드") %></td>
			<td><%= rs.getString("지역명") %></td>
			<td><%= rs.getString("검사건수") %></td>
		</tr>
	<% } %>
	</table> 
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>