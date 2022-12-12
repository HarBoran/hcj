<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 메인</title>
</head>
<body>
	<div class="text-center">
		<a href="hcj_servlet?command=list">
			<img src ="image/movie.png" width="80px"><h2>HCJ</h2>
		</a>
	</div>
<h2>세션 메인 페이지</h2>
<%
   String id = (String)session.getAttribute("id");
   if(id == null){
      response.sendRedirect("Login.jsp");
   }
%>
<%=id %> 님 환영합니다.
<a href="Logout.jsp">로그아웃</a>
</body>
</html>