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

<body>
	<div class="text-center">
		<a href="hcj_servlet?command=list">
			<img src ="image/movie.png" width="80px"><h2>HCJ</h2>
		</a>
	</div>

	<div class ="container">
	<div class="row">

       <a href="hcj_servlet?command=movieTime&moviename=Iron_Man">
          <img src = "image/Iron_Man.jpg" width="200px"/>
       </a>
      &nbsp;&nbsp;&nbsp;
       <a href="hcj_servlet?command=movieTime&moviename=Spider_Man">
          <img src = "image/Spider_Man.jpg" width="200px"/>
       </a>
      &nbsp;&nbsp;&nbsp;
       <a href="hcj_servlet?command=movieTime&moviename=Captain_America">
          <img src = "image/Captain_America.jpg" width="200px"/>
       </a>
       &nbsp;&nbsp;&nbsp;
       <a href="hcj_servlet?command=movieTime&moviename=Thor">
          <img src = "image/Thor.jpg" width="200px"/>
       </a>
       </div> 
      <br>
      <!-- <a href="hcj_servlet?command=list" class="btn btn-info">Refresh</a> -->

</div>
</body>
</html>