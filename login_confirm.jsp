<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="packages.JDBC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<%
String user_id = request.getParameter("ID");
String user_password = request.getParameter("PW");

JDBC jdbc = new JDBC();
Connection conn = jdbc.getConn();

PreparedStatement pstmt = null;

String sql = "SELECT id, user_id, pw, name FROM customer " + 
    "WHERE user_id = ? and pw = ?";

pstmt = conn.prepareStatement(sql);

pstmt.setString(1,user_id);
pstmt.setString(2, user_password);

ResultSet rs = pstmt.executeQuery();

if(rs.next()) {
    session.setAttribute("user_id", user_id);
    session.setAttribute("user_pw", user_password);
 	session.setAttribute("writer", rs.getInt("id"));
    response.sendRedirect("board.jsp");
} else {
    request.setAttribute("login", "failed");
    request.getRequestDispatcher("login.jsp").forward(request,response);
}

%>