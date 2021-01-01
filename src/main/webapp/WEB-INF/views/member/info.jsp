<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />

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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/member/CSS/info.css" />

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
						<a class="nav-link" href="${pageContext.request.contextPath }/rent">대여하기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath }/apply">시설수리신청</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath }/board">자유게시판</a>
					</li>
					<c:choose>
						<c:when test="${fn:length(username) == 0 }">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath }/member/join">회원가입</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath }/security/login">로그인</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item">
								<a class="nav-link username">${username }</a>
							</li>
							<li class="nav-item">
								<a class="nav-link logout">로그아웃</a>
							</li>
							<form name="logoutFrm" action="${pageContext.request.contextPath }/security/logout" method="POST">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
							</form>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</header>
	
	<section>
		<div class="content-wrap">
			<div class="title">
				<h4>사용자 정보</h4>
			</div>
			<div class="user-info-wrap">
				<label for="user-id" class="form-label">회원 아이디</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="user-id" id="user-id" aria-describedby="user-id" disabled>
				</div>
				
				<label for="password-change" class="form-label">비밀번호 수정</label>
				<div class="input-group mb-3">
					<input type="password" class="form-control" name="password-change" id="password-change" aria-describedby="password-change">
				</div>
				
				<label for="password-change-check" class="form-label">비밀번호 수정 확인</label>
				<div class="input-group mb-3">
					<input type="password" class="form-control" name="password-change-check" id="password-change-check" aria-describedby="password-change-check">
				</div>
				
				<label for="name" class="form-label">이름</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="name" id="name" aria-describedby="name" disabled>
				</div>
				
				<label for="email" class="form-label">이메일</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="email" id="email" aria-describedby="email" disabled>
				</div>
				
				<label for="birth" class="form-label">생년월일</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="birth" id="birth" aria-describedby="birth" disabled>
				</div>
				
				<label for="phone" class="form-label">전화번호</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="phone" id="phone" aria-describedby="phone">
				</div>
				
				<div class="info-change-button">
					<button type="button" class="btn btn-success change-button">회원 정보 수정</button>
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

<!-- ajax request -->
<script src="${pageContext.request.contextPath }/resources/member/JS/info.js"></script>
</html>