<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Join_Member</title>
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
    
     <script>
	    $(document).ready(function(){
			$("#checkid").click(function(){		
		
				var ii = $("#id_input").val();
				if(ii == null || ii == ""){
					alert("is empty");
					$("#id_input").focus();
				}else{
					alert("Failed to enter ID");
				}
				
				$('#dupid').click(function(){
			        $.ajax('idCheckForm2.jsp',{
			            data:{id:$('.id').val()},
			            success:function(returndata){
			                $('#divid').html(returndata);
			                }
			        
			            });
			    });
			});
		});
	</script>	

	
</head>
<body>  
	<div class="text-center">
		<a href="hcj_servlet?command=list">
			<img src ="image/movie.png" width="80px"><h2>HCJ</h2>
		</a>
	</div> 

      
      
   		<%--    <c:set var = "id" value = <%request.getAttribute("id"); %>/> --%>
		<form action = "hcj_servlet" method = "POST">
		<input type="hidden" name="command" value="JOIN" />
		<%-- <input type ="hidden" name="id" value =  "<%request.getAttribute("id_");%>"/> --%>
		<input type ="hidden" name="id_check" value = "${id_}"/>

		<%--  id : ${id_} <br><br> --%>
     
       
		id : <input type = "text" name = "id" id = "id_input" placeholder = "only English" >
	
		<input type = "button" id = "checkid" class="btn btn-outline-dark" value= "checkId"><br><br>
	
		password : <input type = "password" name = "password" placeholder = "only Number"><br><br>
       
		name : <input type = "text" name = "name" placeholder = "only English" ><br><br>
       
		birth : <input type = "text" name = "birth" placeholder = "ex)xxxx-xx-xx"><br><br>
       
		phone_num : <input type = "text" name = "phone_num" placeholder = "ex)xxx-xxxx-xxxx"><br><br>   

		<input type ="submit" value = "join">
 
		</form>

	</body>
</html>