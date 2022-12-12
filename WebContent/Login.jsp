<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세션 로그인</title>
</head>
<body>
	<div class="text-center">
		<a href="hcj_servlet?command=list">
			<img src ="image/movie.png" width="80px"><h2>HCJ</h2>
		</a>
	</div>

<form action="Logingo.jsp" method="get">
   <table>
      <tr>
         <td>id</td>
         <td><input type="text" name="id"></td>
      </tr>
      <tr>
         <td>password</td>
         <td><input type="password" name="pwd"></td>
      </tr>
      <tr>
         <td colspan="2" style="text-align: center;">
         <input type="submit" value="로그인">
         <input type="reset" value="취소">
         </td>
      </tr>
   </table>
</form>
</body>