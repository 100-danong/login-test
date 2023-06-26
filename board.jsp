<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="packages.JDBC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

session.setAttribute("connect_page", "board.jsp");

JDBC jdbc = new JDBC();
Connection conn = jdbc.getConn();
PreparedStatement pstmt = null;

String sql = "SELECT bo.id, bo.title, cu.name " +
"FROM BOARD bo, CUSTOMER cu " +
"WHERE bo.writer = cu.id";

pstmt = conn.prepareStatement(sql);

ResultSet rs = pstmt.executeQuery();
%>

<html>
<head>
<style>
*{
box-sizing: border-box;
margin: 0 auto;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Nav.jsp" />
</head>
<body>
<button onclick="location.href='write.jsp'">글쓰기</button>
    <table border=1 style="margin: 0 auto; text-align: center;">
        <tr>
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
        </tr>
        <%
        int num = 1;
        while (rs.next()) {
        %>
        <tr>
            <td><%= num %></td>
            <td><a href = "view.jsp?board_id=<%= rs.getString(1) %>"><%= rs.getString(2) %></a></td>
            <td><%= rs.getString(3) %></td>
        </tr>
        <%    
        num++;
            }
        %>
    </table>
</body>
</html>