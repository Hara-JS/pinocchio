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
<title>hara</title>
</head>
<body>
	<%-- header --%>
	<jsp:include page="01_header.jsp" />

	<%
		Connection conn = null;
	
		PreparedStatement pstmt = null;
	
		ResultSet rs = null;
	
		try {
			String dbUrl = "jdbc:mysql://localhost:3306/hara1029?serverTimezone=UTC&useSSL=false";
			String dbId = "hara1029";
			String dbPw = "q1w2e3r4!";
	
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
			String sql = " SELECT * FROM ";
			pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
	
			rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// db 사용후엔 반드시 닫아줘야 함
			if (conn != null) {
				conn.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
	%>

	<%-- footer --%>
	<jsp:include page="02_footer.jsp" />
</body>
</html>