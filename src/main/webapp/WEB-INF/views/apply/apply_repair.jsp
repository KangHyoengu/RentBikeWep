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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/apply/CSS/apply_repair.css" />

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
						<a class="nav-link now">시설수리신청</a>
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
								<a class="nav-link username" href="${pageContext.request.contextPath }/member/info">${username }</a>
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
			<div class="top">
				<h2>시설 수리 신청</h2>
			</div>
			<form name="applyForm" action="${pageContext.request.contextPath }/apply/applyOk" 
						method="POST" enctype="multipart/form-data" onsubmit="return submitChk()">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<input type="hidden" name="mid" value="${username }" />
				
				<div class="input-wrap">
					<h4>제목</h4> 
					<div class="input-group mb-3">
						<input type="text" name="rtitle" class="form-control" placeholder="제목" aria-label="rtitle" aria-describedby="rtitle" required>
					</div>
				</div>
				
				<div class="input-wrap">
					<h4>자전거 일련번호</h4> 
					<div class="input-group mb-3">
						<input type="text" name="bikeno" class="form-control" placeholder="ex) #00000001" aria-label="bikeno" aria-describedby="bikeno" required>
					</div>
				</div>
				
				<div class="input-wrap">
					<h4>고장 분류</h4>
					<select name="rcategory" class="form-select" aria-label="Default select example">
						<option value="0" selected>타이어</option>
						<option value="1">핸들</option>
						<option value="2">체인</option>
						<option value="3">브레이크</option>
						<option value="4">안장</option>
						<option value="5">기타</option>
					</select>
				</div>
				
				<div class="text-wrap">
					<h4>고장 상세 내용</h4> 
					<div class="input-group">
						<textarea name="rcontent" class="form-control" aria-label="With textarea" required></textarea>
					</div>
				</div>
				
				<div class="text-wrap">
					<h4>고장 이미지</h4>
					<div class="input-group">
						<input type="file" class="form-control" id="up-file" name="upload" accept=".gif, .jpg, .png, .jpeg">
					</div>
				</div>
				<input type="submit" class="btn btn-success w-100" name="apply-submit" value="수리 신청 하기"/>
			</form>
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
<!-- Content -->
<script src="${pageContext.request.contextPath }/resources/apply/JS/apply_repair.js"></script>
</html>