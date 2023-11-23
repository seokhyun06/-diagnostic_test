<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>

	<%
		String sql = "select p.p_city as �����ڵ�," +
					" case p_city when '10' then '����' when '20' then '���' when '30' then '����' when '40' then '�뱸' end as ������," +
					" count(p_city) as �˻�Ǽ�" +
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
<title>�������˻�Ǽ�</title>
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
<h2> ȯ�� ��ȸ </h2>
	<table class = "table_style" style="width: 500px">
		<tr>
			<th> �����ڵ� </th>
			<th> ������ </th>
			<th> �˻�Ǽ� </th>
		</tr>
			<%while(rs.next()) { %>
		<tr>
			<td><%= rs.getString("�����ڵ�") %></td>
			<td><%= rs.getString("������") %></td>
			<td><%= rs.getString("�˻�Ǽ�") %></td>
		</tr>
	<% } %>
	</table> 
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>