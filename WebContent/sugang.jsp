<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
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
        <div class="page-header">
            <h1>수강과목 조회</h1>
        </div>
        <form class="form-inline"  name="sugangsearch" method="get" action="sugang.jsp">
            <div class="form-group">
                <label>년도</label>
                <input class="form-control" name="year" value="2016">
            </div>
            <div class="form-group">
	            <label>학기</label>
	            <select class="form-control" name="semester">
	                <option>1학기</option>
	                <option>여름학기</option>
	                <option>2학기</option>
	                <option>겨울학기</option>
	            </select>
            </div>
            <button type="submit" class="btn btn-default">수강과목 조회</button>
        </form>
		<%
		String student_name = who.replace("student", "학생");   
		String year = request.getParameter("year");
		String semester = request.getParameter("semester");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rst = null;
		String query = "SELECT * FROM lecture WHERE lecture_num IN (SELECT lecture_num FROM sugang WHERE student_num= (SELECT number FROM students WHERE name='" + student_name + "')) AND year=" + year + " AND semester='" + semester + "';";
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
		
		if (rst.next())
		{
			if(who.matches(".*student.*")){
				rst.previous();
				out.println("<div class=\"panel panel-default margin-top\"><div class=\"panel-heading\">");
				out.println("<strong>" + year + "년도 " + semester + " 대학 수강과목</strong>");
				out.println("</div><table class=\"table table-bordered\"><thead><tr><th>번호</th><th>과목명</th><th>담당교수</th><th>학정번호</th><th>인원</th><th>강의자료실</th></tr></thead><tbody>");			
				while (rst.next()) { // ResultSet 객체를 한줄 마다 불러온다
					out.println("<tr><td>" + rst.getRow() + "</td><td>" + rst.getObject(1) + "</td><td>" + rst.getObject(2) + "</td><td>" + rst.getObject(3) + "</td><td>" + rst.getObject(4) + "</td>" +
					"<td><form name=\"gangui_store\" method=\"post\" action=\"gangui_store.jsp\">" +
		            "<input type=\"hidden\" name=\"lecture_name\" value=\"" + rst.getObject(1) + "\">" +
                	"<input type=\"hidden\" name=\"lecture_num\" value=\"" + rst.getObject(3) + "\">" +
                	"<button type=\"submit\" class=\"btn btn-default btn-xs\">강의자료실</button>" +
            		"</form></td></tr>");
				}
				out.println("</tbody></table></div>");
			}
		}
		%>
		</div>
</div>
</body>
</html>