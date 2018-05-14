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
	href='<c:url value="Scripts/CSS/Upload.css"></c:url>'>
<script
	src='<c:url value="Scripts/Bootstrap/jQuery/jquery_3-2-1.js"></c:url>'></script>
<script
	src='<c:url value="Scripts/Bootstrap/js/bootstrap.min.js"></c:url>'></script>
<title>VMate</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3 class="center">Add Movie</h3>
		</div>
		<form method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-sm-4">
					<select name="genreId" class="form-control">
						<c:forEach var="genre" items="${genreList}">
							<option value="${genre.id}">${genre.genre}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-sm-8">
					<input type="text" name="movieName" class="form-control">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-4">
					<input type="file" class="form-control" name="file">
				</div>
				<div class="col-sm-8">
					<input type="submit" class="btn" value="Add Movie">
				</div>
			</div>
		</form>
		<div class="row" id="show"></div>
	</div>
</body>
</html>