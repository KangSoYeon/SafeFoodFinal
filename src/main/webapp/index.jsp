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
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script type="text/javascript">
	var bar;
	var opt;
	var mem = 0;
	var total = 0, cal = 0, tan = 0, dan = 0, gi = 0, dang = 0, na = 0, cal2 = 0, po = 0, trans = 0;
	var options;
	mem_form = $('#mem_form_ul');
</script>
</head>

<body id="page-top">
	<jsp:include page="nav.jsp" />
	<jsp:include page="title.jsp" />
	
	<!-- Portfolio Grid -->
	<section class="bg-white page-section" id="portfolio">
		<div class="container">
			<div class="row_info">
				<c:forEach var='f' items="${list}">
					<div class="col-md-4 col-sm-6 portfolio-item">
						<a class="portfolio-link" href="detailform.do?code=${f.code }">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src='${f.img}' alt="" />
						</a>
						<div class="portfolio-caption">
							<h4>${f.name}</h4>
							<p class="text-muted">"${f.maker}"</p>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</section>
	<%-- 	<!-- Portfolio Grid -->
	<section class="bg-light page-section" id="portfolio">
		<div class="container">
			<div class="row_info">
				<c:forEach var='f' items="${list}"> 
					<div class="col-md-4 col-sm-6 portfolio-item">
						<a class="portfolio-link" data-toggle="modal" href="#portfolioModal1" 
						onclick="javascript:transferFcode('${f.code}','${f.name}','${f.maker}','${f.material}','${f.img}')">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div>
							<img class="img-fluid" src='${f.img}' alt=""/>
						</a>
						<div class="portfolio-caption">
							<h4>${f.name}</h4>
							<p class="text-muted">"${f.maker}"</p>
						</div>
					</div>
									
				</c:forEach>
			</div>
		</div>
	</section> --%>


	<!-- Footer -->
	<jsp:include page="copyright.jsp"></jsp:include>


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

