<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>

<!DOCTYPE html>

	<%
		String sql = "select p.p_no, p.p_name, l.t_name," +
					" to_char(t.t_sdate, 'yyyy-mm-dd') sdate," +
					" case t.t_status when '1' then '검사중' when '2' then '검사완료' end as status," +
					" to_char(t.t_ldate, 'yyyy-mm-dd') ldate," +
					" case t.t_result when 'X' then '미입력' when 'P' then '양성' else '음성' end as result" +
					" from TBL_PATIENT_202004 p, TBL_LAB_TEST_202004 l, TBL_RESULT_202004 t" +
					" where p.p_no = t.p_no and t.t_code = l.t_code" +
					" order by p_no";
				
		Connection conn = DBConnect.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
	%>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과조회</title>
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
<h2>검사결과조회</h2>
	<table class = "table_style">
		<tr>
			<th>환자번호</th>
			<th>환자명</th>
			<th>검사명</th>
			<th>검사시작일</th>
			<th>검사상태</th>
			<th>검사완료일</th>
			<th>검사결과</th>
		</tr>
			<%while(rs.next()){ %>
		<tr>
				<td><%=rs.getString("p_no") %></td>
				<td><%=rs.getString("p_name") %></td>
				<td><%=rs.getString("t_name") %></td>
				<td><%=rs.getString("sdate") %></td>
				<td><%=rs.getString("status") %></td>
				<td><%=rs.getString("ldate") %></td>
				<td><%=rs.getString("result") %></td>
			<% } %> </tr>
	</table>
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>