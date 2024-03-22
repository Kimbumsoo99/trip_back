<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원가입 모달 start -->
	<div class="modal" id="join-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title fw-bold">회원가입</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<!-- novalidate -->
					<!-- was-validated -->
					<form id="join-form" class="needs-validation" action="">
						<div class="mb-3">
							<div class="p-1">
								<label for="user-name" class="form-label">이름 :</label> <input
									type="text" class="form-control" placeholder="이름을 입력하세요."
									id="user-name" name="user-name" />
								<div class="invalid-feedback">이름을 입력하세요.</div>
							</div>
							<div class="p-1">
								<label for="user-join-id" class="form-label">아이디 :</label> <input
									type="text" class="form-control" placeholder="아이디를 입력하세요."
									id="user-join-id" required name="user-join-id" />
								<div class="invalid-feedback">아이디를 입력하세요.</div>
							</div>
							<div class="p-1">
								<label for="user-join-password" class="form-label">비밀번호
									:</label> <input type="password" class="form-control"
									placeholder="비밀번호를 입력하세요." id="user-join-password" required
									name="user-join-password" />
								<div class="invalid-feedback">비밀번호를 입력하세요.</div>
							</div>
							<div class="p-1">
								<label for="user-password-confirm" class="form-label">비밀번호
									확인 :</label> <input type="password" class="form-control"
									placeholder="비밀번호 확인" id="user-password-confirm" required
									name="user-password-confirm" />
								<div class="invalid-feedback">입력된 비밀번호가 다릅니다.</div>
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
									<div class="invalid-feedback">Your username is required.
									</div>
								</div>
							</div>
							<div class="p-1">
								<label for="user-area" class="form-label">지역 :</label>
								<div class="input-group has-validation">
									<div class="container-fluid d-flex p-0">
										<select class="form-select" id="sido" required>
											<option value="">시도선택</option>
										</select> <select class="form-select" id="gugun" required>
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

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary"
						onclick="joinClickEventHandler();">
						회원가입</button>
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 모달 end -->