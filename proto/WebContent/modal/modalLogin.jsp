<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>

</head>
<body>
	<div id="container">
		<h2>로그인</h2>
		<form action="">
			아이디: <input type="text" name="id" /><br>
			비밀번호: <input type="text" name="password" /><br>
			<input type="submit" value="로그인"/>
			<input type="button" value="취소" class="closeBtn"/>
		</form>
	</div>
	

</body>
</html>