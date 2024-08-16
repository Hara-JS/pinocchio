<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("log");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	String dbUrl = "jdbc:mysql://localhost:3306/haraDB?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	boolean check = false;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
		String sql = " SELECT pw FROM member WHERE id=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String memberPw = rs.getString(1);
			if(memberPw.equals(pw)) {
				check = true;
			}
		}
	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
		rs.close();
	}
	
	System.out.println("[updatePro] check = " + check);
	
	if (check) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
			String sql = " UPDATE member SET name=?, gender=? WHERE id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
			
			response.sendRedirect("index.jsp");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
	} else {
		response.sendRedirect("updateForm.jsp");
	}		

//	request.setCharacterEncoding("UTF-8");
	
//	int count = (int) session.getAttribute("count");
//	String[] idList = (String[]) session.getAttribute("idList");
//	String[] pwList = (String[]) session.getAttribute("pwList");
//	String[] nameList = (String[]) session.getAttribute("nameList");
//	String[] genderList = (String[]) session.getAttribute("genderList");
	
//	String id = (String) session.getAttribute("log");
//	String pw = request.getParameter("pw");
//	String name = request.getParameter("name");
//	String gender = request.getParameter("gender");
	
//	int index = -1;
//	for (int i = 0; i < count; i++) {
//		if (idList[i].equals(id) && pwList[i].equals(pw)) {
//			index = i;
//			break;
//		}
//	}
	
//	if (index != -1) {
//		nameList[index] = name;
//		genderList[index] = gender;
	
//		session.setAttribute("nameList", nameList);
//		session.setAttribute("genderList", genderList);
	
//		response.sendRedirect("main.jsp");
//	} else {
//		response.sendRedirect("updateForm.jsp");
//	}
%>