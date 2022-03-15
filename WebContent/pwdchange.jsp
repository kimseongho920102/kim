<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<style>
.why{
	
	width : 200px;
	height : 100px;
    margin-left:auto; 
    margin-right:auto;
    margin-top: auto;
    margin-bottom: auto;
    text-align: center;
}
.password{
	text-align: center;
    margin-left:auto; 
    margin-right:auto;
}
.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}
.modal.show {
	display: block;
}
.modal_body {
	position: absolute;
	top: 50%;
	left: 80%;
	width: 300px;
	height: 100px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
.out{
	text-align: right;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="header.jsp"></c:import>
</head>
	
<body>
<form action="./pwdchange.jsp" class="password">
새 비밀번호번호<input type="text" placeholder="내용을 입력해 주세요" /> <br />
비밀번호 확인<input type="text" placeholder="내용을 입력해 주세요" /> <br />
<input type="submit" value="변경" />
<button><a href="mypage.jsp">취소</a></button>
</form>
<hr />
<form action="" >
<p class="out">회원탈퇴를 원하시면 회원 탈퇴 버튼을 눌러주세요. 
<input type="button" class="btn-open-popup" value="탈퇴하기" ></p>
	<div class="modal">
		<div class="modal_body">
			<table class="why">
			<form action="" >
				<tr>
					<td colspan="2">정말 탈퇴 하시겠습니까?</td>
				</tr>
				<tr>
				<td><input type="button" class="btn-close-popup" value="취소" /></td>	
				<td><input type="submit" value="탈퇴" /></td>
				</tr>
			</form>
			</table>
			
		</div>

	</div>
	
</form>
	<script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');
      const btnClosePopup = document.querySelector('.btn-close-popup');
      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');
        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });
      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');
          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
      btnClosePopup.addEventListener('click', (event) => {
          if (event.target === modal) {
              modal.classList.toggle('show');
              if (!modal.classList.contains('show')) {
                body.style.overflow = 'auto';
              }
            }
          });
    </script>


</body>
<footer><c:import url="footer.jsp"></c:import></footer>
</html>