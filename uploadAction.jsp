<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!-- 중복된이름 처리 -->
<%@ page import="com.oreilly.servlet.MultipartRequest"%><!-- 파일업로드 수행 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<% 	String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding ="UTF-8";
		
		MultipartRequest multipartRequest =
			new MultipartRequest(request, directory, maxSize, encoding,
								 new DefaultFileRenamePolicy());
		//(1,2,3,4,5) 中 1 = 사용자가 보낸 파일 정보 2=폴더안에 3=사이즈만큼 4=인코딩적용해서5=중복이름처리)
	
		//파일의  사용자가 적용한 네임과  시스템네임을 구분해서 넣어줌 
		String fileName= multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");

		new FileDAO().upload(fileName,fileRealName);
	
		
		out.write("파일명 :" + fileName + "<br>");
		out.write("실제 파일명 :" + fileRealName + "<br>");
		%>

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
</body>
</html>