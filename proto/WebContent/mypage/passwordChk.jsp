<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<style>
.check {
	width: 200px;
	height: 150px;
	text-align: center;
	margin: auto;
}

.password {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.right {
	text-align: right;
}

.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px red;
}
.hidden {
	display: none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/header.jsp"></c:import>
</head>

<body>
	<form action="./pwdchange.jsp" class="password">
		새 비밀번호번호<input type="text" placeholder="내용을 입력해 주세요" /> <br /> 비밀번호
		확인<input type="text" placeholder="내용을 입력해 주세요" /> <br /> <input
			type="submit" value="변경" />
		<button>
			<a href="mypage.jsp">취소</a>
		</button>
	</form>
	<hr />
	<form action="">
		<p class="right">
			회원탈퇴를 원하시면 회원 탈퇴 버튼을 눌러주세요. <input type="button"
				class="openBtn right" value="탈퇴하기">
		</p>
		<div class="modal hidden">
				<c:import url="${pageContext.request.contextPath}/modal/modalCheck.jsp">
					<c:param name="message" value="정말?"></c:param>
				</c:import>
		</div>
	</form>
	

</body>
<footer>
	<c:import url="/footer.jsp"></c:import>
</footer>
</html>