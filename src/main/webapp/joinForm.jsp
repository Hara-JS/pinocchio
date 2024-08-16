<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hara</title>
</head>
<body>
	<%-- header --%>
	<jsp:include page="01_header.jsp" />
	
	<div align="center">
		<h1>회원가입</h1>
		<form method="post" action="joinPro.jsp">
			<table border="1">
				<tr>
					<td align="center">아이디</td>
					<td align="center"><input type="text" name="id"></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td align="center"><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td align="center"><input type="text" name="name"></td>
				</tr>
				<tr>
					<td align="center">성별</td>
					<td align="center"><input type="radio" name="gender" value="남성">남성 <input
						type="radio" name="gender" value="여성">여성 <input
						type="radio" name="gender" value="선택안함">선택안함</td>
				</tr>
				<tr>
					<td colspan="2" align="center" height="50"><input type="submit"
						value="회원가입"></td>
				</tr>
			</table>
		</form>
		<br><br>
		<input type="button" value="메인화면" onclick="location.href='main.jsp'">
	</div>
	
	<%-- footer --%>
	<jsp:include page="02_footer.jsp" />	
</body>
</html>