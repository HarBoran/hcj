<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="text-center">
		<a href="hcj_servlet?command=list">
			<img src ="image/movie.png" width="80px"><h2>HCJ</h2>
		</a>
	</div>

<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

String dbid = "suzing";
String dbpwd = "1234";

if(dbid.equals(id)){
   if(dbpwd.equals(pwd)){
      session.setAttribute("id", id);
      response.sendRedirect("main2.jsp");
   }
   else{
      //비밀번호 오류.
            response.sendRedirect("Login.jsp");
   }
}
else{
   //아이디 없음.
      response.sendRedirect("Login.jsp");
}
%>
</body>
</html>