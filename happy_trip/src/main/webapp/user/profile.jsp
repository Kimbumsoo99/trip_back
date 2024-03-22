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
		<div class="container border border-primary col-4">
			<!-- Modal Header -->
			<div class="modal-header" style="height: 50px">
				<h4 class="modal-title fw-bold">회원 정보</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<!-- novalidate -->
				<!-- was-validated -->
				<form id="join-form" class="needs-validation" action="">
					<div class="mb-3">
						<div id="name-div" class="p-1">
							<label for="user-name" class="form-label">이름 :</label> <input
								type="text" class="form-control" id="user-name" name="user-name" />
						</div>
						<div class="p-1">
							<label for="user-join-id" class="form-label">아이디 :</label> <input
								type="text" class="form-control" id="user-join-id" disabled
								required name="user-join-id" />
						</div>
						<div class="p-1">
							<label for="user-join-password" class="form-label">비밀번호
								:</label> <input type="password" class="form-control"
								id="user-join-password" placeholder="비밀번호를 입력하세요" required
								name="user-join-password" />
							<div class="invalid-feedback">비밀번호를 입력하세요.</div>
						</div>
						<div class="p-1">
							<label for="user-email" class="form-label">이메일 :</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="user-email"
									placeholder="이메일아이디" required />
								<span id="at-span" class="input-group-text">@</span> <select
									class="form-select" id="mail" required>
									<option value="">선택</option>
									<option>ssafy.com</option>
									<option>gmail.com</option>
									<option>naver.com</option>
								</select>
								<div class="invalid-feedback">Your username is required.</div>
							</div>
						</div>
						<!-- <div class="p-1">
                                <label for="user-area" class="form-label">지역 :</label>
                                <div class="input-group has-validation">
                                    <div class="container-fluid d-flex p-0">
                                        <select class="form-select" id="sido" required>
                                            <option value="">시도선택</option>
                                        </select>
                                        <select class="form-select" id="gugun" required>
                                            <option value="">구군선택</option>
                                        </select>
                                    </div>
                                    <div class="invalid-feedback">Your username is required.</div>
                                </div>
                            </div> -->
					</div>
				</form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer d-flex justify-content-center">
				<button type="button" onclick="updateBtnClickEventListner();"
					class="btn btn-outline-primary m-3">
					수정하기</button>
				<button type="button" class="btn btn-outline-danger m-3"
					onclick="deleteProfile();">탈퇴하기</button>
			</div>
		</div>
	</main>
	<!-- main end -->

	<script src="js/updateUser.js"></script>
	<script src="js/logout.js"></script>
	<!-- footer -->
	<%@ include file="/partials/footer.jsp"%>
	<!-- footer -->