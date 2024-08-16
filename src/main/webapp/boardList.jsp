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
		Object obj = session.getAttribute("count");
		int count = (int) obj;
	
		obj = session.getAttribute("noList");
		String[] noList = (String[]) obj;
	
		obj = session.getAttribute("writerList");
		String[] writerList = (String[]) obj;
	
		obj = session.getAttribute("regDateList");
		String[] regDateList = (String[]) obj;
	
		obj = session.getAttribute("subjectList");
		String[] subjectList = (String[]) obj;
	
		obj = session.getAttribute("contentsList");
		String[] contentsList = (String[]) obj;
	%>

	<div align="center">
		<h1>
			총 <%=count%>개의 게시물이 있습니다.
		</h1>

		<table border="1">
			<tr>
				<td align="center" width="150px">번호</td>
				<td align="center" width="150px">작성자</td>
				<td align="center" width="150px">작성일</td>
				<td align="center" width="150px">제목</td>
				<td align="center" width="150px">내용</td>
				<td align="center" width="150px">삭제</td>
			</tr>
			<% for(int i = 0; i < count; i++) {%>
			<tr>
				<td align="center" width="150px"><%=noList[i] %></td>
				<td align="center" width="150px"><%=writerList[i] %></td>
				<td align="center" width="150px"><%=regDateList[i] %></td>
				<td align="center" width="150px">
					<a href="boardUpdateBoard.jsp?index=<%=i %>"><%=subjectList[i] %></a>
				</td>
				<td align="center" width="150px"><%=contentsList[i] %></td>
				<td align="center" width="150px">
					<button onclick="location.href='boardDelete.jsp?index=<%=i %>'">삭제하기</button>
				</td>
			</tr>
			<% } %>
			<tr>
				<td colspan="6" align="center" width="150px">
					<button onclick="location.href='boardMain.jsp'">게시판 메인</button>
				</td>
			</tr>
		</table>
	</div>

	<%-- footer --%>
	<jsp:include page="02_footer.jsp" />
</body>
</html>