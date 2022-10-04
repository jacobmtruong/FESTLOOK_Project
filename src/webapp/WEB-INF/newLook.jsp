<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UFT-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<title>New Look</title>
</head>
<body
	style="background-image: url('/images/newlook.jpg'); background-size: cover;">
	<!-- 	 ==== NAV BAR ==== -->

	<div
		style="position: fixed; top: 0; width: 100%; z-index: 99; background-color: #212121;">
		<div
			style="width: 50%; margin: auto; height: fit-content; display: flex; justify-content: space-between; align-items: center; padding: 10px;">
			<a href="/" style="text-decoration: none; color: white; text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff;"><h1>FESTLOOK</h1></a>
			<div style="display: flex; gap: 50px">
				<b><a href="/" style="text-decoration: none; color: white;">Newsfeed</a></b>
				<b><a href="/marketplace" style="text-decoration: none; color: white;">Marketplace</a></b>
			</div>
			<div style="display: flex; gap: 10px;">
				<c:choose>
					<c:when test="${user_id != null }">
						<a href="/user/info" class="btn"
							style="background-color: #212121; color: white; border: 2px solid white;">My
							Profile</a>
						<a href="/user/logout" class="btn"
							style="background-color: white; color: #212121; border: 2px solid white;">Sign
							out</a>
					</c:when>
					<c:otherwise>
						<a href="/user/login" class="btn" style="color: white;">Sign
							In</a>
						<a href="/user/join" class="btn"
							style="background-color: white; color: #212121; border: 2px solid white;">Join</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>



	<div
		style="width: 30%; padding: 30px; margin: auto; margin-top: 200px; border: 2px solid black; border-radius: 20px;">
		<form:form action="/look/new" method="post" modelAttribute="look">
			<h1
				style="margin-bottom: 20px; color: white; text-shadow: 0 0 10px #fff;">Post
				a Look</h1>
			<p>
				<form:errors path="title" />
			</p>
			<p>
				<form:errors path="image" />
			</p>
			<p>
				<form:errors path="description" />
			</p>
			<p>
				<form:errors path="location" />
			</p>
			<p>
				<form:input path="title" type="text"
					style="width: 70%;opacity:0.7; padding:10px;border-radius: 10px"
					placeholder="Name your look" />
			</p>
			<p>
				<form:input path="image" type="text"
					style="width: 70%;opacity:0.7; padding:10px;border-radius: 10px"
					placeholder="Image URL" />
			</p>
			<p>
				<form:input path="location" type="text"
					style="width: 70%;opacity:0.7;padding:10px;border-radius: 10px" placeholder="Location" />
			</p>
			<p>
				<form:textarea path="description" type="text"
					style="width: 100%;opacity:0.7;padding:10px;border-radius: 10px"
					placeholder="Description ..." />
			</p>

			<div style="display: flex; justify-content: space-between;">
				<input type="submit" value="Post" class="btn"
					style="color: white; border: 2px solid white; margin-top: 10px; width: 100%;">
			</div>
		</form:form>
	</div>



</body>
</html>