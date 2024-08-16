<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	int count = (int) session.getAttribute("count");
	String log = (String) session.getAttribute("log");
	
	String[] idList = (String[]) session.getAttribute("idList");
	String[] pwList = (String[]) session.getAttribute("pwList");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean check = false;
	for (int i = 0; i < count; i++) {
		if (idList[i].equals(id) && pwList[i].equals(pw)) {
			check = true;
			break;
		}
	}
	
	if (check) {
		session.setAttribute("log", id);
		// setMaxInactiveInterval() 메서드는 초단위
		// 100분 후 세션 삭제
		session.setMaxInactiveInterval(100 * 60);
	
		response.sendRedirect("main.jsp");
	} else {
		response.sendRedirect("loginForm.jsp");
	}
%>