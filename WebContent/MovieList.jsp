<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>

<!DOCTYPE html>
<html>
<head>
<title>MovieList</title>
	<meta charset="utf-8">
	<!-- 부트스트랩 -->
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 제이쿼리 -->	
	<script src="https://code.jquery.com/jquery-2.2.4.min.js" 
    integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" 
    crossorigin="anonymous"></script>    
    <script src = "js/script.js"></script>

</head>

<body>
	<%-- <c:forEach var = movielist itmes = "${movie_list}">
		<c:url var = "templsit" value="/hcj_servlet">
			<c:param name = "command" value = "LOAD"/>
			<c:param name = "id" value = "${tempStudent.id}"/>
		</c:url>
		<a href = "${tempLink}" class="btn btn-outline-warning">Update</a>
		 --%>
 		<a href="hcj_servlet?command=reservation&moviename=owl">
			<img src = "image/owl.jpg" width="200px"/>
		</a>
		<br>
		<a href="hcj_servlet?command=list" class="btn btn-info">Refresh</a>
<%-- 	<c:forEach/> --%>

</body>
</html>