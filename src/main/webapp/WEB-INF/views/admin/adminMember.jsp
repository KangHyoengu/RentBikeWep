<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- Header -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/header.css" />
<!-- Footer -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/footer.css" />
<!-- Section -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/section.css" />
<!-- content -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/CSS/adminMember.css" />

<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/3fc65ab30c.js" crossorigin="anonymous"></script>

<title>Rent Bike</title>
</head>
<body>
	<header data-status="0">
		<div id="header">
			<div id="logo">
				<a href="${pageContext.request.contextPath }/">
					<img src="${pageContext.request.contextPath }/resources/images/logo_1.png" />
				</a>
			</div>
			<div id="hamberger"><i class="fas fa-bars"></i></div>
			<div id="nav">
				<ul class="nav nav-pills justify-content-end">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath }/admin/adminRepair">수리 신청</a>
					</li>
					<li class="nav-item">
						<a class="nav-link now">회원 관리</a>
					</li>
				</ul>
			</div>
		</div>
	</header>
	
	<section>
		<div class="content-wrap">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<div class="title">
				<h2>회원 관리</h2>
				<input type="text" class="form-control search" placeholder="검색할 회원 아이디를 입력하세요. "/>
			</div>
			<div class="member-wrap">
				<div class="member-table">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th scope="col">회원번호</th>
								<th scope="col">이름</th>
								<th scope="col">이메일</th>
								<th scope="col">전화번호</th>
							</tr>
						</thead>
						<tbody id="tbody"></tbody>
					</table>
				</div>
			</div>
		</div>
		
		<!-- Vertically centered scrollable modal -->
		<div class="modal fade" id="member-detail" tabindex="-1" aria-labelledby="apply-detail" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">회원 상세 정보</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body" data-no="">
						<div class="info-wrap">
							<label>아이디</label>
							<div class="memberId"></div>
						</div>
						<div class="info-wrap">
							<label>이름</label>
							<div class="memberName"></div>
						</div>
						<div class="info-wrap">
							<label>이메일</label>
							<div class="memberEmail"></div>
						</div>
						<div class="info-wrap">
							<label>생년월일</label>
							<div class="memberBirth"></div>
						</div>
						<div class="info-wrap">
							<label>전화번호</label>
							<div class="memberTel"></div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success update">회원 수정</button>
						<button type="button" class="btn btn-danger remove">회원 탈퇴</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<div id="sns-icons">
			<div class="sns">
				<a href="https://www.facebook.com/seoul.kr" target="_blank"><i class="fab fa-facebook"></i></a>
				<span class="sns-name">facebook</span>
			</div>
			<div class="sns">
				<a href="https://www.instagram.com/seoul_official/" target="_blank"><i class="fab fa-instagram"></i></a>
				<span class="sns-name">instagram</span>
			</div>
			<div class="sns">
				<a href="https://twitter.com/seoulmania" target="_blank"><i class="fab fa-twitter"></i></a>
				<span class="sns-name">twitter</span>
			</div>
		</div>
	</footer>
</body>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
<!-- Header -->
<script src="${pageContext.request.contextPath }/resources/main/JS/header.js"></script>

<!-- Logout -->
<script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>

<!-- Detail -->
<script src="${pageContext.request.contextPath }/resources/admin/JS/memberDetail.js"></script>
</html>