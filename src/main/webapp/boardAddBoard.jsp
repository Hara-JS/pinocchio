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
	Object obj = session.getAttribute("lastNum");
	int lastNum = (int) obj;
	%>

	<div align="center">
		<h1>게시글 추가하기</h1>
		<form method="post" action="boardAddBoardPro.jsp">
			<table border="1">
				<tr>
					<td align="center" width="100px">번호</td>
					<td align="center" width="100px"><%=lastNum + 1%></td>
				</tr>
				<tr>
					<td align="center" width="100px">작성자</td>
					<td align="center" width="100px"><input type="text" name="writer"></td>
				</tr>
				<tr>
					<td align="center" width="100px">제목</td>
					<td align="center" width="100px"><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td align="center" width="100px">내용</td>
					<td align="center" width="100px"><textarea rows="10" cols="50" name="contents"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center" width="100px"><input type="submit" value="작성완료"></td>
				</tr>
			</table>
		</form>
		<br><br>
		<button onclick="location.href='boardMain.jsp'">게시판 메인</button>
	</div>

	<%-- footer --%>
	<jsp:include page="02_footer.jsp" />
</body>
</html>