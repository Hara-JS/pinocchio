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
	
	String dbUrl = "jdbc:mysql://localhost:3306/haraDB?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int check = -1;
	
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
				check = 1;
			}
		}
	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
		rs.close();
	}
	
	System.out.println("[deletePro] check = " + check);
	
	if (check == -1) {
		response.sendRedirect("deleteForm.jsp");
	} else {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
			String sql = " DELETE FROM member WHERE id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			session.invalidate();
			response.sendRedirect("index.jsp");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
	}

//	request.setCharacterEncoding("UTF-8");
	
//	int count = (int) session.getAttribute("count");
	
//	String id = (String) session.getAttribute("log");
	
//	String[] idList = (String[]) session.getAttribute("idList");
//	String[] pwList = (String[]) session.getAttribute("pwList");
//	String[] nameList = (String[]) session.getAttribute("nameList");
//	String[] genderList = (String[]) session.getAttribute("genderList");
	
//	String pw = request.getParameter("pw");
	
//	int delIndex = 0;
//	String dbPw = "";
	
//	for (int i = 0; i < count; i++) {
//		if (idList[i].equals(id)) {
//			dbPw = pwList[i];
//			delIndex = i;
//			break;
//		}
//	}
	
//	if (pw.equals(dbPw)) {
//		for (int i = delIndex; i < count - 1; i++) {
//			idList[i] = idList[i + 1];
//			pwList[i] = pwList[i + 1];
//			nameList[i] = nameList[i + 1];
//			genderList[i] = genderList[i + 1];
//		}
//		count--;
	
//		session.removeAttribute("log");
	
//		session.setAttribute("count", count);
//		session.setAttribute("idList", idList);
//		session.setAttribute("pwList", pwList);
//		session.setAttribute("nameList", nameList);
//		session.setAttribute("genderList", genderList);
	
//		response.sendRedirect("main.jsp");
//	} else {
//		response.sendRedirect("deleteForm.jsp");
//	}
%>