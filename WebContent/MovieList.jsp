<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

</head>

<body style ="background-color:black">
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
	   <a href ="Join_Member.jsp" class="btn btn-primary">Join_member</a>   
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
   
 

<script>
	$(document).ready(function(){
		$(".popupModalVideo a").click(function() {
		    $(".video_modal_popup").addClass("reveal"),
		    $(".video_modal_popup .video-wrapper").remove(),
		    $(".video_modal_popup").append("<div class='video-wrapper'><iframe width='560' height='315' src='https://youtube.com/embed/" + $(this).data("video") + "?rel=0&playsinline=1&autoplay=1' allow='autoplay; encrypted-media' allowfullscreen></iframe></div>")
		}),
		$(".video_modal_popup-closer").click(function() {
		    $(".video_modal_popup .video-wrapper").remove(),
		    $(".video_modal_popup").removeClass("reveal")
		});
	});   
</script>    
   

	<div class ="container" style="background-color:white">
		<div class="row" style = "flex-wrap: nowrap; ">  		       
			<c:forEach var = "arrMovie" items = "${movie_list}">
			<div style = "flex-directiob : column;"> 
				&nbsp;&nbsp;&nbsp;
				<a href="hcj_servlet?command=movieTime&movieNum=${arrMovie.movie_num}" id ="movie_${arrMovie.movie_num}" >
				   <img src = "image/${arrMovie.poster}" width="200px"/>
				</a>
				&nbsp;
				<div class="popupModalVideo">
				    <a data-video="${arrMovie.trailer}" class = "btn btn-info">예고편</a>
				</div>	
				${arrMovie.trailer}<br>
			</div>		
			
			</c:forEach>
			
			<div class="video_modal_popup" style = "flex-directiob : column;">
			  <div class="video_modal_popup-closer"></div>
			</div>
		</div>
	</div>
</body>
</html>