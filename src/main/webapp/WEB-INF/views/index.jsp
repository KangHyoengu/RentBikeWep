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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/header.css" />
<!-- Footer -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/footer.css" />
<!-- Section -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/section.css" />
<!-- content -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/main/CSS/index.css" />

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
				    <a class="nav-link" href="">대여하기</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="">공지사항</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="">자유게시판</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="">회원가입</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="">로그인</a>
				  </li>
				</ul>
			</div>
		</div>
	</header>
	
	<section>
		<div class="backOp">
			<div class="content-wrap">
				<div class="introduction">
					친환경 교통수단 자전거!<br>  
					언제, 어디서나, 쉽고, 편리하게<br>사용하는 자전거 무인 대여 시스템
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		
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