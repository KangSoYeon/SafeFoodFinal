<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>SAFE FOOD</title>

<title>Insert title here</title>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#">Balance</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase">
					<!--  ml-auto -->
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">공지 사항</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">상품 정보</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">베스트 섭취 정보</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="myeat.do" id='myfunction1'>내 섭취 정보</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#" id='myfunction2'>예상 섭취 정보</a></li>
				</ul>
				<ul class="navbar-nav text-uppercase ml-auto">
					<c:choose>
						<c:when test="${ empty id }">
							<c:if test="${not empty cookie.id}">
								<c:set var="idSave" value="value='${cookie.id.value}'" />
								<c:set var="checked" value="checked='checked'" />
							</c:if>
							<li class="nav-item member" id="login_li"><a
								class="nav-link js-scroll-trigger" href="#" id="login">log-in</a>
								<ul id="login_form_ul">
									<li id="login_form_li">
										<h2>로그인</h2>
										<form method="post" action="login.do">
											<table>
												<c:if test="${ not empty msg }">
													<tr>
														<td colspan='2' class="errorMsg">${msg}</td>
													</tr>
												</c:if>
												<c:if test="${not empty referer}">
													<input type="hidden" name="referer" value='${referer}' />
												</c:if>
												<tr>
													<td class="login-form"><input type="text" id="id"
														name="id" placeholder="ID" ${idSave}></td>
												</tr>
												<tr>
													<td class="login-form"><input type="password"
														name="pw" id="password" placeholder="비밀번호"></td>
												</tr>
												<tr>
													<td colspan="2"><input type="checkbox" name='idsave'
														value='t' ${checked}> 아이디 저장</td>
												</tr>
												<tr>
													<td><a href="findpasswordForm.do" id="forget">비밀번호
															찾기</a></td>
												</tr>
												<tr>
													<td><input type="submit" value="login"></td>
												</tr>
											</table>
										</form>
									</li>
								</ul></li>
							<li class="nav-item member"><a
								class="nav-link js-scroll-trigger" href="#" id="signup">sign-up</a>
								<ul id="regi_form_ul">
									<li id="regi_form_li">
										<h2>회원가입</h2>
										<form method="post" action="sign.do">
											<div class="register-form">
												<table id='rtable'>
													<tr>
														<td>아이디</td>
														<td><input type="text" name="id" id="regi_id"></td>
													</tr>
													<tr>
														<td>비밀번호</td>
														<td><input type="password" name="pw"
															id="regi_password"></td>
													</tr>
													<tr>
														<td>이름</td>
														<td><input type="text" name="name" id="regi_name"></td>
													</tr>
													<tr>
														<td>이메일</td>
														<td><input type="text" name="email" id="regi_email"></td>
													</tr>
													<tr>
														<td>주소</td>
														<td><input type="text" name="address"
															id="regi_address"></td>
													</tr>
													<tr>
														<td>전화번호</td>
														<td><input type="text" name="phone" id="regi_phone"></td>
													</tr>

													<tr>
														<td>알레르기</td>
														<td>
															<fieldset>
																<legend>Check</legend>
																<div>
																	대두 <input type="checkbox" type="radio" id="allergy"
																		name="du" value="1" /> 땅콩 <input type="checkbox"
																		type="radio" id="allergy" name="cong" value="1" /> 우유
																	<input type="checkbox" type="radio" id="allergy"
																		name="milk" value="1" /> 게 <input type="checkbox"
																		type="radio" id="allergy" name="crab" value="1" />
																</div>
																<div>
																	새우 <input type="checkbox" type="radio" id="allergy"
																		name="shi" value="1" /> 참치 <input type="checkbox"
																		type="radio" id="allergy" name="tu" value="1" /> 연어 <input
																		type="checkbox" type="radio" id="allergy" name="sal"
																		value="1" /> 쑥 <input type="checkbox" type="radio"
																		id="allergy" name="suk" value="1" />
																</div>
																<div>
																	소고기 <input type="checkbox" type="radio" id="allergy"
																		name="cow" value="1" /> 닭고기 <input type="checkbox"
																		type="radio" id="allergy" name="chi" value="1" /> 돼지고기
																	<input type="checkbox" type="radio" id="allergy"
																		name="pig" value="1" />
																</div>
																<div>
																	복숭아 <input type="checkbox" type="radio" id="allergy"
																		name="peach" value="1" /> 민들레 <input type="checkbox"
																		type="radio" id="allergy" name="mid" value="1" /> 계란흰자
																	<input type="checkbox" type="radio" id="allergy"
																		name="egg" value="1" />
																</div>
															</fieldset>
														</td>
													</tr>
												</table>
											</div>
											<div style="text-align: center">
												<input type="submit" id="register_sub" value="회원가입">
											</div>
										</form>
									</li>
								</ul></li>
						</c:when>
						<c:otherwise>

							<li class="nav-item member" id="login_li"><a
								class="nav-link js-scroll-trigger" href="logout.do" id="logout">log-out</a>
							</li>
							<li class="nav-item member" id="meminfo_li"><a
								class="nav-link js-scroll-trigger" href="#" id="meminfo">mem-info</a>
								<ul id="mem_form_ul">
									<li id="mem_form_li">
										<h2>회원 정보</h2>
										<form method="post" name='frm'>
											<div class="register-form">
												<table id='mem_rtable'>
													<tr>
														<td>아이디</td>
														<td><input type="text" readonly="readonly"
															name="mem_id" id="mem_id" value='${member.id}'></td>
													</tr>
													<tr>
														<td>비밀번호</td>
														<td><input type="password" name="mem_pw"
															id="mem_password" value="${member.password}"></td>
													</tr>
													<tr>
														<td>이름</td>
														<td><input type="text" readonly="readonly"
															name="mem_name" id="mem_name" value="${member.name}"></td>
													</tr>
													<tr>
														<td>이메일</td>
														<td><input type="text" name="mem_email"
															id="mem_email" value="${member.email }"></td>
													</tr>
													<tr>
														<td>주소</td>
														<td><input type="text" name="mem_address"
															id="mem_address" value="${member.address }"></td>
													</tr>
													<tr>
														<td>전화번호</td>
														<td><input type="text" name="mem_phone"
															id="mem_phone" value="${member.phone }"></td>
													</tr>

													<tr>
														<td>알레르기</td>
														<td>
															<fieldset>
																<legend>Check</legend>
																<c:if test="${member.du eq 1}">
																	<c:set var='du' value='checked="checked"' />
																</c:if>
																<div>
																	대두 <input type="checkbox" type="radio" id="allergy"
																		name="mem_du" value="1" ${du} />
																	<c:if test="${member.cong eq 1}">
																		<c:set var='cong' value='checked="checked"'></c:set>
																	</c:if>
																	땅콩 <input type="checkbox" type="radio" id="allergy"
																		name="mem_cong" value="1" ${cong} />
																	<c:if test="${member.milk eq 1}">
																		<c:set var='milk' value='checked="checked"'></c:set>
																	</c:if>
																	우유 <input type="checkbox" type="radio" id="allergy"
																		name="mem_milk" value="1" ${milk} />
																	<c:if test="${member.crab eq 1}">
																		<c:set var='crab' value='checked="checked"'></c:set>
																	</c:if>
																	게 <input type="checkbox" type="radio" id="allergy"
																		name="mem_crab" value="1" ${crab} />
																</div>
																<div>
																	<c:if test="${member.shi eq 1}">
																		<c:set var='shi' value='checked="checked"'></c:set>
																	</c:if>
																	새우 <input type="checkbox" type="radio" id="allergy"
																		name="mem_shi" value="1" ${shi} />
																	<c:if test="${member.tu eq 1}">
																		<c:set var='tu' value='checked="checked"'></c:set>
																	</c:if>
																	참치 <input type="checkbox" type="radio" id="allergy"
																		name="mem_tu" value="1" ${tu} />
																	<c:if test="${member.sal eq 1}">
																		<c:set var='sal' value='checked="checked"'></c:set>
																	</c:if>
																	연어 <input type="checkbox" type="radio" id="allergy"
																		name="mem_sal" value="1" ${sal} />
																	<c:if test="${member.suk eq 1}">
																		<c:set var='suk' value='checked="checked"'></c:set>
																	</c:if>
																	쑥 <input type="checkbox" type="radio" id="allergy"
																		name="mem_suk" value="1" ${suk} />
																</div>
																<div>
																	<c:if test="${member.cow eq 1}">
																		<c:set var='cow' value='checked="checked"'></c:set>
																	</c:if>
																	소고기 <input type="checkbox" type="radio" id="allergy"
																		name="mem_cow" value="1" ${cow} />
																	<c:if test="${member.chi eq 1}">
																		<c:set var='chi' value='checked="checked"'></c:set>
																	</c:if>
																	닭고기 <input type="checkbox" type="radio" id="allergy"
																		name="mem_chi" value="1" ${chi} />
																	<c:if test="${member.pig eq 1}">
																		<c:set var='pig' value='checked="checked"'></c:set>
																	</c:if>
																	돼지고기 <input type="checkbox" type="radio" id="allergy"
																		name="mem_pig" value="1" ${pig} />
																</div>
																<div>
																	<c:if test="${member.peach eq 1}">
																		<c:set var='peach' value='checked="checked"'></c:set>
																	</c:if>
																	복숭아 <input type="checkbox" type="radio" id="allergy"
																		name="mem_peach" value="1" ${peach} />
																	<c:if test="${member.mind eq 1}">
																		<c:set var='mind' value='checked="checked"'></c:set>
																	</c:if>
																	민들레 <input type="checkbox" type="radio" id="allergy"
																		name="mem_mid" value="1" ${mind} />
																	<c:if test="${member.egg eq 1}">
																		<c:set var='egg' value='checked="checked"' />
																	</c:if>
																	계란흰자 <input type="checkbox" type="radio" id="allergy"
																		name="mem_egg" value="1" ${egg} />
																</div>
															</fieldset>
														</td>
													</tr>

												</table>
											</div>
											<div style="text-align: center">
												<input type="submit" id="mem_update" value="수정"
													onclick="javascript: form.action='update.do';"> <input
													type="submit" id="mem_delete" value="삭제"
													onclick="javascript: form.action='delete.do';">
											</div>
										</form>
									</li>
								</ul></li>
						</c:otherwise>
					</c:choose>


				</ul>
			</div>
			<div></div>
		</div>

	</nav>
</body>
</html>