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
<title>Login FESTLOOK</title>
</head>
<body style="background-image: url('/images/background.jpg'); background-size: cover; ">
	<!-- 	 ==== NAV BAR ==== -->

	<div
		style=" position: fixed; top: 0; width: 100%; z-index: 99; background-color: #212121;">
		<div
			style="width: 50%; margin: auto; height: fit-content; display: flex; justify-content: space-between; align-items: center; padding: 10px;">
			<a href="/"
				style="text-decoration: none; color: white; text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff;"><h1>FESTLOOK</h1></a>
			<div style="display: flex; gap: 50px">
				<b><a href="/" style="text-decoration: none; color: white;">Newsfeed</a></b>
				<b><a href="/marketplace" style="text-decoration: none; color: white;">Marketplace</a></b>
			</div>
			<div class="btn-group">
				<c:choose>
					<c:when test="${user_id != null }">
						<button class="btn btn-outline-primary" style="border: 2px solid #f2f2f2;"><a href="/profile/view/${user_id}" style="text-decoration: none; color: #f2f2f2;">My Profile</a></button>
						<button class="btn btn-outline-primary" style="background-color: #f2f2f2; border: 2px solid #f2f2f2;"><a href="/user/logout" style="text-decoration: none; color: #212121;">Sign out</a></button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-outline-primary" style="border: 2px solid #f2f2f2;"><a href="/user/login" style="text-decoration: none; color: #f2f2f2;">Sign In</a></button>
						<button  class="btn btn-outline-primary" style="background-color: #f2f2f2; border: 2px solid #f2f2f2;"><a href="/user/join" style="text-decoration: none; color: #212121;">Join</a></button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	
	<div
		style="width: 30%; padding: 30px; margin: auto; margin-top: 220px; border-radius:20px; ">
		<form:form action="/user/login" method="post"
			modelAttribute="loginUser">
			<h1 style="color: white; text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 21px #fff;">Login</h1>
			<p>
				<form:errors path="email" />
			</p>
			<p>
				<form:errors path="password" />
			</p>
			<p>
				<form:input path="email" type="email" style="width: 70%;opacity:0.7;border-radius: 20px;padding:10px" placeholder="Email"/>
			</p>

			<p>
				<form:input path="password" type="password" style="width: 70%; opacity:0.7; border-radius: 20px;padding:10px" placeholder="Password"/>
			</p>
			
			<a href="#" style="color: white; text-decoration: none;">Forgot password?</a>
			<div style="display: flex; justify-content: space-between;">
				<input type="submit" value="Log In" class="btn" style="color: white; border: 2px solid white; margin-top: 10px;">
			</div>
		</form:form>
	</div>
</body>
</html>