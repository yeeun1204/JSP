<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>

<!DOCTYPE html>
<html> <!-- 모든 홈페이지 첫 화면  -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 웹사이트 </title>
</head>
<body>
	<%
		String userID = null;
	
	 //아예 로그인 안했을때 
	 	if(session.getAttribute("userID") != null){
	 		userID = (String)session.getAttribute("userID");
	 	} 	
	 	if(userID == null){
	 		PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
	 	}
	 	
 	//주소에서 날라온 고유번호를 넣어줘서 수정처리할 수 있게
 		int bbsID =0; 
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
					BbsDAO bbsDAO = new BbsDAO();
	 			 	int result = bbsDAO.delete(bbsID);  
	 			 		
	 			 	if(result==-1){
	 			 	PrintWriter script = response.getWriter(); 
	 			 	script.println("<script>");
	 			    script.println("alert('삭제 실패')");
	 			 	script.println("location.href='view.jsp'");
	 			 	 script.println("</script>");		 
	 			 	} 
	 				else { //완료 
	 				PrintWriter script = response.getWriter(); 
	 				script.println("<script>");
	 				script.println("location.href='bbs.jsp'");
	 				 script.println("</script>");
	 			}
	 	}

	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	