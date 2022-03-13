<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>

<style>
.rigthUl{
  float: right;
}
.leftUl{
  float: left;
}
.rect {
  width: 400px;
  height: 400px;
  border: 2px solid black;
  margin: 15px;
}
.srect{
  width: 300px;
  height: 100px;
  border: 2px solid black;
  margin: 20px auto;
  
}
.main{
	margin: 5px;
}

</style>
<body>
	<c:import url="header.jsp"></c:import>
	<div class="main">
    	<div class="rect leftUl"><a href="indexs.html">행사</a></div>
        <div class="rect rigthUl">
        	<div class="srect">검색탭</div>
            <div class="srect">이벤트</div>
            <div class="srect">코로나</div>
        </div>
    </div>
    <c:import url="footer.jsp"></c:import>
</body>
</html>