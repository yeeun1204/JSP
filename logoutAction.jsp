<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 웹사이트 </title>
</head>
<body>
 	<%
 		session.invalidate();
 	 //세션 없애기 
 	%>
 	<script>
 		location.href='main.jsp';
 		alert="로그아웃!";
 	</script>
</body>
</html>