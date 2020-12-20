<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert('신청 중 오류가 발생하였습니다.');
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			function getContextPath() {
			    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
			}
			
			alert('신청되었습니다.');
			location.href = getContextPath() + "/"
		</script>
	</c:otherwise>
</c:choose>