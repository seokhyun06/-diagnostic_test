<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>검사결과입력</title>
<link rel = "stylesheet" href = "css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.p_no.value) {
			data.p_no.focus();
			alert("환자번호가 입력되지 않았습니다!");
			return false;
			
		} else if(!document.data.t_code.value) {
			data.t_code.focus();
			alert("검사코드가 입력되지 않았습니다!");
			return false;
			
		} else if(!document.data.t_sdate.value) {
			data.t_sdate.focus();
			alert("검사시작일자가 입력되지 않았습니다!");
			return false;
			
		} else if(!document.data.t_status.value) {
			data.t_status.focus();
			alert("검사상태가 입력되지 않았습니다!");
			return false;
			
		} else if(!document.data.t_ldate.value) {
			data.t_ldate.focus();
			alert("검사완료일자가 입력되지 않았습니다!");
			return false;
			
		} else if(!document.data.t_result.value) {
			data.t_result.focus();
			alert("검사결과가 입력되지 않았습니다!");
			return false;
		}
			alert("검사결과가 정상적으로 등록 되었습니다.");
			return true;
	}
	function rewrite() {
		alert("정보를 지우고 처음부터 다시 입력 합니다!");
		return location.href = 'result_input.jsp';
		
	}
</script>
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>

<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
<form action="result_input_p.jsp" name = "data" method = "post" onsubmit="return checkValue()">
<h2> 검사결과입력 </h2>
	<table class = "table_style" style = "width: 500px">
		<tr>
			<th>환자번호</th>
			<td style="text-align: left;"><input type = "text" name = "p_no">&nbsp예)1001</td>
		</tr>
		
		<tr>
			<th>검사코드</th>
			<td style="text-align: left;">
			<select name = "t_code">
				<option value = "">검사명</option>
				<option value = "T001">[T001]결핵</option>
				<option value = "T002">[T002]장티푸스</option>
				<option value = "T003">[T003]수두</option>
				<option value = "T004">[T004]홍역</option>
				<option value = "T005">[T005]콜레라</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<th>검사시작일자</th>
			<td style="text-align: left;"><input type = "text" name = "t_sdate">&nbsp예)20200101</td>
		</tr>
		
		<tr>
			<th>검사상태</th>
			<td style="text-align: left;"><input type = "radio" name = "t_status" value = "1">검사중
			<input type = "radio" name = "t_status" value = "2">검사완료</td>
		</tr>
		
		<tr>
			<th>검사완료일자</th>
			<td style="text-align: left;"><input type = "text" name = "t_ldate">&nbsp예)20200101</td>
		</tr>
		
		<tr>
			<th>검사결과</th>
			<td style="text-align: left;"><input type = "radio" name = "t_result" value = "X"> 미입력
				<input type = "radio" name = "t_result" value = "P"> 양성
				<input type = "radio" name = "t_result" value = "N"> 음성 </td>
		</tr>
		
		<tr>
			<th colspan = 2><input type = "submit" value = "검사결과등록" onclick = "location.href = 'index.jsp'">
							<input type = "button" value = "다시쓰기" onclick = "return rewrite()"></th>
		
		</tr>
	</table>
</form>
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>