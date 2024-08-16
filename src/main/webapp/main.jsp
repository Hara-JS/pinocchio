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
		<table border="1">
			<tr>
				<td align="center">
					<% String log = (String) session.getAttribute("log"); %>
					<% if (log == null) { %>
						<a href="joinForm.jsp">회원가입</a>
						<a href="loginForm.jsp">로그인</a>
						<a href="loginAdminForm.jsp">관리자</a>						
					<% } else { %>
						[<strong><%=log %></strong>님 반갑습니다.]
						<a href="boardIndex.jsp">게시판</a>
						<a href="logoutPro.jsp">로그아웃</a>
						<a href="updateForm.jsp">회원정보수정</a>
						<a href="deleteForm.jsp">회원탈퇴</a>										
					<% } %>
				</td>
			</tr>
		</table><br>
	<img src="img/pinocchio.png" height="300"><br><br>
	봐 이게 내가 만든 홈페이지야
	</div>
	
	<%-- footer --%>
	<jsp:include page="02_footer.jsp" />	
</body>
</html>