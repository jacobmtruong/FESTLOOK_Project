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
<style>
/*    *{
outline: 1px solid black;
}     */
</style>
<meta charset="UFT-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<title>Marketplace</title>
</head>
<body style="background-color: #F2F2F2">
	<!-- 	 ==== NAV BAR ==== -->

	<div
		style="position: fixed; top: 0; width: 100%; z-index: 99; background-color: #212121;">
		<div
			style="width: 50%; margin: auto; height: fit-content; display: flex; justify-content: space-between; align-items: center; padding: 10px;">
			<a href="/marketplace"
				style="text-decoration: none; color: white; text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff;"><h1>FESTLOOK</h1>
				<p style="color: white; margin: 0; font-size: 30px">Marketplace</p></a>

			<a href="/" style="text-decoration: none;"><h5
					style="color: white;">Newsfeed</h5></a>
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
		style="width: 50%; height: 270px; margin: auto; margin-top: 150px; background-image: url('/images/market.jpg'); border-radius: 20px; background-position: 100%;">
		<h1 style="padding-top: 40px; text-align: center; color: #F2F2F2">FESTLOOK
			MARKETPLACE</h1>
		<p
			style="width: 80%; color: #F2F2F2; font-size: 20px; text-align: center; margin: auto;">
			Home to the best up-and-coming independent brands and vintage
			boutiques from around the world
			</p2>
		<div
			style="margin: auto; width: 73%; display: flex; gap: 20px; margin-top: 50px; flex-direction: columm;">
			<a href="#" class="btn"
				style="border: 3px solid #f2f2f2; color: white;">Shop Men</a> <a
				href="#" class="btn"
				style="border: 3px solid #f2f2f2; color: white;">Shop Woman</a>
		</div>
	</div>

	<div
		style="width: 50%; margin: auto; display: flex; gap: 30px; justify-content: center; margin-top: 30px; justify-content: right;">
		<a href="#" style="text-decoration: none; color: #212121"><b>NEW
				IN</b></a> <a href="#" style="text-decoration: none; color: #212121"><b>CLOTHING</b></a>
		<a href="#" style="text-decoration: none; color: #212121"><b>ACCESSORIES</b></a>
		<a href="#" style="text-decoration: none; color: #212121"><b>SHOES</b></a>


	</div>

	<div
		style="display: flex; flex-wrap: wrap; margin: auto; width: 50%; margin-top: 30px; margin-bottom: 100px; flex-direction: row; justify-content: space-around; gap: 10px;">
		<c:forEach items="${allItems}" var="item">
			<div
				style="border: 3px solid black; padding: 20px; border-radius: 20px;">
				<a href="/item/view/${item.id}"><img src="${item.image }" alt="item"
					style="width: 250px; height: 250px; margin-bottom: 20px; object-fit: cover;" /></a>
				<p style="margin: 0;">${item.name }</p>
				<h5 style="margin: 0;">$${item.price }</h5>
				<p style="margin: 0;">Size: ${item.size }</p>
				<p style="margin: 0;">Brand: ${item.brand }</p>
				<p style="margin: 0;">Condition: ${item.description }</p>

				<div
					style="margin-top: 20px; display: flex; gap: 10px; align-items: center;">
					<a href="/profile/view/${item.user.id }"><img
						src="${item.user.userinfos.photo}" alt="user-profile"
						style="max-width: 50px; height: 50px; border-radius: 50%; object-fit: cover;" /></a>
					<a href="/profile/view/${item.user.id }"
						style="text-decoration: none; color: black;">@${item.user.username }</a>
				</div>

				<a href="/profile/view/${item.user.id }" class="btn"
					style="background-color: black; color: white; border: 2px solid white; margin-top: 10px; width: 100%;">Add
					to Cart</a>
			</div>
		</c:forEach>
	</div>

	<hr/>
	<div
		style="width: 60%; margin: auto; display: flex; justify-content: space-between;margin: ">
		<p>© 2022 FESTLOOK. All rights reserved.</p>
		<div style="display: flex; gap: 8px;">
			<b><a href="#" style="text-decoration: none; color: black;">help</a></b>
			<b><a href="#" style="text-decoration: none; color: black;">widgets</a></b>
			<b><a href="#" style="text-decoration: none; color: black;">advertise</a></b>
			<b><a href="#" style="text-decoration: none; color: black;">legal</a></b>
		</div>
	</div>


</body>
</html>