<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Object obj = session.getAttribute("count");
	int count = (int) obj;
	
	obj = session.getAttribute("noList");
	String[] noList = (String[]) obj;
	
	obj = session.getAttribute("writerList");
	String[] writerList = (String[]) obj;
	
	obj = session.getAttribute("regDateList");
	String[] regDateList = (String[]) obj;
	
	obj = session.getAttribute("subjectList");
	String[] subjectList = (String[]) obj;
	
	obj = session.getAttribute("contentsList");
	String[] contentsList = (String[]) obj;
	
	int index = Integer.parseInt(request.getParameter("index"));
	
	for (int i = 0; i < count; i++) {
		noList[i] = noList[i + 1];
		writerList[i] = writerList[i + 1];
		regDateList[i] = regDateList[i + 1];
		subjectList[i] = subjectList[i + 1];
		contentsList[i] = contentsList[i + 1];
	}
	
	count--;
	
	session.setAttribute("count", count);
	session.setAttribute("noList", noList);
	session.setAttribute("writerList", writerList);
	session.setAttribute("regDateList", regDateList);
	session.setAttribute("subjectList", subjectList);
	session.setAttribute("contentsList", contentsList);
	
	response.sendRedirect("boardMain.jsp");
%>