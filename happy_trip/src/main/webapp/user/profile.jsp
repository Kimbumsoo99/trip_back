<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.happy.member.model.dto.MemberDto"%>
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
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<!-- novalidate -->
				<!-- was-validated -->
				<form id="update-form" action="${root}/user" class="needs-validation">
					<input type="hidden" name="action" value="modify" /> 
					<div class="mb-3">
						<div id="name-div" class="p-1">
							<label for="user-name" class="form-label">이름 :</label> <input
								type="text" class="form-control" id="user-name" name="userName"
								value="${member.userName}" />
						</div>
						<div class="p-1">
							<label for="user-join-id" class="form-label">아이디 :</label> <input
								type="text" name="update_userid" class="form-control"
								id="user-join-id" value="${member.userId}" required />
						</div>
						<div class="p-1">
							<label for="user-join-password" class="form-label">비밀번호 :</label>
							<input type="password" class="form-control"
								id="user-join-password" placeholder="비밀번호를 입력하세요" required
								name="userPw" />
							<div style=color:red;>${msg}</div>
						</div>
						<div class="p-1">
							<label for="user-email" class="form-label">이메일 :</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="user-email"
									value="${member.emailId}" name="emailId" placeholder="이메일아이디"
									required /> <span id="at-span" class="input-group-text">@</span>
								<select name="emailDomain" class="form-select" id="mail"
									required>
									<option>선택</option>
									<option
										<c:if test="${member.emailDomain eq 'ssafy.com'}"> selected</c:if>>ssafy.com</option>
									<option
										<c:if test="${member.emailDomain eq 'gmail.com'}"> selected</c:if>>gmail.com</option>
									<option
										<c:if test="${member.emailDomain eq 'naver.com'}"> selected</c:if>>naver.com</option>
								</select>
								<div class="invalid-feedback">Your username is required.</div>
							</div>
						</div>
						<div class="p-1">
							<label for="user-area" class="form-label">지역 :</label>
							<div class="input-group has-validation">
								<div class="container-fluid d-flex p-0">
									<select class="form-select" id="sido" name="sido" required>
										<option value="">시도선택</option>
									</select> <select class="form-select" id="gugun" name="gugun" required>
										<option value="">구군선택</option>
									</select>
								</div>
								<div class="invalid-feedback">Your username is required.
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<form id="delete-form" action="${root}/user" class="needs-validation">
				<input type="hidden" name="action" value="deleteAccount" /> <input
					type="hidden" name="delete_userId" value="${member.userId}" />
			</form>
			<!-- Modal footer -->
			<div class="modal-footer d-flex justify-content-center">
				<button type="button" id="modify"
					class="btn btn-outline-primary m-3">수정하기</button>
				<button type="button" id="delete" class="btn btn-outline-danger m-3">탈퇴하기</button>
			</div>
		</div>
	</main>
	<!-- main end -->
	<script>
		document.querySelector("#modify").addEventListener("click", function() {
			if (!document.querySelector("#user-join-password").value) {
				alert("비밀번호를 입력해야 변경할 수 있습니다.");
				return;
			} else {
				const form = document.querySelector("#update-form");
				form.setAttribute("method", "POST");
				form.submit();
			}
		});

		document.querySelector("#delete").addEventListener("click", function() {
			if (prompt("정말 삭제하시겠습니까?")) {
				const form = document.querySelector("#delete-form");
				form.setAttribute("method", "POST");
				form.submit();
			}
		});
	</script>
	<script src="${root}/assets/js/userService.js"></script>

	<!-- footer -->
	<%@ include file="/partials/footer.jsp"%>
	<!-- footer -->