<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인 모달 start -->

<%
Cookie[] cookies = request.getCookies(); //client에서 쿠키를 받아옴


String cookieValue = null;

if(cookies!=null){
    for(int i=0;i<cookies.length;i++){
        if(cookies[i].getName().equals("last_id")){
            cookieValue = cookies[i].getValue();
        }
    }
}
%>


<div class="modal" id="login-modal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title fw-bold">로그인</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form id="login-form" class="needs-validation" novalidate="">
				<input type="hidden" name="action" value="signIn">
					
					<div class="mb-3">
						<div class="p-1">
							<i class="bi bi-calendar2-date text-primary"></i> <label
								for="user-id" class="form-label" >아이디 :</label> <input
								type="text" class="form-control" placeholder="아이디를 입력하세요."
								required id="user-id" name="userId" 
								<% if (cookieValue != null) {%> value="<%= cookieValue %>" <% } %>
								/>
						</div>
						<div class="p-1">
							<i class="bi bi-calendar2-date text-danger"></i> <label
								for="user-password" class="form-label" >비밀번호 :</label> <input
								type="password" class="form-control" placeholder="비밀번호를 입력하세요."
								required id="user-password" name="userPw"
								 />
						</div>
						<div id="fail-alert"
							class="alert alert-danger ms-2 me-2 pt-2 pb-2 d-none"
							role="alert">ID 또는 PASSWORD가 틀렸습니다.</div>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="idck"
							id="flexCheckChecked" <% if (cookieValue != null) {%> checked <% } %> > <label
							class="form-check-label" for="flexCheckChecked"> 아이디저장 </label>
					</div>
				</form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" id="signin"
					class="btn btn-outline-primary">로그인</button>
				<!-- <button type="button" class="btn btn-outline-secondary">아이디찾기</button> -->
				<button type="button" class="btn btn-outline-secondary"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
		<script>
		document.querySelector("#signin").addEventListener("click", function(){
			console.log(1);
			const form = document.querySelector("#login-form");
			form.setAttribute("action", "/happy_trip/user");
			form.setAttribute("method", "POST");
			form.submit();
		});
	</script>
</div>
<!-- 로그인 모달 end -->