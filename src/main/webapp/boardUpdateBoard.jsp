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
		request.setCharacterEncoding("UTF-8");
	
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
	
		int index = Integer.parseInt(request.getParameter("index"));
	%>
	
	<div align="center">
	<h1>게시물 수정하기</h1>
	<form method="post" action="boardUpdateBoardPro.jsp">
		<table border="1">
				<tr>
					<td align="center" width="100px">번호</td>
					<td colspan="3" align="center" width="100px"><%=noList[index] %></td>
				</tr>
				<tr>
					<td align="center" width="100px">작성자</td>
					<td align="center" width="100px"><%=writerList[index] %></td>
					<td align="center" width="100px">작성일</td>
					<td align="center" width="100px"><%=regDateList[index] %></td>
				</tr>
				<tr>
					<td align="center" width="100px">제목</td>
					<td align="center" colspan="3" width="100px">
						<input type="text" name="subject" value="<%=subjectList[index] %>">
					</td>
				</tr>
				<tr>
					<td align="center" width="100px">내용</td>
					<td align="center" colspan="3" width="100px">
					<textarea rows="10" cols="50" name="contents"><%=contentsList[index] %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center" width="100px">
						<input type="hidden" name="index" value="<%=index %>">				
						<input type="submit" value="수정하기">
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<button onclick="location.href='boardMain.jsp'">게시판 메인</button>
					</td>
				</tr>
		</table>
	</form>
	</div>

	<%-- footer --%>
	<jsp:include page="02_footer.jsp" />
</body>
</html>