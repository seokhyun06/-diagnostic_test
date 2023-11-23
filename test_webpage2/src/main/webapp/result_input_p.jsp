<%@ page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>

<%
	request.setCharacterEncoding("UTF-8");

	String sql = "insert into tbl_result_202004 values(?, ?, ?, ?, ?, ?)";
	Connection conn = DBConnect.getConnection();
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1, request.getParameter("p_no"));
	ps.setString(2, request.getParameter("t_code"));
	ps.setString(3, request.getParameter("t_sdate"));
	ps.setString(4, request.getParameter("t_status"));
	ps.setString(5, request.getParameter("t_ldate"));
	ps.setString(6, request.getParameter("t_result"));

	ps.executeUpdate();

 %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>검사결과조회</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>

</body>
</html>