<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value="Scripts/Bootstrap/css/bootstrap.min.css"></c:url>'>
<link rel="stylesheet"
	href='<c:url value="Scripts/CSS/HomePage.css"></c:url>'>
<script
	src='<c:url value="Scripts/Bootstrap/jQuery/jquery_3-2-1.js"></c:url>'></script>
<script
	src='<c:url value="Scripts/Bootstrap/js/bootstrap.min.js"></c:url>'></script>
<script src='<c:url value="Scripts/JS/HomePage.js"></c:url>'></script>
<title>VMate</title>
</head>
<body>
	<div class="sidenav">
		<a href="Home"><img src='<c:url value="Images/Logo.png"></c:url>'
			width="150px" alt="Logo"></a> <a href="Movie">Movie</a> <a
			href="Show">Shows</a>
	</div>
	<div class="main"></div>
</body>
</html>