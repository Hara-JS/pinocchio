<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//샘플 데이터 저장
	String[] sampleNo = { "1", "2", "3" };
	String[] sampleWriter = { "작성자1", "작성자2", "작성자3" };
	String[] sampleRegDate = { "2024-06-13", "2024-07-13", "2024-08-13" };
	String[] sampleSubject = { "제목1", "제목2", "제목3" };
	String[] sampleContents = { "내용1", "내용2", "내용3" };
	
	// 저장할 수 있는 게시물 수
	int size = 1000;
	String[] noList = new String[size];
	String[] writerList = new String[size];
	String[] regDateList = new String[size];
	String[] subjectList = new String[size];
	String[] contentsList = new String[size];
	
	int count = sampleNo.length;
	for (int i = 0; i < count; i++) {
		noList[i] = sampleNo[i];
		writerList[i] = sampleWriter[i];
		regDateList[i] = sampleRegDate[i];
		subjectList[i] = sampleSubject[i];
		contentsList[i] = sampleContents[i];
	}
	
	int lastNum = count;
	
	session.setAttribute("count", count);
	session.setAttribute("noList", noList);
	session.setAttribute("writerList", writerList);
	session.setAttribute("regDateList", regDateList);
	session.setAttribute("subjectList", subjectList);
	session.setAttribute("contentsList", contentsList);
	session.setAttribute("lastNum", lastNum);
	
	response.sendRedirect("boardMain.jsp");
%>