<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
//		request.setCharacterEncoding("UTF-8");
	
//		int count = (int) session.getAttribute("count");
		
//		String[] idList = (String[]) session.getAttribute("idList");
//		String[] pwList = (String[]) session.getAttribute("pwList");
//		String[] nameList = (String[]) session.getAttribute("nameList");
//		String[] genderList = (String[]) session.getAttribute("genderList");

		String dbUrl = "jdbc:mysql://localhost:3306/hara1029?serverTimezone=UTC&useSSL=false";
		String dbId = "hara1029";
		String dbPw = "q1w2e3r4!";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		int count = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
			String sql = " SELECT COUNT(*) FROM member ";
			pstmt = conn.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				conn.close();
				pstmt.close();
				rs.close();
		}

		String[] idList = new String[count];
		String[] pwList = new String[count];
		String[] nameList = new String[count];
		String[] genderList = new String[count];
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
			String sql = " SELECT * FROM member ";
			pstmt = conn.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			
			int index = 0;
			while(rs.next()) {
				idList[index] = rs.getString(1);
				pwList[index] = rs.getString(2);
				nameList[index] = rs.getString(3);
				genderList[index] = rs.getString(4);
				
				index++;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				conn.close();
				pstmt.close();
				rs.close();
		}
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
				<td><%=idList[i] %></td>
				<td><%=pwList[i] %></td>
				<td><%=nameList[i] %></td>
				<td><%=genderList[i] %></td>
				<td><input type="button" value="삭제" onclick="location.href='adminUserDelete.jsp?id=<%=idList[i] %>'"></td>
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