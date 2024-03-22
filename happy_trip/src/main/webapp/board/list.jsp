<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.happy.board.model.dto.BoardDto"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/style.css" />
</head>

<body>
	<!-- 헤더 위치 -->
	<%@ include file="/partials/header.jsp"%>
	<!-- 가운데 정렬할 전체 -->
	<div class="container mt-5 text-center" style="width: 70%; height: 70%">
		<!-- 게시판 이름 -->
		<div class="row">
			<h1 class="text-black-50 fw-bold">여행 정보 공유</h1>
		</div>
		<!-- 게시판 전체-->
		<div class="row">
			<!-- 게시판 헤더? -->
			<div class="mt-5 row">
				<button
				id="regist-btn"
					class="col col-lg-1 col-md-2 ml-auto btn btn-outline-primary">
					글쓰기</button>

				<div class="col row ms-auto col-lg-7">
					<select class="col form-select me-2">
						<option value="1">글번호</option>
						<option value="2">제목</option>
						<option value="3">작성자</option>
						<option value="4">조회수</option>
						<option value="5">작성일</option>
					</select> <input class="col ms-auto col-lg-6 me-2" />
					<button
						class="col col-lg-2 col-md-2 ml-auto btn bg-dark text-white">
						검색</button>
				</div>
			</div>
		</div>

		<!-- 게시판 -->
		<div class="mt-3">
			<table class="table">
				<thead class="table-light border-bottom border-secondary border-3">
					<tr>
						<th class="col fw-bold w-10">글번호</th>
						<th class="col fw-bold">제목</th>
						<th scope="col fw-bold">작성자</th>
						<th scope="col fw-bold">조회수</th>
						<th scope="col fw-bold">작성일</th>
					</tr>
				</thead>
				<tbody class="table-sm">
					<!-- 동적 추가될 위치!! -->
					<c:forEach var="board" items="${boards}">
						<tr>
							<td class="fw-bold">${board.boardNo}</td>
							<td class="text-start"><a href="${root}/board?action=view&board_no=${board.boardNo}">${board.subject}</a></td>
							<td>${board.userId}</td>
							<td>${board.hit}</td>
							<td>${board.registerDate}</td>
						</tr>
					</c:forEach>
					<!-- 동적 추가될 위치!! -->
				</tbody>
			</table>
		</div>
		<div class="me-auto ms-auto">
			<nav class="d-flex justify-content-center"
				aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<!-- footer 위치-->
	<%@ include file="/partials/footer.jsp" %>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script>
		document.querySelector("#regist-btn").addEventListener("click", function(){
			location.href="${root}/board?action=mvwrite"
		})
	</script>
	<script src="js/logout.js"></script>
</body>
</html>
