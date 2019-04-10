<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@page import="java.io.File"%>
<%@ page import="java.sql.*"%>
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
		<%
		String lecture_name = request.getParameter("lecture_name");
		String lecture_num = request.getParameter("lecture_num");
		%>
        <div class="page-header">
            <h1><% out.println(lecture_name); %> 강의자료실</h1>
        </div>
        <% if(who.matches(".*professor.*")){%>
        <form class="form-inline"  name="uploadfile" method="post" action="uploadfile.jsp" enctype="multipart/form-data">
        	<% out.println("<input type=\"hidden\" name=\"lecture_name\" value=\"" + lecture_name + "\">"); %>
        	<% out.println("<input type=\"hidden\" name=\"lecture_num\" value=\"" + lecture_num + "\">"); %>
            <div class="form-group">
                <label>파일 설명</label>
                <input type="text" class="form-control" name="file_name">
            </div>
            <div class="form-group">
                <input type="file" name="file">
            </div>
            <button type="submit" class="btn btn-default">업로드</button>
        </form>
		<% }
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rst = null;
		String query = "SELECT * FROM files WHERE lecture_num=" + lecture_num + ";";
		try {
			Class.forName("com.mysql.jdbc.Driver"); // 드라이버 로딩. DriverManager에 등록
			
			String jdbcUrl = "jdbc:mysql://localhost:3306/assignment3"; // 데이터베이스 URL
			String userId = "root"; // 사용자 계정
			String userPass = "960407"; // 사용자 패스워드
			
			conn = DriverManager.getConnection(jdbcUrl, userId, userPass); // Connection객체를 만듬
			stmt = conn.createStatement(); // Statement객체를 만듬
			rst = stmt.executeQuery(query); // Query문을 이용하여 ResultSet객체를 만들어 넣는다
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String saveDir = application.getRealPath("/upload/");
		
		if (rst.next())
		{
			rst.previous();
			out.println("<div class=\"panel panel-default margin-top\"><div class=\"panel-heading\">");;
			out.println("<strong>" + lecture_name + " 강의자료실</strong>");
			out.println("</div><table class=\"table table-bordered\"><thead><tr><th>번호</th><th>설명</th><th>파일</th></tr></thead><tbody>");			
			while (rst.next()) { // ResultSet 객체를 한줄 마다 불러온다
				out.println("<tr><td>" + rst.getRow() + "</td><td>" + rst.getObject(1) + "</td>");
				out.println("<td><span class=\"label label-default\"><a href=\"upload/" + rst.getObject(2) + "\" download>" + rst.getObject(2) + "</a></span></td></tr>");
			}
			out.println("</tbody></table></div>");
		}
		%>
	</div>
</div>
</body>
</html>