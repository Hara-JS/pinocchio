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
		<h1>먼저 로그인을 해주세요!</h1>
		<form method="post" action="loginPro.jsp">
			<table border="1">
				<tr>
					<td align="center" height="50"><strong>아이디</strong></td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td align="center" height="50"><strong>비밀번호</strong></td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td colspan="2" align="center" height="50"><input type="submit"
						value="로그인">
					</td>
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