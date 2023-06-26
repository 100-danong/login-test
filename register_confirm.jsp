<%@page import="java.sql.*"%>
<%@page import="packages.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("ID");
String password = request.getParameter("PW");
String name = request.getParameter("name");

JDBC jdbc = new JDBC();
Connection conn = jdbc.getConn();

PreparedStatement pstmt = null;
String sql = "INSERT INTO CUSTOMER (id, user_id, pw, name) " + 
    "VALUES (seq_customer_id.nextval, ?, ?, ?)";

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, id);
pstmt.setString(2, password);
pstmt.setString(3, name);

pstmt.executeUpdate();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Nav.jsp" />
</head>
<body>
    <%= name %> 님 환영합니다!
    <button onclick="location.href='login.jsp'">로그인</button>
</body>
</html>