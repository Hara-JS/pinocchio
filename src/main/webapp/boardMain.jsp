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
		<h1>게시판</h1>
		<table border="1">
			<tr>
				<td align="center" width="300px">
					<a href="boardList.jsp">전체 게시물 확인</a>
				</td>
			</tr>
			<tr>
				<td align="center" width="300px">
					<a href="boardAddDummyPro.jsp">더미 게시물 추가</a>
				</td>
			</tr>
			<tr>
				<td align="center" width="300px">
					<a href="boardDeleteAllBoard.jsp">전체 게시물 삭제</a>
				</td>
			</tr>
			<tr>
				<td align="center" width="300px">
					<a href="boardAddBoard.jsp">게시물 추가</a>
				</td>
			</tr>
			<tr>
				<td align="center" width="300px">
					<a href="boardListPaging.jsp">페이징 게시판</a>
				</td>
			</tr>
		</table>
		<br><br>
		<input type="button" value="메인화면" onclick="location.href='main.jsp'">
	</div>

	<%-- footer --%>
	<jsp:include page="02_footer.jsp" />
</body>
</html>