<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html> <!-- 모든 홈페이지 첫 화면  -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 웹사이트 </title>
</head>
<body>
<!-- id확인 -->
	<%
		String userID = null;
	 	if(session.getAttribute("userID") != null){
	 		userID = (String)session.getAttribute("userID");
	 	}
		
	%>

  <nav class="navbar navbar-default">
  <!--상단 바  -->
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
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>	
			<!-- 비회원 시 접속하기만 뜨도록 -->
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
			<!-- 회원일때 필요한 메뉴 보여주기 -->
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
	<!-- 메인  -->
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>0727JSP페이지 만들기 </h1>
				<p>안녕하세요? 지금은 20200727 동아대스타벅스
				 저는 지금 3시간 째 웹 사이트 만들고 있고,,잘 만들고 있는지 잘 모르겠고,,할 건 많네요</p>
				<p><a class="btn btn-primary btn-pull" href="https://www.youtube.com/" role ="button">그만하고 놀러가기</a></p>
			</div>
			
			<div class="container">
			<!--파일 업로드  -->
				<form action =" uploadAction.jsp" method="post" 
						enctype="multipart/form-data">
						<input type="file" name="file"><br>
						<input class="btn btn-primary btn-pull"type="submit" value="업로드">
				</form>
	
			</div>
		</div>
	
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
				<li data-target="#myCarousel" data-slide-to="2" ></li>		
			</ol>
			
			<!-- 사진 삽입  -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="image/hallow.jpg">
				</div>
				<div class="item">
					<img src="image/jack-o-lanterns.jpg">
				</div>
				<div class="item">
					<img src="image/halloween.jpg">
				</div>
			</div>
			
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	 
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>





