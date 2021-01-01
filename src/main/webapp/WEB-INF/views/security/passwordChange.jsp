<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- Footer -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/footer.css" />
<!-- Section -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/section.css" />
<!-- content -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/passwordChange.css" />

<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/3fc65ab30c.js" crossorigin="anonymous"></script>

<title>Rent Bike</title>
</head>
<body>
	<header>
		<div id="logo">
			<a href="${pageContext.request.contextPath }/">
				<img src="${pageContext.request.contextPath }/resources/images/logo_white.png" />
			</a>
		</div>
	</header>
	
	<section>
		<div class="content-wrap">
			<h3>비밀번호 변경</h3>
			<div class="input-group mb-3">
				<span class="input-group-text" id="mid">ID</span> 
				<input type="text" name="mid" class="form-control" value="${mid }" disabled>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="mpw">PASSWORD</span> 
				<input type="password" name="mpw" class="form-control" placeholder="비밀번호를 입력하세요.">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="mpwChk">PASSWORD CHECK</span> 
				<input type="password" name="mpwChk" class="form-control" placeholder="비밀번호를 한번 더 입력하세요.">
			</div>
			<button type="button" name="change-btn" class="btn btn-success w-100">비밀번호 변경</button>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
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
	
<!-- Password Change -->
<script src="${pageContext.request.contextPath }/resources/security/JS/passwordChange.js"></script>
</html>