<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int count = 0;
	
	int size = 1000;
	String[] noList = new String[size];
	String[] writerList = new String[size];
	String[] regDateList = new String[size];
	String[] subjectList = new String[size];
	String[] contentsList = new String[size];
	
	session.setAttribute("count", count);
	session.setAttribute("noList", noList);
	session.setAttribute("writerList", writerList);
	session.setAttribute("regDateList", regDateList);
	session.setAttribute("subjectList", subjectList);
	session.setAttribute("contentsList", contentsList);
	
	response.sendRedirect("boardMain.jsp");
%>