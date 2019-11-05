<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SAFE FOOD</title>
<style type="text/css">
.errormsg {
	font-size: 14px;
	color: red;
}
</style>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/member.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="css/agency.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<jsp:include page="nav.jsp" />
	<jsp:include page="title.jsp" />

	<!-- 구현  -->
	<section>
		<div class="container">
			<c:set var='f' target="${fcode}" />
			<div>
				<div id="chartContainer"></div>
				<div>
					<table id="nutt" border="1">
						<tr>
							<td>일일제공량</td>
							<td>칼로리</td>
							<td>탄수화물</td>
							<td>단백질</td>
							<td>지방</td>
							<td>당류</td>
							<td>나트륨</td>
							<td>콜레스테롤</td>
							<td>포화 지방산</td>
							<td>트렌스지방</td>
						</tr>
						<tr>
							<td id="supportpereat">${f.supportpereat}</td>
							<td id="calory">${f.calory}</td>
							<td id="carbo">${f.carbo}</td>
							<td id="protein">${f.protein}</td>
							<td id="fat">${f.fat}</td>
							<td id="sugar">${f.sugar}</td>
							<td id="natrium">${f.natrium}</td>
							<td id="chole">${f.chole}</td>
							<td id="fattyacid">${f.fattyacid}</td>
							<td id="transfat">${f.transfat}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>


	<!-- Footer -->
	<jsp:include page="copyright.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>


	<!-- Custom scripts for this template -->
	<script src="js/agency.min.js"></script>

	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
</body>
</html>