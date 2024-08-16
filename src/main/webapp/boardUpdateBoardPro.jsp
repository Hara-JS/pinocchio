<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj = session.getAttribute("subjectList");
	String[] subjectList = (String[]) obj;
	
	obj = session.getAttribute("contentsList");
	String[] contentsList = (String[]) obj;
	
	int index = Integer.parseInt(request.getParameter("index"));
	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	
	subjectList[index] = subject;
	contentsList[index] = contents;
	
	session.setAttribute("subjectList", subjectList);
	session.setAttribute("contentsList", contentsList);
	
	response.sendRedirect("boardMain.jsp");
%>