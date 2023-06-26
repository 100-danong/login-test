<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
session.setAttribute("user_id", null);
String load_page = session.getAttribute("connect_page").toString();

request.getRequestDispatcher(load_page).forward(request, response);
%>