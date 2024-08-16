<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hara</title>
</head>
<body>
	<%-- top --%>
	<jsp:include page="01_header.jsp" />

	<%
		request.setCharacterEncoding("UTF-8");
	
		int count = (int) session.getAttribute("count");
		
		String[] idList = (String[]) session.getAttribute("idList");
		String[] pwList = (String[]) session.getAttribute("pwList");
		String[] nameList = (String[]) session.getAttribute("nameList");
		String[] genderList = (String[]) session.getAttribute("genderList");
	%>

	<div align="center">
		<h1>관리자 페이지(회원 정보 확인)</h1>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>성별</td>
				<td>삭제</td>
			</tr>
			<%
			for (int i = 0; i < count; i++) {
			%>
			<tr>
				<td><%=idList[i]%></td>
				<td><%=pwList[i]%></td>
				<td><%=nameList[i]%></td>
				<td><%=genderList[i]%></td>
				<td><input type="button" value="삭제" onclick="location.href='adminUserDelete.jsp?index=<%=i%>'"></td>
			</tr>
			<%
			}
			%>
		</table>
		<br> <br>
		<input type="button" value="관리자 페이지" onclick="location.href='adminMain.jsp'">
	</div>

	<%-- footer --%>
	<jsp:include page="02_footer.jsp" />	
</body>
</html>