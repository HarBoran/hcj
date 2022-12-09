<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>MovieTicket</title>
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

	<script></script>
	

<body>
	<div class="text-center">
			<a href="hcj_servlet?command=list">
				<img src ="image/movie.png" width="80px"><h2>HCJ</h2>
			</a>
		</div>
	
	
	<table border = 1 >
	  <tr>
	               <th>theater</th>
	               <th>date</th>
	               <th>time</th>
	               <th>reservation</th>
	   </tr>
	<c:forEach var = "List" items = "${scheduleList}">
	 <tr>
	 <c:url var ="seat_reservation" value="/hcj_servlet">
	 <c:param name ="command" value="seatSelection"/>
	 <c:param name="theater" value= "${List.theater}"></c:param>
	 <c:param name ="date" value = "${List.date}"></c:param>
	 <c:param name="time" value = "${List.time}"></c:param>               
	 </c:url>
	<td>${List.theater}</td>
	
	<td>${List.date}</td>
	
	<td>${List.time}</td>
	
	<td><a href ="${seat_reservation}">seat_reservation</a></td>
	</tr>
	</c:forEach>
	
	</table>
	
	<br><br>
	
	<!-- <input type="date" id="date" max="2022-12-26" min="2022-12-07" value="2022-12-07"> -->
	<!-- <a href="hcj_servlet?command=seatSelection" class="btn btn-primary">select time</a> -->

</body>
</html>