<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>

<!DOCTYPE html>
<html>
<head>
<title>SeatSelection</title>
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
<form action = "hcj_servlet" method="GET" class="was-validated">
		
		<br>
		  
		<c:forEach var="i" begin="0" end="9"> 				
			<c:forEach var="j" begin="0" end="9">
				<c:out value="${i}*${j}" />
				<input type = "button" value = "${i}*${j}"/>
			</c:forEach><br>
		</c:forEach>
	</form> 
	
	<div class="container">
	  <div class="screen"></div>
	  .row*6>.seat*8
	</div>
	
	<a href="hcj_servlet?command=list" class="btn btn-info">back to the moive list</a>

</body>
</html>