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
	
	<%
		String[] idList = (String[]) session.getAttribute("idList");
		String[] pwList = (String[]) session.getAttribute("pwList");
		String[] nameList = (String[]) session.getAttribute("nameList");
		String[] genderList = (String[]) session.getAttribute("genderList");
	
		int count = (int) session.getAttribute("count");
	
		String log = (String) session.getAttribute("log");
	
		int index = 0;
		for (int i = 0; i < count; i++) {
			if (idList[i].equals(log)) {
				index = i;
				break;
			}
		}
	%>
	
	<div align="center">
		<h1>회원정보수정</h1>	
		<form method="post" action="updatePro.jsp">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><%=log %></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" value="<%=pwList[index]%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=nameList[index]%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<%
						if(genderList[index].equals("남성")) {
					%>
						<input type="radio" name="gender" value="남성" checked="checked">남성 
						<input type="radio" name="gender" value="여성">여성
						<input type="radio" name="gender" value="선택안함">선택안함
					<% } else if(genderList[index].equals("여성")) {
					%>
						<input type="radio" name="gender" value="남성">남성 
						<input type="radio" name="gender" value="여성" checked="checked">여성
						<input type="radio" name="gender" value="선택안함">선택안함
					<% } else {	%>
						<input type="radio" name="gender" value="남성">남성 
						<input type="radio" name="gender" value="여성">여성
						<input type="radio" name="gender" value="선택안함" checked="checked">선택안함
					<% } %>				
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="입력완료">
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