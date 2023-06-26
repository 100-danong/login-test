<%@page import="java.nio.Buffer"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="packages.JDBC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Nav.jsp" />
<%
String board_id = request.getParameter("board_id").toString();
session.setAttribute("board_id", board_id);

session.setAttribute("connect_page", "view.jsp?board_id=" + board_id);

JDBC jdbc = new JDBC();
Connection conn = jdbc.getConn();

PreparedStatement pstmt = null;

String sql = "SELECT id, title, content, writer FROM board " + "WHERE id = ?";

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, board_id);

ResultSet rs = pstmt.executeQuery();
rs.next();

Statement stmt = conn.createStatement();

String sql2 = "SELECT writer, content, write_date FROM reply";

ResultSet rs2 = stmt.executeQuery(sql2);

PreparedStatement pstmt3 = null;

String sql3 = "SELECT id, name FROM customer " + "WHERE id = ?";

pstmt3 = conn.prepareStatement(sql);

pstmt3.setString(1, session.getAttribute("writer").toString());

ResultSet rs3 = pstmt.executeQuery();
boolean canWriteReply = false;

if (rs3.next()) {
	canWriteReply = !canWriteReply;
}
%>

<style>
* {
	text-align: center;
	margin: 0 auto;
}
</style>
</head>
<body>
	<form action="write_confirm.jsp" method="get">
		<table>
			<tr>
				<td><input type="text" size="50px" name="title" readonly
					value="<%=rs.getString("title")%>"></td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="100" " style="resize: none;"
						name="content" readonly><%=rs.getString("content")%></textarea></td>
			</tr>
		</table>
		<%
		if (rs.getString("writer").equals(session.getAttribute("writer").toString())) {
		%>
		<button type="button" onclick="location.href='delete.jsp'">삭제</button>
		<%
		}
		%>

		<table border=1>
			<tr>
				<td>이름</td>
				<td style="width: 200px">내용</td>
				<td>날짜</td>
			</tr>
			<%
			while (rs.next()) {
			%>

			<tr>
				<td><%=rs2.getString("writer")%></td>
				<td style="width: 400px"><%=rs2.getString("content")%></td>
				<td><%=rs2.getString("writer_date")%></td>
			</tr>
			<%
			}

			if (canWriteReply) {
			%>
			<tr>
				<td></td>
				<td style="width: 400px"><input type="text" name="content"
					style="width: 200px">
					<button type="button">작성</button></td>
				<td></td>
			</tr>
			<%
			}
			%>
		</table>

	</form>
</body>
</html>