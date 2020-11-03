<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% 	request.setCharacterEncoding("UTF-8"); %>


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
 	}
 	int bbsID =0; //주소에서 날라온 고유번호를 넣어줘서 수정처리할 수 있게
		if(request.getParameter("bbsID")!= null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		if(bbsID ==0){
			PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('유효하지 않는 글 ')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		}
 	
 	Bbs bbs = new BbsDAO().getBbs(bbsID);
 	if(!userID.equals(bbs.getUserID())){ //작성자가 다를 때 
 		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('권한이 없읍니다')");
		script.println("location.href='view.jsp'");
		script.println("</script>");
 	}
 	else {
		if(request.getParameter("bbsTitle")==null || request.getParameter("bbsContent") == null
		||request.getParameter("bbsTitle").equals(" ")||request.getParameter("bbsTitle").equals(" "))
		//위에 빈칸 과 null 차이점 이해 안됨
		{
		 	PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 덜 됨')");
				script.println("history.back()");
				script.println("</script>");
				
				}else {
		 			BbsDAO bbsDAO = new BbsDAO();
		 			int result = bbsDAO.update(bbsID,request.getParameter("bbsTitle"),request.getParameter("bbsContent"));  
		 		
		 			if(result==-1){
		 				PrintWriter script = response.getWriter(); 
		 				script.println("<script>");
		 	 			script.println("alert('수정 실패')");
		 	 			script.println("history.back()");
		 	 			script.println("</script>");		 
		 	 			} 
			 		else { //완료 
			 	 			PrintWriter script = response.getWriter(); 
			 	 			script.println("<script>");
			 	 			script.println("location.href='bbs.jsp'");
			 	 			script.println("</script>");
			 	 	 	}
					}
			 }
		 		%>
 	
 	
</body>
</html>