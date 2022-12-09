<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="iso-8859-1">
<title>SeatSelection</title>
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
	/* css not applied checkbox not visible */
	input[class="seat_box"] {
		display: none;
	}
	/* css not applied checkbox not visible */
 	input[class="seat_reserved"] {
		display: none;
	}
	/* empty seat unchecked */
	input[class="seat_box"] + label {
		display: inline-block;
		width: 30px;
		height: 30px;
		border: 2px solid #bcbcbc;
		background-color: #123456;
		cursor: pointer;
	}
	/* empty seat checked */
	input[class="seat_box"]:checked + label {
		background-color: #8b00ff;		
		/* background-image:url('./images/check-off.png'); */
		/* background: url('./images/check-off.png') no-repeat 0 0px / contain; */
	}
	/* reserved seat */
	input[class="seat_reserved"] + label {
		display: inline-block;
		width: 30px;
		height: 30px;
		border: 2px solid #bcbcbc;
		background-color: #cdcdcd;
	}
	</style>

</head>

<body>
	<div class="text-center">
		<a href="hcj_servlet?command=list">
			<img src ="image/movie.png" width="80px"><h2>HCJ</h2>
		</a>
	</div>
	
	<h3>Seat Choice</h3>

	<form action = "hcj_servlet" method="GET" class="was-validated">
		<input type="hidden" name="command" value="reservation" />
		<input type="hidden" name="sch_num" value="${sch_num}"/>

		<c:forEach var = "temp_seat" items = "${select_seat}">
			
			<c:choose>
				<c:when test="${temp_seat.sch_num eq 0}">
					<input type = "checkbox" id = "seat_box_${temp_seat.seat_index}" class = "seat_box">
					<label for="seat_box_${temp_seat.seat_index}"></label>
				</c:when>
			
				<c:otherwise>
					<input type = "checkbox" id = "seat_reserved_${temp_seat.seat_index}" class = "seat_reserved" disabled>
					<label for="seat_reserved_${temp_seat.seat_index}"></label>
				</c:otherwise>
			</c:choose>
			${temp_seat.seat_index}
				<c:if test="${temp_seat.seat_index % 10 eq 0}">
					<br>
				</c:if>			
		</c:forEach>	

		<input type = "submit" name ="save"/>
	</form>	

</body>
</html>