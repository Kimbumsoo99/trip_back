<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Happy Trip!</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet" href="${root}/assets/css/style.css" />
<link rel="stylesheet" href="${root}/assets/css/map.css" />
<script type="text/javascript"
	src="http//dapi.kakao.com/v2/maps/sdk.js?appkey=b43c988c5170c66105dad16e5cb282d1&libraries=services"></script>
<script
	src="http://sgis.kostat.go.kr/OpenAPI2/Key.do?serviceKey=JHW+1hoKL+7INEwzeiiNgY/lx/owvj1mY+MnLWSDbuY9PsYztUv+VziTl5zHvAbNTKlXP3MTVs5jK1fOfZ28dQ=="
	type="text/javascript"></script>
</head>
<body>
	<!-- header start -->
	<%@ include file="/partials/header.jsp"%>
	<!-- header end -->
	<!-- main start -->
	<main>
		<!-- main 1 start -->
		<div id="main-1" class="p-3 p-md-5 text-center bg-body-tertiary"
			style="background-image: url(${root}/img/airplain.jpg); background-repeat: no-repeat; background-size: 100%;">
			<div class="col-md-6 p-lg-5 mx-auto my-5">
				<h1 class="display-3 fw-bold">Happy Trip</h1>
				<h3 class="fw-normal text-light mt-3">여행 계획 공유와 추천</h3>
				<div class="d-flex gap-3 justify-content-center lead fw-normal">
					<span class="icon-link"> <svg class="bi">
					<use xlink:href="#chevron-right"></use></svg>
					</span> <span class="icon-link"> <svg class="bi">
					<use xlink:href="#chevron-right"></use></svg>
					</span>
				</div>
			</div>
		</div>
		<div class="container-fluid mt-3 mb-3 d-flex justify-content-center">
			<div class="card col-2 p-3 m-3">
				<img class="card-img-top" src="${root}/img/card_1.jpg"
					alt="Card image" />
				<div class="card-body">
					<h4 class="card-title">해변</h4>
					<p class="card-text">바다 심해 바다 심해 제주도 가고 싶다 놀고 싶다</p>
				</div>
			</div>
			<div class="card col-2 p-3 m-3">
				<img class="card-img-top" src="${root}/img/card_2.jpg"
					alt="Card image" />
				<div class="card-body">
					<h4 class="card-title">해변</h4>
					<p class="card-text">바다 심해 바다 심해 제주도 가고 싶다 놀고 싶다</p>
				</div>
			</div>
			<div class="card col-2 p-3 m-3">
				<img class="card-img-top" src="${root}/img/card_3.jpg"
					alt="Card image" />
				<div class="card-body">
					<h4 class="card-title">해변</h4>
					<p class="card-text">바다 심해 바다 심해 제주도 가고 싶다 놀고 싶다</p>
				</div>
			</div>
			<div class="card col-2 p-3 m-3">
				<img class="card-img-top" src="${root}/img/card_3.jpg"
					alt="Card image" />
				<div class="card-body">
					<h4 class="card-title">해변</h4>
					<p class="card-text">바다 심해 바다 심해 제주도 가고 싶다 놀고 싶다</p>
				</div>
			</div>
			<div class="card col-2 p-3 m-3">
				<img class="card-img-top" src="${root}/img/card_3.jpg"
					alt="Card image" />
				<div class="card-body">
					<h4 class="card-title">해변</h4>
					<p class="card-text">바다 심해 바다 심해 제주도 가고 싶다 놀고 싶다</p>
				</div>
			</div>
		</div>
		<!-- main 1 end -->
		<!-- main 2 start -->
		<div id="main-2"
			class="p-4 p-md-5 rounded text-body-emphasis bg-body-secondary bg-light row">
			<div class="col-lg-6 px-0">
				<h1 class="display-5 fst-italic" style="margin-top: 20%">당신의 여행
					계획을 뽐내보세요 !</h1>
				<p class="lead my-3">자신만의 여행 계획을 세우고 남들과 공유해보세요 !!!</p>
				<p style="margin-top: 10rem">
					<button type="button" id="link-to-board"
						class="btn btn-outline-primary d-flex align-items-center">
						<span class="ps-2"><a style="text-decoration: none"
							href="board.html">여행 정보 공유하러 가기</a></span>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-caret-right-fill"
							viewBox="0 0 16 16">
                              <path
								d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"></path>
                          </svg>
					</button>
				</p>
			</div>
			<div class="col-lg-6"
				style="background-image: url(${root}/img/see.jpg); background-repeat: no-repeat; background-size: 100%;"></div>
		</div>
		<!-- main 2 end -->
		<!-- main 3 start -->
		<div id="demo" class="carousel slide bg-dar" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
					class="active"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			</div>

			<div class="carousel-inner">
				<div class="carousel-item active">
					<div
						class="carousel-div bg-dark justify-content-center align-items-center row">
						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">신혼 여행🛫</h4>
								<p class="card-text">행복한 신혼을 꿈꾼다면 바로 여기!</p>
							</div>
						</div>

						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">휴가라면🚝</h4>
								<p class="card-text">바쁜 일상 속 여유로운 휴가를 떠나고 싶다면 요기!</p>
							</div>
						</div>

						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">바다가 가고 싶다면🚢</h4>
								<p class="card-text">시원한 파도 소리 들으면서 머리를 비우고 싶다면 요기!</p>
							</div>
						</div>

						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">화려한 호캉스🛴</h4>
								<p class="card-text">일상에서 벗어나 호화로운 휴가를 보내고 싶다면 바로 요기!</p>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div
						class="carousel-div bg-dark justify-content-center align-items-center row">
						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">신혼 여행🛫</h4>
								<p class="card-text">행복한 신혼을 꿈꾼다면 바로 여기!</p>
							</div>
						</div>

						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">휴가라면🚝</h4>
								<p class="card-text">바쁜 일상 속 여유로운 휴가를 떠나고 싶다면 요기!</p>
							</div>
						</div>

						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">바다가 가고 싶다면🚢</h4>
								<p class="card-text">시원한 파도 소리 들으면서 머리를 비우고 싶다면 요기!</p>
							</div>
						</div>

						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">화려한 호캉스🛴</h4>
								<p class="card-text">일상에서 벗어나 호화로운 휴가를 보내고 싶다면 바로 요기!</p>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div
						class="carousel-div bg-dark justify-content-center align-items-center row">
						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">휴가라면🚝</h4>
								<p class="card-text">바쁜 일상 속 여유로운 휴가를 떠나고 싶다면 요기!</p>
							</div>
						</div>
						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">신혼 여행🛫</h4>
								<p class="card-text">행복한 신혼을 꿈꾼다면 바로 여기!</p>
							</div>
						</div>
						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">화려한 호캉스🛴</h4>
								<p class="card-text">일상에서 벗어나 호화로운 휴가를 보내고 싶다면 바로 요기!</p>
							</div>
						</div>

						<div class="card mb-3 col-md-2 p-0"
							style="margin: 1.2rem; height: 60%">
							<img src="${root}/img/raod1.png" class="card-img-top"
								alt="img/raod1.png" />
							<div class="card-body">
								<h4 class="card-title">바다가 가고 싶다면🚢</h4>
								<p class="card-text">시원한 파도 소리 들으면서 머리를 비우고 싶다면 요기!</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo" data-bs-slide="prev">
				<span class="carousel-control-prev-icon bg-dark"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo" data-bs-slide="next">
				<span class="carousel-control-next-icon bg-dark"></span>
			</button>
		</div>
	</main>

	<!-- footer start -->
	<%@ include file="/partials/footer.jsp"%>
	<!-- footer start -->

	<!-- 모달 영역 start -->
	<!-- 로그인 모달 start -->
	<%@ include file="/user/login.jsp"%>
	<!-- 로그인 모달 end -->
	<!-- 회원가입 모달 start -->
	<%@ include file="/user/join.jsp"%>
	<!-- 회원가입 모달 end -->
	<!-- 모달 영역 end -->
	<script src="assets/js/userService.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>