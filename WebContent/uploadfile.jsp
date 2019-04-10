<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%@ page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
	
<%
String saveDir = application.getRealPath("/upload/");
int maxSize = 1024*1024*10;
String encType = "UTF-8";

MultipartRequest multipartRequest = new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());

String comment = multipartRequest.getParameter("file_name");
String file = multipartRequest.getFilesystemName("file");
String lecture_name = multipartRequest.getParameter("lecture_name");
String lecture_num = multipartRequest.getParameter("lecture_num");

Connection conn = null;
Statement stmt = null;
String query = "INSERT INTO files (comment, file_name, lecture_num) VALUES ('" + comment + "', '" + file + "', '" + lecture_num + "');";
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

String lecture_name_uni = URLEncoder.encode(lecture_name, "UTF-8");
response.sendRedirect("gangui_store.jsp?lecture_name=" + lecture_name_uni + "&lecture_num=" + lecture_num);
%>