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
	
	// 관리자가 로그인 한 경우
	if (id.equals("hara") && pw.equals("1q2w3e4r!")) {
		response.sendRedirect("adminMain.jsp");
	} else {
		response.sendRedirect("main.jsp");
}
%>