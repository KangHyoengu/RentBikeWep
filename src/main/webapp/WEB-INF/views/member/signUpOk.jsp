<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("회원가입을 다시 시도해 주세요.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			function getContextPath() {
			    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
			}
			alert("회원가입을 환영합니다.");
			location.href = getContextPath()+"/"
		</script>
	</c:otherwise>
</c:choose>