<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%
String who = request.getParameter("who");                        // 요청에서 id 값을 가져온다.

Cookie cookie = new Cookie("who", who);        // id 라는 이름과 request의 id 값으로 쿠키 생성
response.addCookie(cookie);                    // 쿠키를 응답에 추가
response.sendRedirect("index.jsp");    // cookieMain 으로 리다이렉트
%>