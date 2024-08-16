<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	int count = (int) session.getAttribute("count");
	String[] idList = (String[]) session.getAttribute("idList");
	String[] pwList = (String[]) session.getAttribute("pwList");
	String[] nameList = (String[]) session.getAttribute("nameList");
	String[] genderList = (String[]) session.getAttribute("genderList");
	
	String id = (String) session.getAttribute("log");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	int index = -1;
	for (int i = 0; i < count; i++) {
		if (idList[i].equals(id) && pwList[i].equals(pw)) {
			index = i;
			break;
		}
	}
	
	if (index != -1) {
		nameList[index] = name;
		genderList[index] = gender;
	
		session.setAttribute("nameList", nameList);
		session.setAttribute("genderList", genderList);
	
		response.sendRedirect("main.jsp");
	} else {
		response.sendRedirect("updateForm.jsp");
	}
%>