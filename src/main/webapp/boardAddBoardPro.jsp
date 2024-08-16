<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
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
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = sdf.format(date);
	
	noList[count] = String.valueOf(lastNum + 1);
	writerList[count] = writer;
	regDateList[count] = strDate;
	subjectList[count] = subject;
	contentsList[count] = contents;
	
	count++;
	lastNum++;
	
	session.setAttribute("count", count);
	session.setAttribute("noList", noList);
	session.setAttribute("writerList", writerList);
	session.setAttribute("regDateList", regDateList);
	session.setAttribute("subjectList", subjectList);
	session.setAttribute("contentsList", contentsList);
	session.setAttribute("lastNum", lastNum);
	
	response.sendRedirect("boardMain.jsp");
%>