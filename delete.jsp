<%@page import="java.sql.*"%>
<%@page import="packages.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

JDBC jdbc = new JDBC();
Connection conn = jdbc.getConn();

PreparedStatement pstmt = null;
String sql = "DELETE FROM BOARD WHERE id = ?";

String board_id = session.getAttribute("board_id").toString();

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, board_id);

pstmt.executeUpdate();
request.getRequestDispatcher("board.jsp").forward(request, response);
%>