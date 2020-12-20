<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACCESS DENIED</title>
<style type="text/css">
	body{
		width: 100%;
		height: 100vh;
	}
	
	div{
		width: 500px; 
		height: 500px;
		position: relative;
		top: 50%;
		margin-top: -250px;
		left: 50%;
		margin-left: -250px;
	}
	img{
		width: 100%; 
		height: 100%;
	}
</style>
</head>
<body>
	<div>
		<img src="${pageContext.request.contextPath }/resources/images/accessDenied.png" />
	</div>
</body>
</html>