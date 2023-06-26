<%@page import="java.sql.*"%>
<%@page import="packages.JDBC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Nav.jsp" />

<style>
* {
	box-sizing: border-box;
	margin: 0 auto;
}

table {
	text-align: center;
}

input#title {
	
}
</style>
<%


if (session.getAttribute("user_id") == null) {
	request.setAttribute("islogouted", "true");
	request.getRequestDispatcher("login.jsp").forward(request, response);
	
}

session.setAttribute("connect_page", "index.jsp?isLogout=true");

String board_id = request.getParameter("board_id");
session.setAttribute("board_id", board_id);

ResultSet rs = null;

if (board_id != null) {
	session.setAttribute("connect_page", "write.jsp?board_id=" + board_id);

	JDBC jdbc = new JDBC();
	Connection conn = jdbc.getConn();

	PreparedStatement pstmt = null;

	String sql = "SELECT id, title, content, writer FROM board " + 
	    "WHERE id = ?";

	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, board_id);

	rs = pstmt.executeQuery();

	rs.next();
}
%>
</head>
<body>
	<form action="write_confirm.jsp">
		<table>
			<tr>
				<td>
					<%
                    if (board_id == null) {
                %> <input type="text" name="title" size="50px"
					placeholder="제목을 입력해 주세요."> <%
                    } else {
                %> <input type="text" name="title" size="50px"
					value="<%= rs.getString("title") %>"> <%
                    }
                %>

				</td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="100" placeholder="내용을 입력해 주세요."
						style="resize: none;" name="content">
                <%= (board_id == null) ? "" : rs.getString("content") %>
                </textarea></td>
			</tr>
		</table>
		<button type="submit"><%= (board_id == null) ? "등록" : "수정" %></button>
	</form>
</body>
</html>