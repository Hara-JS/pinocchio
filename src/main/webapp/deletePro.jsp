<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");
	
	int count = (int) session.getAttribute("count");
	
	String id = (String) session.getAttribute("log");
	
	String[] idList = (String[]) session.getAttribute("idList");
	String[] pwList = (String[]) session.getAttribute("pwList");
	String[] nameList = (String[]) session.getAttribute("nameList");
	String[] genderList = (String[]) session.getAttribute("genderList");
	
	String pw = request.getParameter("pw");
	
	int delIndex = 0;
	String dbPw = "";
	
	for (int i = 0; i < count; i++) {
		if (idList[i].equals(id)) {
			dbPw = pwList[i];
			delIndex = i;
			break;
		}
	}
	
	if (pw.equals(dbPw)) {
		for (int i = delIndex; i < count - 1; i++) {
			idList[i] = idList[i + 1];
			pwList[i] = pwList[i + 1];
			nameList[i] = nameList[i + 1];
			genderList[i] = genderList[i + 1];
		}
		count--;
	
		session.removeAttribute("log");
	
		session.setAttribute("count", count);
		session.setAttribute("idList", idList);
		session.setAttribute("pwList", pwList);
		session.setAttribute("nameList", nameList);
		session.setAttribute("genderList", genderList);
	
		response.sendRedirect("main.jsp");
	} else {
		response.sendRedirect("deleteForm.jsp");
	}
%>