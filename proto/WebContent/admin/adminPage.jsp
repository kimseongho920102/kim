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


//리뷰

List<TestVO> reviewList = (List<TestVO>) session.getAttribute("nameList");
int currentReviewPage = 1;
try {
	currentReviewPage = Integer.parseInt(request.getParameter("page"));
	if (currentReviewPage <= 0)
		currentReviewPage = 1;
} catch (Exception e) {
}

int reviewStartNumber = (currentReviewPage - 1) * 3;
int reviewEndNumber = currentReviewPage * 3 - 1;
if (reviewEndNumber > reviewList.size() - 1)
	reviewEndNumber = reviewList.size() - 1;
List<TestVO> currentReviewList = new ArrayList<TestVO>();
for (int i = reviewStartNumber; i <= reviewEndNumber; i++) {
	currentReviewList.add(reviewList.get(i));
}

int currentReviewPageNumbers = ((currentPage - 1) / 5) + 1;
int startReviewPage = (currentPageNumbers * 5) - 4;
int endReviewPage = currentPageNumbers * 5;
if (endReviewPage > pageNumbers)
	endReviewPage = pageNumbers;


%>
<style>
table {
	width: 800px;
	border-collapse: collapse;
}

.memeberT th, td {
	border-bottom: 1px solid #444444;
}

table button {
	float: right;
}

.container {
	width: 800px;
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

.tab_cont > div {
	display: none;
	text-align: center;
}

.tab_cont div.on {
	display: block;
}

.pagination {
	margin: 0 auto;
}
.pagination ul{
	display:inline-block;
	
}
.pagination ul li{
	float:left;
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
.rightUl{
  float: right;
  padding: 5px;
  height: 30px;
  width: 50px;
  position: relative;
}
.textleft> div{
	text-align: left;
}
.reviewCon{
	padding: 10px;
}
.reviewCon img{
	float: left;
}
.www{
	width: 350px;
	height: 20px;
}
.sss{
	width: 200px;
	height: 20px;
}
.ttt{
	width: 550px;
	height: 20px;
}
.tttt{
	width: 550px;
	word-wrap:break-word;
}
.reviewC{
	float: left;
	border:1px solid red; 
}


</style>

<body>
	<c:import url="/header.jsp"></c:import>

	<div class="container">
		<ul class="tab_title">
			<li class="on" >회원 조회</li>
			<li >리뷰 조회</li>
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
				<div class="reviewCon">
					<c:forEach var="serchNumber" items="<%=currentReviewList %>" varStatus="status">
					<div class="reviewC">
						<div>
							<img class="leftUl" src="https://via.placeholder.com/150x150" alt="280" >
						</div>
						<div class="textleft">
							<div class=" leftUl www">작성자 : ${serchNumber.getName()}</div>
							<div class=" leftUl sss">작성시간 :</div>
							<div class=" leftUl ttt">제목 : ${serchNumber.getEmail()}</div>
							<div class=" leftUl tttt">내용  11111111112333333333333333333333333333333333333333333333333333333333333333333333331112222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222</div>							
							<button class="rightUl">삭제</button>
						</div>													
					</div>		
				</c:forEach>	
				</div>
					<div class="pagination">
						<ul>
						<li class="disabled"><c:if test="<%=!(startReviewPage == 1)%>">
								<a href="adminPage.jsp?page=<%=startReviewPage - 1%>">
							</c:if> <span>«</span></a></li>
						<c:forEach var="i" begin="<%=startPage%>" end="<%=endReviewPage%>">
							<c:if test="${i == 1}">
								<li class="active"><a href="adminPage.jsp?page=1">1</a></li>
							</c:if>
							<c:if test="${i > 1}">
								<li><a href="adminPage.jsp?page=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<li><c:if test="<%=pageNumbers > endReviewPage%>">
								<a href="adminPage.jsp?page=<%=endReviewPage + 1%>">
							</c:if> <span>»</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/footer.jsp"></c:import>
	<script>
		 $(document).ready(function() {
			var tab = sessionStorage.getItem('tabSelect');
			$(".tab_title li").removeClass("on");
			$(".tab_title li").eq(tab).addClass("on");
			$(".tab_cont > div").hide();
			$(".tab_cont > div").eq(tab).show();
	    });

		
		$(document).ready(function() {						
			$(".tab_title li").click(function() {
				var idx = $(this).index();
				location.href="adminPage.jsp?page=1";

				$(".tab_title li").removeClass("on");
				$(".tab_title li").eq(idx).addClass("on");
				$(".tab_cont > div").hide();
				$(".tab_cont > div").eq(idx).show();
				sessionStorage.setItem('tabSelect', idx);
			})
		});
		
	</script>
</body>
</html>