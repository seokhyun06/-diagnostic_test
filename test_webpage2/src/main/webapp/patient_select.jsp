<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>

<!DOCTYPE html>

	<%
		String sql = "select p_no, p_name," +
					" substr(p_birth, 1, 4) ||'년' || substr(p_birth, 5, 2) ||'년' || substr(p_birth, 7, 2) ||'일' as birth," +
					" p_tel1 || '-' || p_tel2 || '-' || p_tel3 as phone," + 
					" case p_gender when 'M' then '남자' when 'F' then '여자' end as gender," +
					" case p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' else '대구' end as city" +
					" from tbl_patient_202004" +
					" order by p_no";
					
		Connection conn = DBConnect.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
	%>
<html>
<head>
<meta charset="UTF-8">
<title>환자 조회</title>
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
	<table class = "table_style">
		<tr>
			<th>환자번호</th>		
			<th>환자성명</th>		
			<th>생년월일</th>		
			<th>성별</th>		
			<th>전화번호</th>		
			<th>지역</th>		
		</tr>
			<%while(rs.next()){ %>
		<tr>
				<td><%=rs.getString("p_no") %></td>
				<td><%=rs.getString("p_name") %></td>
				<td><%=rs.getString("birth") %></td>
				<td><%=rs.getString("phone") %></td>
				<td><%=rs.getString("gender") %></td>
				<td><%=rs.getString("city") %></td>
			<% } %> </tr>
	</table>
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>