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
	}
}catch(Exception e){} %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Mini U-Campus</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.6-dist/css/bootstrap.css">
</head>
<body id="target">
<div class="container-fluid">
    <header class="jumbotron text-center">
        <div>
            <h1><a href="index.jsp">Mini U-Campus</a></h1>
        </div>
    </header>
</div>
<div class="container">
	<div class="col-md-3">
		<div class="well">
		<a href="who.jsp" class="btn btn-danger form-r">로그아웃</a>
		<%
		String name = who.replace("professor", "교수").replace("student", "학생");
		out.println("<font size=\"5\">" + name + "</font>");
		%>
		</div>
		<div class="list-group">
			<a class="list-group-item active">MENU</a>
			<%
				if(who.matches(".*professor.*")){
					out.println("<a href=\"lect.jsp\" class=\"list-group-item\">강의계획서 조회</a>" +
							"<a href=\"gangui.jsp\" class=\"list-group-item\">강의과목 조회</a>");
				}
				else if(who.matches(".*student.*")){
					out.println("<a href=\"lect.jsp\" class=\"list-group-item\">강의계획서 조회</a>" +
							"<a href=\"sugang.jsp\" class=\"list-group-item\">수강과목 조회</a>");
				}
			%>
		</div>
	</div>
    <div class="col-md-9">
        <div class="page-header">
            <h1>만든 사람</h1>
        </div>
	    <table class="table">
		    <thead>
		      <tr>
		        <th>학과</th>
		        <th>학번</th>
		        <th>이름</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>컴퓨터소프트웨어</td>
		        <td>2015726076</td>
		        <td>김현구</td>
		      </tr>
		      <tr>
		        <td>컴퓨터소프트웨어</td>
		        <td>2015726031</td>
		        <td>임동건</td>
		      </tr>
		      <tr>
		        <td>컴퓨터소프트웨어</td>
		        <td>2011726062</td>
		        <td>이충하</td>
		      </tr>
		    </tbody>
		  </table>
    </div>
</div>
</body>
</html>