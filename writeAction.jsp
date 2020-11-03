<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% 	request.setCharacterEncoding("UTF-8"); %>
<!-- javaclass와 연동,객체 생성할 때 쓰임 -->
<!-- 아래 메서드 매개변수에 들어감  -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> 

<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>


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
 	
 	if(userID == null){
 		PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
			script.println("<script>");
			script.println("alert('로그인하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
	 }else {
		if(bbs.getBbsTitle()==null || bbs.getBbsContent() == null){
		 	PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
				script.println("<script>");
				script.println("alert('입력이 덜 됨')");
				script.println("history.back()");
				script.println("</script>");
				
				}else {
		 			BbsDAO bbsDAO = new BbsDAO();
		 			int result = bbsDAO.write(bbs.getBbsTitle(),userID,bbs.getBbsContent()); //java class로 만든 메서드를 실행 입력(유즈빈으로 불러온) 넣어줘서 
		 		
		 			if(result==-1){
		 				PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
		 	 			script.println("<script>");
		 	 			script.println("alert('글쓰기 실패')");
		 	 			script.println("history.back()");
		 	 			script.println("</script>");		 
		 	 			} 
			 		else { //완료 
			 	 			PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
			 	 			script.println("<script>");
			 	 			script.println("location.href='bbs.jsp'");
			 	 			script.println("</script>");
			 	 	 	}
					}
			 }
		 		%>
 	
 	
</body>
</html>