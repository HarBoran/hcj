<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>reservationConfirm</title>
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
   <div class="text-center">
      <a href="hcj_servlet?command=list">
         <img src ="image/movie.png" width="80px"><h2>HCJ</h2>
      </a>
   </div>
   <%String tempid = (String)session.getAttribute("id");%>
   <div style = "text-align: right;">
      <c:if test="${id != null}">       
         <i>hello <u><%=tempid %></u>! nice to meet you</i><br>
      </c:if>
   </div>
   <h2>Reservation complete</h2>
      <table border = "2">
         <tr>
            <th>title</th>
            <th>date</th>
            <th>time</th>
            <th>running_time</th>
            <th>theater</th>
            <th>seat_name</th>
            
         </tr>

   		<tr>
         	<td>${reservationConfirm[0].title}</td>
            <td>${reservationConfirm[0].date}</td>
            <td>${reservationConfirm[0].time}</td>
            <td>${reservationConfirm[0].running_time}</td>
            <td>${reservationConfirm[0].theater}</td>
      		<td> <c:forEach var = "reservationConfirms" items = "${reservationConfirm}">
           		${reservationConfirms.seat_name}         
	      </c:forEach></td>
      	</tr>
	</table>
   

   
</body>
</html>