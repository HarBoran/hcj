<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>

<!DOCTYPE html>
<html>
<head>
<title>MovieTime</title>
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

   <script></script>
   

<body>

	<div class="text-center">
		<a href="hcj_servlet?command=list">
			<img src ="image/movie.png" width="80px"><h2>HCJ</h2>
		</a>
	</div>
	
		<%String tempid = (String)session.getAttribute("id");%>
	
   <div style = "text-align: right;">      
   <c:if test="${id == null}">
	   <a href="Login.jsp" class="btn btn-primary">Login</a>   
	   <!-- <a href ="Join_Member.jsp" class="btn btn-primary">Join_member</a>  -->
	   <a href ="CheckId_1.jsp" class="btn btn-primary">Join_member</a>   
	</c:if>  
	<c:if test="${id != null}"> 
		<i>hello <u>${id}</u>! nice to meet you</i><br>
		<a href="Logout.jsp" class="btn btn-primary">Logout</a>
		<c:url var = "reservationTicket" value="/hcj_servlet">
				<c:param name = "command" value = "reservationticket"/>
		</c:url>
		<td><a href = "${reservationTicket}" class="btn btn-info">reservationCheck</a>
	</c:if>
   </div>

		 <table border = 1 >
	  <tr>
	              <th>sch_num</th>
	               <th>theater</th>
	               <th>date</th>
	               <th>time</th>
	               <th>reservation</th>
	   </tr>
	<c:forEach var = "List" items = "${scheduleList}">
	 <tr>
	 <c:url var ="seat_reservation" value="/hcj_servlet">
		 <c:param name ="command" value="seatSelection"/>
		 <c:param name = "sch_num" value = "${List.sch_num}"/>               
	 </c:url>
	<td>${List.sch_num}</td>
	 
	<td>${List.theater}</td>
	
	<td>${List.date}</td>
	
	<td>${List.time}</td>
	
	<td><a href ="${seat_reservation}">seat_reservation</a></td>
	</tr>
	</c:forEach>
	
	</table> 

</body>
</html>