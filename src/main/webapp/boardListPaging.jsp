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
	
		// 전체 게시물 수
		int totalPost = count;
	
		// 한 페이지에 보여줄 게시물 수
		int onePagePost = 5;
	
		//현재 페이지 번호
		int currentPageNum = 1;
	
		if (request.getParameter("currentPageNum") != null) {
			currentPageNum = Integer.parseInt(request.getParameter("currentPageNum"));
		}
	
		// 현재 페이지의 게시물 시작 인덱스 번호
		int startIndex = (currentPageNum - 1) * onePagePost;
	
		// 현재 페이지의 게시물 마지막 인덱스 번호
		int lastIndex = startIndex + onePagePost;
	
		if (lastIndex > totalPost) {
			lastIndex = totalPost;
		}
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
		<% for(int i = startIndex; i < lastIndex; i++) { %>
			<tr>
				<td align="center" width="150px"><%=i + 1 %></td>
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
				<td colspan="6"align="center">
					<button onclick="location.href='boardMain.jsp'">게시판 메인</button>
				</td>
			</tr>
		</table>
	
	<%
		// 전체 페이지 수
		int totalPage = totalPost / onePagePost;
	
		if(totalPost % onePagePost > 0) {
			totalPage++;
		}
		System.out.println("전체페이지수 : " + totalPage);
		
		// 한 페이지에 보여줄 페이지 개수
		int onePage = 5;
		
		// 현재 페이지의 페이지 시작 번호
		int startPageNum = 1;
		
		if(request.getParameter("startPageNum") != null) {
			startPageNum = Integer.parseInt(request.getParameter("startPageNum"));
		}
		
		// 현재 페이지의 페이지 마지막 번호
		int lastPageNum = startPageNum + onePage - 1;
		
		if(lastPageNum > totalPage) {
			lastPageNum = totalPage;
		}
		System.out.println("페이지마지막번호 : " + lastPageNum);
	%>
	
	<% if(startPageNum + 1 > onePage) { %>
		<a href="boardListPaging.jsp?startPageNum=<%=startPageNum - onePage %>&currentPageNum=<%=startPageNum - onePage %>"><strong>[이전]</strong></a>
	<% } %>
	
	<% for(int i = startPageNum; i <= lastPageNum; i++) { %>
		<a href="boardListPaging.jsp?startPageNum=<%=startPageNum %>&currentPageNum=<%=i %>">[<%=i %>]</a>
	<% } %>
	
	<% if(lastPageNum < totalPage) { %>
		<a href="boardListPaging.jsp?startPageNum=<%=startPageNum + onePage %>&currentPageNum=<%=startPageNum + onePage %>"><strong>[다음]</strong></a>
	<% } %>	
	</div>

	<%-- footer --%>
	<jsp:include page="02_footer.jsp" />
</body>
</html>