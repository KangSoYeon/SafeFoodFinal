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

#nutriTb {
	width: 100%;
	text-align: center;
}

#nutriTb tr {
	border: 1px solid;
	border-color: #d3d3d3;
}

#foodTb td {
	border: 1px solid;
	border-color: #d3d3d3;
	text-align: center;
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
	var total = 0, cal = 0, tan = 0, dan = 0, gi = 0, dang = 0, na = 0, cal2 = 0, po = 0, trans = 0, material=0;
	var options;
	var alergy = ['대두', '땅콩', '우유', '게', '새우', '참치', '연어', '쑥', '소고기', '닭고기', '돼지고기', '복숭아', '민들레', '계란흰자'];
	var alergyString =0;
	$(function() {
		//mydiet에 추가, 추가버튼
		$('#addBt').click(function(){
			alert("${msg }")
			var frm = $('#frm');
			frm.attr("action","addmydiet.do");
			frm.submit();
			
		})
		
		//cart에 추가 , 찜버튼
		$('#like').click(function(){
			alert("${msg }")
			var frm = $('#frm');
			frm.attr("action","addcart.do");
			frm.submit();
		})
		
	
		$.ajax({
			url : 'foodNutritionInfo/' + ${food.code},
			dataType : 'json',
			success : nutritionResult,
			error : function(err) {
				console.log(err);
			}
		})
	})

	function nutritionResult(pdata, status, xhr) {
		var data = pdata.data
		total = data.supportpereat;
		cal = data.calory;
		tan = data.carbo;
		dan = data.protein;
		gi = data.fat;
		dang = data.sugar;
		na = data.natrium;
		cal2 = data.chole;
		po = data.fattyacid;
		trans = data.transfat;
		material = data.material;
		
		//alergy정보 넣기 
		alergyString="";
		for(var i=0; i<alergy.length; i++){
			console.log(material);
			if(material.includes(alergy[i])){
				alergyString += alergy[i]+" ";
			}
		}
		$('.alergy_list').html(alergyString);

		options = {
			animationEnabled : true,
			title : {
				text : "영양 정보"
			},
			data : [ {
				type : "doughnut",
				innerRadius : "40%",
				showInLegend : true,
				legendText : "{label}",
				indexLabel : "{label}: #percent%",

				dataPoints : [ 
					{	label : "칼로리",	y : cal	}, 
					{	label : "탄수화물",y : tan }, 
					{	label : "단백질",	y : dan	}, 
					{	label : "지방",	y : gi	}, 
					{	label : "당류",y : dang	}, 
					{	label : "나트륨",	y : na	}, 
					{   label : "콜레스테롤",	y : cal2}, 
					{	label : "포화 지방산",	y : po}, 
					{	label : "트랜스지방",	y : trans} 
					]
			} ]
		};

		$("#chartContainer").CanvasJSChart(options);
		$("#supportpereat").text(total);
		$("#calory").text(cal);
		$("#carbo").text(tan);
		$("#protein").text(dan);
		$("#fat").text(gi);
		$("#sugar").text(dang);
		$("#natrium").text(na);
		$("#chole").text(cal2);
		$("#fattyacid").text(po);
		$("#transfat").text(trans);
				
	}
	
</script>

</head>

<body id="page-top">
	<jsp:include page="nav.jsp" />
	<jsp:include page="title.jsp" />
	<section class="bg-white page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mx-auto">
					<c:if test="${not empty msg}">
						<script>alert("${msg }")</script>
					</c:if>
					<table id="nutriTb">
						<thead>
							<tr>
								<h1 style="text-align: center;">예상 섭취 정보</h1>
								<hr>
							</tr>
							<tr>
								<th scope="col">영양정보</th>
								<th scope="col">섭취 내역</th>
								<th scope="col">예상 섭취 내역</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>총 용량</th>
								<td>${n1[0]}</td>
								<td>${n1[0]}</td>
							</tr>
							<tr>
								<th>칼로리</th>
								<td>${n1[1]}</td>
								<td>${n1[1]}</td>
							</tr>
							<tr>
								<th>탄수화물</th>
								<td>${n1[2]}</td>
								<td>${n1[2]}</td>
							</tr>
							<tr>
								<th>단백질</th>
								<td>${n1[3]}</td>
								<td>${n1[3]}</td>
							</tr>
							<tr>
								<th>지방</th>
								<td>${n1[4]}</td>
								<td>${n1[4]}</td>
							</tr>
							<tr>
								<th>당류</th>
								<td>${n1[5]}</td>
								<td>${n1[5]}</td>
							</tr>
							<tr>
								<th>나트륨</th>
								<td>${n1[6]}</td>
								<td>${n1[6]}</td>
							</tr>
							<tr>
								<th>콜레스테롤</th>
								<td>${n1[7]}</td>
								<td>${n1[7]}</td>
							</tr>
							<tr>
								<th>포화 지방산</th>
								<td>${n1[8]}</td>
								<td>${n1[8]}</td>
							</tr>
							<tr>
								<th>트랜스지방</th>
								<td>${n1[9]}</td>
								<td>${n1[9]}</td>
							</tr>
						</tbody>
					</table>
					<table id="nutriTb">
						<thead>
							<tr>
								<h1 style="text-align: center;">섭취 내역</h1>
								<hr>
							</tr>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">상품명</th>
								<th scope="col">수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ n2}" var="cart" varStatus="cnt">
								<tr>
									<td>${cnt.count }</td>
									<td>${cart[0]}</td>
									<td>${cart[1]}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<table id="nutriTb">
						<thead>
							<tr>
								<h1 style="text-align: center;">예상 섭취 내역</h1>
								<hr>
							</tr>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">상품명</th>
								<th scope="col">수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${n3}" var="excart">
								<tr>
									<td>${excart.getFood().getCode() }</td>
									<td>${excart.getFood().getName()}</td>
									<td>${excart.getAmount()}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</section>

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