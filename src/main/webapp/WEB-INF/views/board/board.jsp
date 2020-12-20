<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	int totalPage = 0;
	int count = (int)request.getAttribute("count");
	
	if(count != 0){
		if(count % 10 != 0){
			totalPage = count / 10 + 1;	
		} else {
			totalPage = count / 10;
		}
	}
%>
<c:set var="totalPage" value='<%=totalPage %>' />
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/CSS/repair.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/board/CSS/board.css" />

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
			<div class="top">
				<h2>자유게시판</h2>
				<button type="button" name="write" class="btn btn-success write" data-bs-toggle="modal" data-bs-target="#write">게시글 작성하기</button>
			</div>
			<div class="repair-wrap">
				<table class="table table-light table-striped table-hover">
					<thead>
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:choose>
							<c:when test="${count != 0 }">
								<c:forEach var="item" items="${list }">
									<tr data-bs-toggle="modal" data-bs-target="#detail" onclick="detail()">
										<th scope="row">${item.bno }</th>
										<td>${item.btitle }</td>
										<td>${item.mid }</td>
										<td>${item.regdate }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<th class="nothing" colspan="4">작성된 게시글이 없습니다.</th>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="page-wrap" data-total="${totalPage }">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item" data-status="0"><a class="page-link" id="previous" onclick="previous()"><i class="fas fa-angle-left"></i></a></li>
						<c:if test="${totalPage > 10 }">
							<c:set var="totalPage" value='<%=10 %>' />
						</c:if>
						<c:forEach begin="1" end="${totalPage }" varStatus="status">
							<c:if test="${status.index == 1 }">
								<li class="page-item page-bar nowPage" data-page="${status.index }"><a class="page-link" onclick="page()">${status.index }</a></li>
							</c:if>
							<c:if test="${status.index != 1 }">
								<li class="page-item page-bar" data-page="${status.index }"><a class="page-link" onclick="page()">${status.index }</a></li>
							</c:if>
						</c:forEach>
						<li class="page-item" data-status="1"><a class="page-link" id="next" onclick="next()"><i class="fas fa-angle-right"></i></a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		
		<!-- 게시글 작성하기 -->
		<div class="modal fade" id="write" tabindex="-1" aria-labelledby="write" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">게시글 작성하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="writeForm" action="${pageContext.request.contextPath }/board/write" method="POST" enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
							<div class="input-wrap">
								<h4>제목</h4> 
								<div class="input-group mb-3">
									<input type="text" name="btitle" class="form-control" placeholder="제목" aria-label="rtitle" aria-describedby="rtitle" required>
								</div>
							</div>
							
							<div class="text-wrap">
								<h4>게시글 내용</h4> 
								<div class="input-group">
									<textarea name="bcontent" class="form-control" aria-label="With textarea" placeholder="내용을 입력해 주세요." required></textarea>
								</div>
							</div>
							
							<div class="up-wrap">
								<div id="upBtn">
									<h4>업로드</h4>
									<button type="button" name="plus" id="plus" class="btn btn-outline-success"><i class="fas fa-plus"></i></button>
								</div>
								<div class="input-group upload-wrap">
									<input type="file" class="form-control" id="up-file" name="upload" accept=".gif, .jpg, .png, .jpeg">
								 	<button class="btn btn-outline-danger" id="minus" type="button" name="minus"><i class="fas fa-minus"></i></button>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success submit" data-bs-dismiss="modal">작성하기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 게시글보기 -->
		<div class="modal fade" id="detail" tabindex="-1" aria-labelledby="detail" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">게시글 제목</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>게시글 본문</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">Save changes</button>
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
<!-- Pagination -->
<script src="${pageContext.request.contextPath }/resources/board/JS/pagination.js"></script>
<!-- Write -->
<script src="${pageContext.request.contextPath }/resources/board/JS/write.js"></script>
<!-- Detail -->
<script src="${pageContext.request.contextPath }/resources/board/JS/detail.js"></script>
</html>