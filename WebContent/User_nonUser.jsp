<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.web.jdbc.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User_nonUser_Login</title>
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
<div>
   <div class="text-center">
      <a href="hcj_servlet?command=list">
         <img src ="image/movie.png" width="80px"><h2>HCJ</h2>
      </a>
   </div>

<form action="hcj_servlet" method="POST">
<input type = "hidden" name ="command" value= "Login"/>
<input type = "hidden" name = "page" value = "page"/>
<!--로그인 시 서블릿단으로 아이디와 패스워드를 파라미터 값으로 보냄  -->
   <table>
      <tr>
         <td>id</td>
         <td><input type="text" name="id"></td>
      </tr>
      <tr>
         <td>password</td>
         <td><input type="password" name="password"></td>
      </tr>
      <tr>
         <td colspan="2" style="text-align: center;">
         <input type="submit" value="로그인">
         <input type="reset" value="취소">
         </td>
      </tr>
   </table>
</form>
</div><br><br>
<div>
<form action = "hcj_servlet" method= "POST">
<input type="hidden" name="command" value="nonUser" />
   
       name : <input type = "text" name = "name" placeholder = "only English" ><br><br>
       
       birth : <input type = "text" name = "birth" placeholder = "ex)xxxx-xx-xx"><br><br>
       
       phone_num : <input type = "text" name = "phone_num" placeholder = "ex)xxx-xxxx-xxxx"><br><br>   



      <input type="submit" value="비회원로그인">

</form>

</div>




</body>