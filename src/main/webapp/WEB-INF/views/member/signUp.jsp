<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/member/CSS/signUp.css" />
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/3fc65ab30c.js" crossorigin="anonymous"></script>

<title>Sign Up</title>
</head>
<body>
	<section>
		<div class="content-wrap">
			<!-- 메인 로고 -->
			<div id="logo">
				<a href="${pageContext.request.contextPath }/">
					<img src="${pageContext.request.contextPath }/resources/images/logo_1.png" />
				</a>
			</div>
			<!-- 회원 정보 입력 -->
			<form name="joinFrm" action="${pageContext.request.contextPath }/member/joinOk" 
					method="POST" onsubmit="return submitChk()">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<div class="id">
					<div class="input-group id-wrap">
						<span class="input-group-text" id="mid">아이디</span> 
						<input type="text" class="form-control" name="mid" placeholder="ID" aria-label="mid" aria-describedby="mid" required> 
					</div>
					<div class="d-grid gap-2 idChk">
						<input type="button" name="idChk" data-chk="0" class="btn btn-success" value="아이디 중복확인"/>
					</div>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="mpw">비밀번호</span> 
					<input type="password" class="form-control" name="mpw" placeholder="PASSWORD" aria-label="mpw" aria-describedby="mpw" required> 
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="passwordCHk">비밀번호 확인</span> 
					<input type="password" class="form-control" name="passwordChk" placeholder="PASSWORD CHECK" aria-label="passwordChk" aria-describedby="passwordChk" required> 
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="memail">이메일</span>
					<input type="text" name="memail" class="form-control" placeholder="email@example.com" aria-label="memail" required> 
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="mname">성함</span> 
					<input type="text" class="form-control" name="mname" placeholder="NAME" aria-label="mname" aria-describedby="mname" required> 
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="mbirth">생년월일</span> 
					<input type="text" class="form-control" name="mbirth" placeholder="YYYYMMDD" aria-label="mbirth" aria-describedby="mbirth" required> 
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="mgender">성별</span> 
					<select class="form-select" aria-label="Default select example" name="mgender" id="mgender" required>
						<option value="0" selected>남자</option>
						<option value="1">여자</option>
					</select>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="mphone">전화번호</span> 
					<input type="text" class="form-control" aria-label="Default select example" name="mphone" id="mphone" required/>
				</div>
				<div class="d-grid gap-2 submit">
					<button class="btn btn-success" name="signUp-btn" type="submit">가입하기</button>
				</div>
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
<!-- Content -->
<script src="${pageContext.request.contextPath }/resources/member/JS/signUp.js"></script>
	
</html>