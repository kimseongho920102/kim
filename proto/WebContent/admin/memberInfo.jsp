<%@page import="proto.TestVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<style>

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<input type="text" name="serch">
	<input type="submit" value="검색">
	<br>
	<table class="memeberT">
		<th>아이디</th>
		<th>이메일</th>
		<br>

		<c:forEach var="serchNumber" items="<%=currentList%>" varStatus="status">
			<tr>
				<td>${serchNumber.getName()}</td>
				<td>${serchNumber.getEmail()}<button>삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination">
		<li class="disabled"><c:if test="<%=!(startPage == 1)%>">
				<a href="memberInfo.jsp?page=<%=startPage - 1%>">
			</c:if> <span>«</span></a></li>
		<c:forEach var="i" begin="<%=startPage%>" end="<%=endPage%>">
			<c:if test="${i == 1}">
				<li class="active"><a href="memberInfo.jsp?page=1">1</a></li>
			</c:if>
			<c:if test="${i > 1}">
				<li><a href="memberInfo.jsp?page=${i}">${i}</a></li>
			</c:if>
		</c:forEach>
		<li><c:if test="<%=pageNumbers > endPage%>">
				<a href="testt.jsp?page=<%=endPage + 1%>">
			</c:if> <span>»</span></a></li>
	</ul>
</body>
</html>