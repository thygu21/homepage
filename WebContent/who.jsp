<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
Cookie[] cookies = request.getCookies();

for(int i = 0 ; i<cookies.length; i++){
cookies[i].setMaxAge(0);
response.addCookie(cookies[i]);
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Mini U-Campus</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.6-dist/css/bootstrap.css">
</head>
<body id="target" class="jumbotron text-center">
	<div class="container">
        <div>
            <h1 style="color:white;">당신은 누구십니까?</h1>
            <br><br><br>
	            <div class="col-sm-3">
					<form name="login" method="post" action="login.jsp">
                		<input type="hidden" name="who" value="professor1">
						<button type="submit" class="btn btn-danger btn-lg btn-block">교수1</button>
            		</form>
	            </div>
	            <div class="col-sm-3">
					<form name="login" method="post" action="login.jsp">
                		<input type="hidden" name="who" value="professor2">
						<button type="submit" class="btn btn-danger btn-lg btn-block">교수2</button>
            		</form>
	            </div>
	            <div class="col-sm-3">
					<form name="login" method="post" action="login.jsp">
                		<input type="hidden" name="who" value="professor3">
						<button type="submit" class="btn btn-danger btn-lg btn-block">교수3</button>
            		</form>
	            </div>
	            <div class="col-sm-3">
					<form name="login" method="post" action="login.jsp">
                		<input type="hidden" name="who" value="professor4">
						<button type="submit" class="btn btn-danger btn-lg btn-block">교수4</button>
            		</form>
	            </div>
	            <div class="col-sm-3">
					<form name="login" method="post" action="login.jsp">
                		<input type="hidden" name="who" value="student1">
						<button type="submit" class="btn btn-primary btn-lg btn-block">학생1</button>
            		</form>
	            </div>
	            <div class="col-sm-3">
					<form name="login" method="post" action="login.jsp">
                		<input type="hidden" name="who" value="student2">
						<button type="submit" class="btn btn-primary btn-lg btn-block">학생2</button>
            		</form>
	            </div>
	            <div class="col-sm-3">
					<form name="login" method="post" action="login.jsp">
                		<input type="hidden" name="who" value="student3">
						<button type="submit" class="btn btn-primary btn-lg btn-block">학생3</button>
            		</form>
	            </div>
	            <div class="col-sm-3">
					<form name="login" method="post" action="login.jsp">
                		<input type="hidden" name="who" value="student4">
						<button type="submit" class="btn btn-primary btn-lg btn-block">학생4</button>
            		</form>
	            </div>
            <br>
        </div>
	</div>
</body>
</html>