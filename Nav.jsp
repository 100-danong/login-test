<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
nav div {
	background-color: yellow;
	margin-bottom: 20px;
	margin-left: 0px;
	height: 25px;
	padding: 5px 5px 5px 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

button {
	margin: 0px 20px;
}
</style>
<%
boolean isLogined = false;
if(session.getAttribute("user_id") != null) 
isLogined = true;
%>
<nav>
	<div>
		<button onclick="location.href='register.jsp'">회원가입</button>
		<%
    	if(isLogined) {
    	%>
		<button onclick="location.href='logout.jsp'">로그아웃</button>
		<%
    	}else{
    	%>
		<button onclick="location.href='login.jsp'">로그인</button>
		<%
    	}
    	%>
		<button onclick="location.href='board.jsp'">게시판</button>
		<button onclick="location.href='index.jsp'">홈으로</button>
	</div>
</nav>