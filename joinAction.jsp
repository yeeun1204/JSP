<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% 	request.setCharacterEncoding("UTF-8"); %>
<!-- javaclass와 연동,객체 생성할 때 쓰임 -->
<!-- 아래 메서드 매개변수에 들어감  -->
<jsp:useBean id="user" class="user.User" scope="page" /> 

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>

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

 	
 	if(user.getUserID()==null || user.getUserPassword()==null||user.getUserGender()==null||user.getUserEmail()==null)
 	{	PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
		script.println("<script>");
		script.println("alert('입력이 덜 됨')");
		script.println("history.back()");
		script.println("</script>");
		} else {
 			UserDAO userDAO = new UserDAO();
 			int result = userDAO.join(user); //java class로 만든 메서드를 실행 입력(유즈빈으로 불러온) 넣어줘서 
 		
 			if(result==-1){ //중복아이디
 				PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
 	 			script.println("<script>");
 	 			script.println("alert('이미 존재하는 아이디입니다')");
 	 			script.println("history.back()");
 	 			script.println("</script>");		 
 	 			} 
	 		else { //완료 
	 	 			PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
	 	 			session.setAttribute("userID", user.getUserID());
	 	 			script.println("<script>");
	 	 			script.println("location.href='main.jsp'");
	 	 			script.println("</script>");
	 	 	 	}
			}
 		%>
</body>
</html>