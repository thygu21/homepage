<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%
String who = "";

try{
	Cookie[] cookies = request.getCookies();

	if(cookies!=null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("who")){
				who=cookies[i].getValue();
			}
		}
		if(who.matches(".*professor.*") || who.matches(".*student.*")){
			response.sendRedirect("main.jsp");
		}
		else {
			response.sendRedirect("who.jsp");
		}
	}
	else {
		response.sendRedirect("who.jsp");
	}
}catch(Exception e){}
%>