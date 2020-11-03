<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>

<!DOCTYPE html>
<html> <!-- 모든 홈페이지 첫 화면  -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 웹사이트 </title>
</head>
<body>
	<%
		String userID = null;
	 	if(session.getAttribute("userID") != null){
	 		userID = (String)session.getAttribute("userID");
	 	}
	 	
	 	int bbsID = 0;
	 	if(request.getParameter("bbsID") != null){
	 		
	 		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	 	}
	 	if(bbsID == 0){
	 		PrintWriter script = response.getWriter(); //script 사용가능하게 하려고 
			script.println("<script>");
			script.println("alert('해당 글이 없읍니다')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
	 	}
		
	 	Bbs bbs= new BbsDAO().getBbs(bbsID);
	%>

  <nav class="navbar navbar-default">
	<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>

			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>	
			<%if (userID ==null) { %>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">login</a></li>
						<li ><a href="join.jsp">join</a></li>
					</ul>								
				</li>
			</ul>
			<%} else { %>
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">logout</a></li>
						
					</ul>								
				</li>
			</ul>
			<%} %>
		</div>
	</nav>	
	<div class="container">
		<div class="row"><!-- table-striped = 홀짝 색깔 다르게 보여주는 -->	 
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align:center;">게시판글보기</th>
					
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글제목 </td>	
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt").replaceAll(">","&gt")
								.replaceAll("\n","<br>") %> </td>							
					</tr>
					<tr>
						<td >작성자 </td>	
						<td colspan="2"><%= bbs.getUserID() %> </td>							
					</tr>
					<tr>
						<td >작성일자 </td>	
						<td colspan="2"><%= bbs.getBbsDate()
								.substring(0,11)+bbs.getBbsDate().substring(11,13)+ "시" 
								+ bbs.getBbsDate().substring(14,16)+ "분"%></td> <!-- 날짜모양 변경 -->
					</tr>
					<tr>
						<td >내용 </td>	<!-- min-height 안먹음 -->
						<td colspan="2" style="min-height: 500px; text-align: center;">
							<%= bbs.getBbsContent()
							.replaceAll(" ","&nbsp;").replaceAll("<","&lt").replaceAll(">","&gt")
							.replaceAll("\n","<br>")%>
						</td> 
					</tr>					
				</tbody>
			</table>
			
			
			<a href="bbs.jsp" class="btn btn-primary ">목록</a>			
			<!-- 본인 글 수정 삭제할 수 있게 페이지 전환 -->
			<%if(userID.equals(bbs.getUserID())){%>
				<a href="update.jsp?bbsID=<%=bbs.getBbsID()%>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('삭제 진짜 할거냐?')" 
				href="deleteAction.jsp?bbsID=<%=bbs.getBbsID()%>" class="btn btn-primary">삭제</a>
			
			<%}%>
		

		</div>
	</div>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>


