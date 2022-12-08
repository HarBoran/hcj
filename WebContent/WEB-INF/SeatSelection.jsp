<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="ISO-8859-1">
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
	/* css가 적용되기전에 체크박스 숨기기 */
	input[class="seat_box"] {
		display: none;
	}
 	input[class="seat_reserved"] {
		display: none;
	}
	/* 체크박스가 선택되기전 디자인 */
	input[class="seat_box"] + label {
		display: inline-block;
		width: 30px;
		height: 30px;
		border: 2px solid #bcbcbc;
		background-color: #123456;
		cursor: pointer;
	}
	/* 체크박스가 선택 된 후의 디자인 */
	input[class="seat_box"]:checked + label {
		background-color: #8b00ff;
		/* background: url('./images/check-off.png') no-repeat 0 0px / contain; */
	}
	
	input[class="seat_reserved"]:checked + label {
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
	
	<h3>좌석 선택하기</h3>

	<form action = "hcj_servlet" method="GET" class="was-validated">		
		
		<c:forEach var = "temp_seat" items = "${select_seat}" varStatus="status">
		${temp_seat.reservation_check}
			<c:if test="${temp_seat.reservation_check eq 'NO'}">
				<input type = "checkbox" id = "seat_box_${status.count}" class = seat_box value = "seat_name">
				<label for="seat_box_${status.count}"></label>
			</c:if>
			<c:if test="${temp_seat.reservation_check eq 'YES'}">
				<input type = "checkbox" id = "seat_reserved_${status.count}" class = seat_reserved checked disabled>
				<label for="seat_reserved_${status.count}"></label>
			</c:if>
			<%-- ${status.count} ${temp_seat.seat_index} ${temp_seat.seat_name} --%>
			<c:if test="${status.count % 10 eq 0}">
					<br>
			</c:if>
		</c:forEach>

	</form>
	
	
	<%-- <c:forEach var = "temp_seat" items = "${select_seat}">
	<table>
		<tr>
			<th>${temp_seat.seat_index}</th>
			<th>${temp_seat.seat_name}</th>
			<th>${temp_seat.seat_unique_num}</th>
			<th>${temp_seat.reservation_check}</th>
			<th>${temp_seat.sch_num}</th>
		</tr>
	</table>
	</c:forEach> --%>	

</body>
</html>