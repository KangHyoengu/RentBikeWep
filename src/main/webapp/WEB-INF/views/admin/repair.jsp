<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />

<%
	int tPage = 0;
	int count = (int)request.getAttribute("totalPage");
	
	if(count != 0){
		if(count % 10 != 0){
			tPage = count / 10 + 1;	
		} else {
			tPage = count / 10;
		}
	}
%>
<c:set var="tPage" value='<%=tPage %>'/>

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
						<a class="nav-link now">수리 신청</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath }/admin/adminMember">회원 관리</a>
					</li>
				</ul>
			</div>
		</div>
	</header>
	
	<section>
		<div class="content-wrap">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<div class="top">
				<h2>시설 수리 신청</h2>
			</div>
			<div class="repair-wrap">
				<table class="table table-light table-striped table-hover">
					<thead>
						<tr>
							<th scope="col">신청번호</th>
							<th scope="col">제목</th>
							<th scope="col">신청인</th>
							<th scope="col">신청일</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:choose>
							<c:when test="${fn:length(list) != 0 }">
								<c:forEach var="item" items="${list }">
								<tr data-bs-toggle="modal" data-bs-target="#repair-detail" data-no="${item.repairno }">
										<th scope="row">${item.repairno }</th>
								<c:choose>
									<c:when test="${item.rstatus == 1 }">
										<td class="finish">${item.rtitle }</td>
									</c:when>
									<c:otherwise>
										<td>${item.rtitle }</td>
									</c:otherwise>
								</c:choose>
										<td>${item.mid }</td>
										<td>${item.regdate }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<th class="nothing" colspan="4">신청된 수리가 없습니다.</th>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<!-- Pagination -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center" data-totalPage="${totalPage }">
					<li class="page-item disabled" id="previous" data-status="0"><a class="page-link"><i class="fas fa-angle-left"></i></a></li>
					<c:if test="${totalPage > 10 }">
						<c:set var="totalPage" value="<%=10 %>"/>
					</c:if>
					<c:forEach begin="1" end="${totalPage }" varStatus="status">
						<c:if test="${status.index == 1 }">
							<li class="page-item"><a class="page-link page-num nowPage" data-page="${status.index }">${status.index }</a></li>
						</c:if>
						<c:if test="${status.index != 1 }">
							<li class="page-item"><a class="page-link page-num" data-page="${status.index }">${status.index }</a></li>
						</c:if>
					</c:forEach>
					<li class="page-item" id="next" data-status="1"><a class="page-link"><i class="fas fa-angle-right"></i></a></li>
				</ul>
			</nav>
		</div>
		
		<!-- Vertically centered scrollable modal -->
		<div class="modal fade" id="repair-detail" tabindex="-1" aria-labelledby="apply-detail" aria-hidden="true" data-no="">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="repairImg">
							<img src="" />
						</div>
						<div class="applyUser"></div>
						<div class="bikeno"></div>
						<div class="rcategory"></div>
						<div class="rcontent-wrap">
							<div class="rcontent-title"></div>
							<div class="rcontent"></div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success">수리 완료</button>
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
<script src="${pageContext.request.contextPath }/resources/admin/JS/repairPagination.js"></script>

<!-- Detail -->
<script src="${pageContext.request.contextPath }/resources/admin/JS/repairDetail.js"></script>
</html>