<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Nav.jsp"></jsp:include>
<%
session.setAttribute("connect_page", "register.jsp");
%>
</head>
<body>
	<h1>회원가입</h1>
	<form action="register_confirm.jsp" method="get">
		ID<input type="text" name="ID" required
			pattern="^([a-zA-Z0-9_]{4,12}$)" title="영어 대소문자, 숫자, _ 입력가능"><br>

		PW <input type="password" name="PW" required
			pattern="^([a-zA-Z0-9_]{8,20}$)"
			title="8글자 이상 20글자 이하, 영어 대소문자, 숫자, _ 입력가능"><br> name <input
			type="text" name="name" required><br> <input
			type="submit">
	</form>
</body>
</html>