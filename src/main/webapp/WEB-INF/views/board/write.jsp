<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert('다시 작성해 주세요.');
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			function getContextPath() {
			    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
			}
		
			location.href = getContextPath() + "/board"
		</script>
	</c:otherwise>
</c:choose>