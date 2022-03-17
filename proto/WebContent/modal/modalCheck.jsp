<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모달 확인창</title>
<style>

.modal .bg {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
}

.modalBox {
	position: absolute;
	top: 20%;
	background-color: #fff;
	width: 400px;
	height: 200px;
	padding: 15px;
	background-color: #9CC3D5;
	border-radius: 40px / 40px;
}
</style>
</head>
<body>
	<div class="bg"></div>
	<div class="modalBox">
		<table class="check">
			<form action="">
				<tr>
					<td colspan="2"><c:out value="${param.message }" /></td>
				</tr>
				<tr>
					<td><input type="button" class="closeBtn" value="취소" /></td>
					<td><input type="submit" value="탈퇴" /></td>
				</tr>
			</form>
		</table>
	</div>
<script>
	const open = () => {
	    document.querySelector(".modal").classList.remove("hidden");
	    
	  }

	  const close = () => {
	    document.querySelector(".modal").classList.add("hidden");
	  }

	  document.querySelector(".openBtn").addEventListener("click", open);
	  document.querySelector(".closeBtn").addEventListener("click", close);
	  document.querySelector(".bg").addEventListener("click", close);

</script>
</body>
</html>