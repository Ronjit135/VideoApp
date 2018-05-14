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
	href='<c:url value="Scripts/CSS/Movie.css"></c:url>'>
<script
	src='<c:url value="Scripts/Bootstrap/jQuery/jquery_3-2-1.js"></c:url>'></script>
<script
	src='<c:url value="Scripts/Bootstrap/js/bootstrap.min.js"></c:url>'></script>
<script src='<c:url value="Scripts/JS/Movie.js"></c:url>'></script>
<title>VMate</title>
</head>
<body onload="onLoad();">
	<div class="sidenav">
		<a href="Home"><img src='<c:url value="Images/Logo.png"></c:url>'
			width="150px" alt="Logo"></a> <a href="Movie">Movie</a> <a
			href="Show">Shows</a>
	</div>
	<div class="main">
		<div class="container-fluid" id="movie">
			<div class="row directory">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<table class="table table-hover">
						<tbody>
							<c:forEach var="file" items="${fileList}">
								<c:if test="${file.isDirectory()}">
									<tr>
										<td onclick="selectDirectory(this);">${file.getName()}</td>
									</tr>
								</c:if>
								<c:if test="${!file.isDirectory()}"></c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<table class="table table-hover">
						<tbody id="added"></tbody>
					</table>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<div class="container-fluid">
			<div id="loading">
				<img alt="Loading Video..." class="load"
					src='<c:url value="Images/Loading/3.gif"></c:url>'>
			</div>
		</div>
	</div>
</body>
</html>