<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	// 회원 샘플 데이터 저장
	String[] sampleId = { "가오리", "수달", "강아지", "고양이" };
	String[] samplePw = { "1111", "2222", "3333", "4444" };
	String[] sampleName = { "현광용", "홍민주", "정소라", "고유나" };
	String[] sampleGender = { "남성", "선택안함", "여성", "선택안함" };
	
	// 저장할 수 있는 최대 회원 수
	int size = 100;
	String[] idList = new String[size];
	String[] pwList = new String[size];
	String[] nameList = new String[size];
	String[] genderList = new String[size];
	
	// 저장된 회원 수
	int count = sampleId.length;
	for (int i = 0; i < count; i++) {
		idList[i] = sampleId[i];
		pwList[i] = samplePw[i];
		nameList[i] = sampleName[i];
		genderList[i] = sampleGender[i];
	}
	
	// 전체 회원정보 출력
	for (int i = 0; i < count; i++) {
		System.out.println(idList[i] + ", " + pwList[i] + ", " + nameList[i] + ", " + genderList[i]);
	}
	
	// 로그인 상태를 확인할 수 있는 log 변수를 세션에 저장
	session.setAttribute("log", null);
	
	// 전체 회원 수 세션에 저장
	session.setAttribute("count", count);
	
	// 세션에 회원정보 저장
	session.setAttribute("idList", idList);
	session.setAttribute("pwList", pwList);
	session.setAttribute("nameList", nameList);
	session.setAttribute("genderList", genderList);
	
	// 메인 페이지 이동
	response.sendRedirect("main.jsp");
%>