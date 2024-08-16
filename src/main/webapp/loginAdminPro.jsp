<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/haraDB?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	int check = 0;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
		String sql = " SELECT COUNT(*) FROM admin WHERE id=? AND pw=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			check = rs.getInt(1);
		}
	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
		rs.close();
	}
	
	System.out.println("[loginPro] check = " + check);
	
	if (check > 0) {
		session.setAttribute("log", id);
		session.setMaxInactiveInterval(100 * 60);
	
		response.sendRedirect("adminMain.jsp");
	} else {
		response.sendRedirect("loginAdminForm.jsp");
	}
	
	// request.setCharacterEncoding("UTF-8");
	
	// int count = (int) session.getAttribute("count");
	// String log = (String) session.getAttribute("log");
	
	// String[] idList = (String[]) session.getAttribute("idList");
	// String[] pwList = (String[]) session.getAttribute("pwList");
	
	// String id = request.getParameter("id");
	// String pw = request.getParameter("pw");
	
	// 관리자가 로그인 한 경우
	// if (id.equals("hara") && pw.equals("1q2w3e4r!")) {
	// 	response.sendRedirect("adminMain.jsp");
	// } else {
	// 	response.sendRedirect("main.jsp");
	// }
%>