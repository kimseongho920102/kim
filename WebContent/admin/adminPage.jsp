<%@page import="proto.TestVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<%
	request.setCharacterEncoding("utf-8");

List<TestVO> nameList = (List<TestVO>) session.getAttribute("nameList");
int currentPage = 1;
try {
	currentPage = Integer.parseInt(request.getParameter("page"));
	if (currentPage <= 0)
		currentPage = 1;
} catch (Exception e) {
}
int startNumber = (currentPage - 1) * 4;
int endNumber = currentPage * 4 - 1;
if (endNumber > nameList.size() - 1)
	endNumber = nameList.size() - 1;

List<TestVO> currentList = new ArrayList<TestVO>();
for (int i = startNumber; i <= endNumber; i++) {
	currentList.add(nameList.get(i));
}

int pageNumbers = (Integer) session.getAttribute("pageNumbers");
int currentPageNumbers = ((currentPage - 1) / 5) + 1;

int startPage = (currentPageNumbers * 5) - 4;
int endPage = currentPageNumbers * 5;
if (endPage > pageNumbers)
	endPage = pageNumbers;
%>
<style>
table {
	width: 500px;
	border-collapse: collapse;
}

.memeberT th, td {
	border-bottom: 1px solid #444444;
}

table button {
	float: right;
}

.container {
	width: 500px;
	margin: 20px auto;
}

.tab_title li {
	list-style: none;
	float: left;
	width: 100px;
	padding: 10px 15px;
	cursor: pointer;
	text-align: center;
	border: 1px solid #bebebe;
}

.tab_title li.on {
	background-color: #ffb715;
	font-weight: bold;
}

.tab_cont {
	clear: both;
	height: 250px;
}

.tab_cont div {
	display: none;
	text-align: center;
}

.tab_cont div.on {
	display: block;
}

.pagination {
	margin: 0 auto;
}

ul li {
	list-style-type: none;
	display: inline;
	margin-left: 5px;
}

.leftUl{
  float: left;
  padding: 10px;
}
.textleft{
	text-align: left;
	
}
</style>

<body>
	<c:import url="/header.jsp"></c:import>

	<div class="container">
		<ul class="tab_title">
			<li class="on">회원 조회</li>
			<li>리뷰 조회</li>
		</ul>
		<div class="tab_cont">
			<div class="on">
				<input type="text" name="serch"> <input type="submit"
					value="검색"> <br>
				<table class="memeberT">
					<th>아이디</th>
					<th>이메일</th>
					<br>

					<c:forEach var="serchNumber" items="<%=currentList%>"
						varStatus="status">
						<tr>
							<td>${serchNumber.getName()}</td>
							<td>${serchNumber.getEmail()}<button>삭제</button></td>
						</tr>
					</c:forEach>
				</table>
				<ul class="pagination">
					<li class="disabled"><c:if test="<%=!(startPage == 1)%>">
							<a href="adminPage.jsp?page=<%=startPage - 1%>">
						</c:if> <span>«</span></a></li>
					<c:forEach var="i" begin="<%=startPage%>" end="<%=endPage%>">
						<c:if test="${i == 1}">
							<li class="active"><a href="adminPage.jsp?page=1">1</a></li>
						</c:if>
						<c:if test="${i > 1}">
							<li><a href="adminPage.jsp?page=${i}">${i}</a></li>
						</c:if>
					</c:forEach>
					<li><c:if test="<%=pageNumbers > endPage%>">
							<a href="adminPage.jsp?page=<%=endPage + 1%>">
						</c:if> <span>»</span></a></li>
				</ul>
			</div>

			<div>
				<input type="text" name="serch"> <input type="submit"	value="검색"> <br>
				<img class="leftUl" src="https://via.placeholder.com/150x150" alt="280" >
				<p class="textleft">작성자 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 작성시간 :</p>
				<p class="textleft">제목 :</p>
				<p class="textleft">내용 :11111111111111111111111111111111111</p>
			</div>
		</div>
	</div>

	<c:import url="/footer.jsp"></c:import>
	<script>
		$(document).ready(function() {
			$(".tab_title li").click(function() {
				var idx = $(this).index();
				$(".tab_title li").removeClass("on");
				$(".tab_title li").eq(idx).addClass("on");
				$(".tab_cont > div").hide();
				$(".tab_cont > div").eq(idx).show();
			})
		});
	</script>
</body>
</html>