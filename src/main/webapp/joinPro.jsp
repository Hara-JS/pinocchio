<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// post로 보내서 인코딩
	request.setCharacterEncoding("UTF-8");
	
	int count = (int) session.getAttribute("count");
	String[] idList = (String[]) session.getAttribute("idList");
	String[] pwList = (String[]) session.getAttribute("pwList");
	String[] nameList = (String[]) session.getAttribute("nameList");
	String[] genderList = (String[]) session.getAttribute("genderList");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	boolean check = false;
	for (int i = 0; i < count; i++) {
		if (idList[i].equals(id)) {
			check = true;
			break;
		}
	}
	
	// 아이디 중복검사
	if (check) {
		response.sendRedirect("joinForm.jsp");
	} else {
		idList[count] = id;
		pwList[count] = pw;
		nameList[count] = name;
		genderList[count] = gender;
	
		count++;
	
		session.setAttribute("idList", idList);
		session.setAttribute("pwList", pwList);
		session.setAttribute("nameList", nameList);
		session.setAttribute("genderList", genderList);
		session.setAttribute("count", count);
	
		response.sendRedirect("main.jsp");
	}
%>