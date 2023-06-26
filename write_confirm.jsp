<%@page import="java.sql.*"%>
<%@page import="packages.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">


<%
String title = request.getParameter("title");
String content = request.getParameter("content");

JDBC jdbc = new JDBC();
Connection conn = jdbc.getConn();

PreparedStatement pstmt = null;
String board_id = null;
String sql = null;

if (session.getAttribute("board_id") != null) {
	board_id = session.getAttribute("board_id").toString();
	sql = "UPDATE board SET title = ?, content = ?" + " WHERE id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setString(3, board_id);

} else {

	sql = "INSERT INTO BOARD (id, title, content, WRITER)" + " VALUES (seq_board_id.nextval, ?, ?, ?)";

	String writer = session.getAttribute("writer").toString();

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setInt(3, Integer.parseInt(writer));
}
pstmt.executeUpdate();
response.sendRedirect("board.jsp");
%>