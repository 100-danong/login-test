<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="Nav.jsp" />
<%
if (request.getParameter("isLogout") != null) {
	out.println("<script>alert('로그아웃되었습니다.');</script>");
}
session.setAttribute("connect_page", "index.jsp");
%>



