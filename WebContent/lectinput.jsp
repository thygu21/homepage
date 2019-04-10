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
            <h1>강의계획서 입력</h1>
        </div>
        <form class="form-horizontal" name="lectinput" method="post" action="lectinput_post.jsp">
            <div class="form-group">
                <label for="year" class="col-sm-1 control-label">년도</label>
                <div class="col-sm-5">
                    <input type="text" name="year" class="form-control">
                </div>
                <label for="semester" class="col-sm-1 control-label">학기</label>
  				<div class="col-sm-4">
		            <select class="form-control" name="semester">
		                <option>1학기</option>
		                <option>여름학기</option>
		                <option>2학기</option>
		                <option>겨울학기</option>
		            </select>
	            </div>
            </div>
            <div class="form-group">
                <label for="lecture_name" class="col-sm-1 control-label">과목명</label>
                <div class="col-sm-10">
                    <input type="text" name="lecture_name" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="lecture_num" class="col-sm-1 control-label">학정번호</label>
                <div class="col-sm-10">
                    <input type="text" name="lecture_num" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="max_num" class="col-sm-1 control-label">인원</label>
                <div class="col-sm-10">
                    <input type="text" name="max_num" class="form-control">
                </div>
            </div>
            <div class="form-group right_padding">
                <div>
                    <button type="submit" class="btn btn-success form-r">확인</button>
                    <a href="lect.jsp" class="btn btn-default form-r">취소</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>