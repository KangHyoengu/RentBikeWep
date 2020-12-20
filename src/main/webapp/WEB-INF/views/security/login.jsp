<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- Header -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/header_success.css" />
<!-- Footer -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/footer.css" />
<!-- Section -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/section.css" />
<!-- content -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login.css" />

<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/3fc65ab30c.js" crossorigin="anonymous"></script>

<title>Rent Bike</title>
</head>
<body>
	<header data-status="0">
		<div id="header">
			<div id="logo">
				<a href="${pageContext.request.contextPath }/">
					<img src="${pageContext.request.contextPath }/resources/images/logo_white.png" />
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
				  <li class="nav-item">
				    <a class="nav-link" href="${pageContext.request.contextPath }/member/join">회원가입</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link now" href="">로그인</a>
				  </li>
				</ul>
			</div>
		</div>
	</header>

	<section>
		<div class="bgImg">
			<div class="content-wrap">
				<div class="login-wrap">
					<form name="frm" action="${pageContext.request.contextPath }/login" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<h3>로그인</h3>
					<div class="input-group mb-3">
						<span class="input-group-text" id="username">ID</span> 
						<input type="text" name="username" class="form-control" placeholder="아이디를 입력해 주세요." aria-label="username" aria-describedby="username">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="password">Password</span> 
						<input type="password" name="password" class="form-control" placeholder="비밀번호를 입력해 주세요." aria-label="password" aria-describedby="password">
					</div>
		
					<div class="btn-wrap">
						<input type="button" class="btn btn-success" value="ID/Password 찾기" />
						<input type="submit" id="btn_login" class="btn btn-success" value="로그인" />
					</div>
				</form>
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
</html>