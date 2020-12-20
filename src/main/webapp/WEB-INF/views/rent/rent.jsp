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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bike/CSS/rent.css" />

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
				    <a class="nav-link now">대여하기</a>
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
	<div class="search-wrap">
		<div class="input-group mb-3">
			<input type="text" class="form-control" name="search" placeholder="장소 검색" aria-label="search" aria-describedby="search">
			<button class="btn btn-success" type="button" id="search">Button</button>
		</div>
	</div>
	<section>
		<div id="google-map"></div>
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
<script src="${pageContext.request.contextPath }/resources/main/JS/header_rent.js"></script>
<!-- Logout -->
<script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
<!-- Logout -->
<script src="${pageContext.request.contextPath }/resources/bike/JS/google_map.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7tfSWQA-lsA4OKiiApAt6c0YoR9sVFcw&callback=myMap"></script>
</html>