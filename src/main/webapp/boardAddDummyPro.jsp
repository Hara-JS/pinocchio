<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Object obj = session.getAttribute("count");
	int count = (int) obj;
	
	obj = session.getAttribute("lastNum");
	int lastNum = (int) obj;
	
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
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = sdf.format(date);
	
	for (int i = 0; i < 10; i++) {
		noList[count] = String.valueOf(lastNum + 1);
		writerList[count] = "작성자" + (lastNum + 1);
		regDateList[count] = strDate;
		subjectList[count] = "제목" + (lastNum + 1);
		contentsList[count] = "내용" + (lastNum + 1);
	
		count++;
		lastNum++;
	}
	
	session.setAttribute("count", count);
	session.setAttribute("noList", noList);
	session.setAttribute("writerList", writerList);
	session.setAttribute("regDateList", regDateList);
	session.setAttribute("subjectList", subjectList);
	session.setAttribute("contentsList", contentsList);
	session.setAttribute("lastNum", lastNum);
	
	response.sendRedirect("boardMain.jsp");
%>