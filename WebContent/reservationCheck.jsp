<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>MovieList</title>
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


	<style>
	#ticket{
		position: absolute;
		width : 200px;
		border: 1px solid purple;
		background-color : #008000;
	}

	</style>
</head>

<body>
	<div class="text-center">
		<a href="hcj_servlet?command=list">
			<img src ="image/movie.png" width="80px"><h2>HCJ</h2>
		</a>
	</div>
	<%String tempid = (String)session.getAttribute("id");%>
	<h3>sessionID = <%=tempid %></h3>
	

	<c:url var = "tempLink" value="/hcj_servlet">						
		<c:param name = "command" value = "reservationticket"/>
		<c:param name = "id" value = "tempid"/>
	</c:url>
	<a href = "${tempLink}" class="btn btn-outline-info">reservationCheck</a>



	<c:forEach var= "tempTicket" items = "${reservationTicketTemp}" varStatus = "status">
	<div style = "position: relative;">
		<div id = "ticket" style = "left : ${(status.index % 5) * 150}px;  top : ${status.index* 50}px;">
			${status.index % 5}
			<b>${tempTicket.title}</b>
			<br>
			${tempTicket.date}
			${tempTicket.time}
			${tempTicket.running_time}
			<br>
			<b>theater</b> ${tempTicket.theater}
			<b>seat_name</b> ${tempTicket.seat_name}
			<br>
				<c:url var = "cancelLink" value="/hcj_servlet">
					<c:param name = "command" value = "cancel"/>
					<c:param name = "tempindex" value = "${tempTicket.index}"/>
				</c:url>
			<div style = "text-align: center;">
				<a href = "${cancelLink}" class="btn btn-dark">Cancel</a>
			</div>			
		</div>
	</div>
	</c:forEach> 
	
	
	
</body>
</html>
