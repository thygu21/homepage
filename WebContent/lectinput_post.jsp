<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<% 
String professor = "";

try{
	Cookie[] cookies = request.getCookies();

	if(cookies!=null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("who")){
				professor=cookies[i].getValue().replace("professor", "교수");
			}
		}
	}
}catch(Exception e){} %>

<%

String lecture_name = request.getParameter("lecture_name");
String lecture_num = request.getParameter("lecture_num");
String max_num = request.getParameter("max_num");
String year = request.getParameter("year");
String semester = request.getParameter("semester");

Connection conn = null;
Statement stmt = null;
String query = "INSERT INTO lecture (lecture_name, professor, lecture_num, max_num, year, semester) VALUES ('" + lecture_name + "', '" + professor + "', '" + lecture_num + "', '" + max_num + "', '" + year + "', '" + semester + "');";
try {
	Class.forName("com.mysql.jdbc.Driver"); // 드라이버 로딩. DriverManager에 등록
	
	String jdbcUrl = "jdbc:mysql://localhost:3306/assignment3"; // 데이터베이스 URL
	String userId = "root"; // 사용자 계정
	String userPass = "960407"; // 사용자 패스워드
	
	conn = DriverManager.getConnection(jdbcUrl, userId, userPass); // Connection객체를 만듬
	stmt = conn.createStatement(); // Statement객체를 만듬
	stmt.executeUpdate(query); // Query문을 이용하여 ResultSet객체를 만들어 넣는다
} catch (SQLException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

String semester_uni = URLEncoder.encode(semester, "UTF-8");
response.sendRedirect("lect.jsp?year=" + year + "&semester=" + semester_uni);
%>