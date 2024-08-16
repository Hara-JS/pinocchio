<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	
	String dbUrl = "jdbc:mysql://localhost:3306/haraDB?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
		String sql = " DELETE FROM member WHERE id=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
	}
	
	response.sendRedirect("adminUserList.jsp");

	// request.setCharacterEncoding("UTF-8");
	
	// int count = (int) session.getAttribute("count");
	
	// String[] idList = (String[]) session.getAttribute("idList");
	// String[] pwList = (String[]) session.getAttribute("pwList");
	// String[] nameList = (String[]) session.getAttribute("nameList");
	 //String[] genderList = (String[]) session.getAttribute("genderList");
	
	// String strIndex = request.getParameter("index");
	// int index = Integer.parseInt(strIndex);
	
	// for (int i = index; i < count - 1; i++) {
	// 	idList[i] = idList[i + 1];
	// 	pwList[i] = pwList[i + 1];
	// 	nameList[i] = nameList[i + 1];
	// 	genderList[i] = genderList[i + 1];
	// }
	// count--;
	
	// session.setAttribute("count", count);
	// session.setAttribute("idList", idList);
	// session.setAttribute("pwList", pwList);
	// session.setAttribute("nameList", nameList);
	// session.setAttribute("genderList", genderList);
	
	// response.sendRedirect("adminUserList.jsp");
%>