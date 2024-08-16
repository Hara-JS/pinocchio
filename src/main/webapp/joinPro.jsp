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
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	String dbUrl = "jdbc:mysql://localhost:3306/haraDB?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// ID 중복검사
	int check = 0;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
		String sql = " SELECT COUNT(*) FROM member WHERE id=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			check = rs.getInt(1);
			System.out.println("[joinPro] check = " + check);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
		rs.close();
	}
	
	if (check > 0) {
		response.sendRedirect("joinForm.jsp");
	} else {

		try {
			// 회원가입
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			String sql = " INSERT INTO member (id, pw, name, gender) VALUES (?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.executeUpdate();
			
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
	}

	// post로 보내서 인코딩
//	request.setCharacterEncoding("UTF-8");
	
//	int count = (int) session.getAttribute("count");
//	String[] idList = (String[]) session.getAttribute("idList");
//	String[] pwList = (String[]) session.getAttribute("pwList");
//	String[] nameList = (String[]) session.getAttribute("nameList");
//	String[] genderList = (String[]) session.getAttribute("genderList");
	
//	String id = request.getParameter("id");
//	String pw = request.getParameter("pw");
//	String name = request.getParameter("name");
//	String gender = request.getParameter("gender");
	
//	boolean check = false;
//	for (int i = 0; i < count; i++) {
//		if (idList[i].equals(id)) {
//			check = true;
//			break;
//		}
//	}
	
	// 아이디 중복검사
//	if (check) {
//		response.sendRedirect("joinForm.jsp");
//	} else {
//		idList[count] = id;
//		pwList[count] = pw;
//		nameList[count] = name;
//		genderList[count] = gender;
	
//		count++;
	
//		session.setAttribute("idList", idList);
//		session.setAttribute("pwList", pwList);
//		session.setAttribute("nameList", nameList);
//		session.setAttribute("genderList", genderList);
//		session.setAttribute("count", count);
	
//		response.sendRedirect("main.jsp");
//	}
%>