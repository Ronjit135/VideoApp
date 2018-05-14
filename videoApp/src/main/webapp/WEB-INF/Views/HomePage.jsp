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
<body onload="onLoad()">
	<div class="sidenav">
		<a href="Home"><img src='<c:url value="Images/Logo.png"></c:url>'
			width="150px" alt="Logo"></a> <a href="Movie">Movie</a> <a
			href="Show">Shows</a>
	</div>
	<div class="main">
		<div class="container" id="content">
			<h3>Root Folder Paths</h3>
			<div class="row">
				<div class="col-sm-3 right">Movie Folder Path :</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="moviePath"
						id="moviePath">
				</div>
				<div class="col-sm-3">
					<button name="movie" id="movie" class="btn"
						onclick="savePath(this);">Save Path</button>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3 right">Show Folder Path :</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="showPath"
						id="showPath">
				</div>
				<div class="col-sm-3">
					<button name="show" id="show" class="btn" onclick="savePath(this);">Save
						Path</button>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3 right">Current Movie Folder Path :</div>
				<div class="col-sm-9" id="currentMoviePath">${currentMoviePath}</div>
			</div>
			<div class="row">
				<div class="col-sm-3 right">Current Show Folder Path :</div>
				<div class="col-sm-9" id="currentShowPath">${currentShowPath}</div>
			</div>
		</div>
	</div>
</body>
</html>