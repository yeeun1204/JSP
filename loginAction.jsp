<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% 	request.setCharacterEncoding("UTF-8"); %>
<!-- javaclass와 연동,객체 생성할 때 쓰임 -->
<jsp:useBean id="user" class="user.User" scope="page" /> 

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 웹사이트 </title>
</head>
<body>
 	<%
 	
 	String userID = null;
 	if(session.getAttribute("userID") != null){
 		userID= (String)session.getAttribute("userID");
 	}
 	
 	if(userID != null){
 		PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
			script.println("<script>");
			script.println("alert('이미 로그인 중')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
	 		}
 	
 		
 		UserDAO userDAO = new UserDAO();
 		int result = userDAO.login(user.getUserID(),user.getUserPassword()); //java class로 만든 메서드를 실행 입력(유즈빈으로 불러온) 넣어줘서 
 		
 		if(result==1){
 			session.setAttribute("userID", user.getUserID());
 			PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
 			script.println("<script>");
 			script.println("location.href='main.jsp'");
 			script.println("</script>");
 			
 			 
 	 		} 
 		else if(result==0){
 	 			PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
 	 			script.println("<script>");
 	 			script.println("alert('비번 틀림')");
 	 			script.println("history.back()");
 	 			script.println("</script>");
 	 	 		}
 		else if(result==-1){
 	 	 			PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
 	 	 			script.println("<script>");
 	 	 			script.println("alert('존재하지 않는 아이디')");
 	 	 			script.println("history.back()"); //왜 login.jsp로 안가나 
 	 	 			script.println("</script>");
 	 	 	 		} 
 		else if(result==-2){
	 			PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
	 			script.println("<script>");
	 			script.println("alert('DB 오류 ')");
	 			script.println("history.back()");
	 			script.println("</script>");
	 	 		} 
 	%>
</body>
</html>


