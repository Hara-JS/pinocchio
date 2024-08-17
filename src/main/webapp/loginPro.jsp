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
	
	System.out.println(id);
	System.out.println(pw);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/hara1029?serverTimezone=UTC&useSSL=false";
	String dbId = "hara1029";
	String dbPw = "q1w2e3r4!";
	
	int check = 0;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
		String sql = " SELECT COUNT(*) FROM member WHERE id=? AND pw=? ";
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
		
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("loginForm.jsp");
	}

//	request.setCharacterEncoding("UTF-8");
	
//	int count = (int) session.getAttribute("count");
//	String log = (String) session.getAttribute("log");
	
//	String[] idList = (String[]) session.getAttribute("idList");
//	String[] pwList = (String[]) session.getAttribute("pwList");
	
//	String id = request.getParameter("id");
//	String pw = request.getParameter("pw");
	
//	boolean check = false;
//	for (int i = 0; i < count; i++) {
//		if (idList[i].equals(id) && pwList[i].equals(pw)) {
//			check = true;
//			break;
//		}
//	}
	
//	if (check) {
//		session.setAttribute("log", id);
//		// setMaxInactiveInterval() 메서드는 초단위
//		// 100분 후 세션 삭제
//		session.setMaxInactiveInterval(100 * 60);
	
//		response.sendRedirect("main.jsp");
//	} else {
//		response.sendRedirect("loginForm.jsp");
//	}
%>