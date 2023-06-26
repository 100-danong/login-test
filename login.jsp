<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Nav.jsp" />
<%
    if (request.getAttribute("islogouted") != null) {
        out.println("<script>alert('로그인이 필요합니다.');</script>");
    }
%>
</head>
<body>
    <%
        if (request.getAttribute("login") != null &&
        request.getAttribute("login").toString().equals("failed")) {
    %>
    로그인에 실패했습니다.<br>
    <%
        }
    %>
    <form action="login_confirm.jsp">
        ID <input type="text" name="ID" required
            pattern="^([a-zA-Z0-9_]{4,12})$" title="영어 대소문자, 숫자, _ 입력가능"><br>
            
        PW <input type="password" name="PW" required>
        <input type="submit">
    </form>
</body>
</html>
</html>