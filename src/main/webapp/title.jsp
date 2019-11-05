<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function(){
		<c:if test="${not empty droplist}">
		$('#droplist').val("${droplist}");
		</c:if>
		$('#searchbar').val("${searchbar}")

	})
</script>

</head>
<body>

	<header class="masthead">
		<div class="container">
			<div>
				<div class="intro-text">
					<div class="intro-heading text-uppercase">WHAT WE PROVIDE</div>
					<div class="intro-lead-in">건강한 삶을 위한 먹거리 프로젝트</div>

					<!-- ======================================== 검색 창 추가 =========================================================== -->
					<form action="search.do" method="post">
					<div class="search-header" >
						<!-- ======================================== 검색 dropdown 추가 =========================================================== -->
						<select class="dropbtn form-control mr-sm-2" id="droplist" name="droplist" >
							<option value="0">Select</option>
							<option value="1">상품명</option>
							<option value="2">제조사</option>
							<option value="3">영양정보</option>
						</select>

						<!-- ======================================== 검색 dropdown 추가 =========================================================== -->
						<input class="form-control mr-sm-2" type="text"
							placeholder="Search" id="searchbar" name="searchbar">
						 <button type="submit" class="btn btn-secondary my-2 my-sm-0" id="searchbtn">Search</button>
					</div>
					</form>
					<!-- ======================================== 검색 창 추가 =========================================================== -->
				</div>
			</div>
		</div>
	</header>

</body>
</html>