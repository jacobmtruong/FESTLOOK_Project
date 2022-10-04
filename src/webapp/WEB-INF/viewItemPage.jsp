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
/* * {
	outline: 1px solid black;
} */
</style>
<meta charset="UFT-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<title>View Item</title>
</head>
<body style="background-color: #f2f2f2;">
	<!-- 	 ==== NAV BAR ==== -->

	<div
		style="position: fixed; top: 0; width: 100%; z-index: 99; background-color: #212121;">
		<div
			style="width: 50%; margin: auto; height: fit-content; display: flex; justify-content: space-between; align-items: center; padding: 10px;">
			<a href="/"
				style="text-decoration: none; color: white; text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff;"><h1>FESTLOOK</h1></a>
			<div style="display: flex; gap: 50px">
				<b><a href="/" style="text-decoration: none; color: white;">Newsfeed</a></b>
				<b><a href="/marketplace"
					style="text-decoration: none; color: white;">Marketplace</a></b>
			</div>
			<div class="btn-group">
				<c:choose>
					<c:when test="${user_id != null }">
						<button class="btn btn-outline-primary"
							style="border: 2px solid #f2f2f2;">
							<a href="/profile/view/${user_id}"
								style="text-decoration: none; color: #f2f2f2;">My Profile</a>
						</button>
						<button class="btn btn-outline-primary"
							style="background-color: #f2f2f2; border: 2px solid #f2f2f2;">
							<a href="/user/logout"
								style="text-decoration: none; color: #212121;">Sign out</a>
						</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-outline-primary"
							style="border: 2px solid #f2f2f2;">
							<a href="/user/login"
								style="text-decoration: none; color: #f2f2f2;">Sign In</a>
						</button>
						<button class="btn btn-outline-primary"
							style="background-color: #f2f2f2; border: 2px solid #f2f2f2;">
							<a href="/user/join"
								style="text-decoration: none; color: #212121;">Join</a>
						</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>


	<div
		style="width: 50%; padding: 70px; background-color: white; border-radius: 20px; margin: auto; margin-top: 150px;">
		<div style="display: flex; gap: 60px;">
			<img src="${thisItem.image }" alt="item-image"
				style="width: 500px; height: 500px; object-fit: cover; border-radius: 20px;" />

			<div
				style="display: flex; flex-direction: column; gap: 40px; width: 40%">
				<div style="display: flex; gap: 10px;">
					<a href="/profile/view/${thisItem.user.id}"><img
						src="${thisItem.user.userinfos.photo}" alt="user-profile"
						style="width: 70px; height: 70px; border-radius: 50%; object-fit: cover;" /></a>
					<div
						style="display: flex; flex-direction: column; padding-top: 8px;">
						<a href="/profile/view/${thisItem.user.id}"
							style="text-decoration: none; color: black;">${thisItem.user.username}</a>
						<p style="margin: 0;">
							Posted on:
							<fmt:formatDate value="${thisItem.createdAt}"
								pattern="dd/MM/yyyy" />
						</p>
					</div>
				</div>

				<div style="margin-top: 40px;">
					<p style="font-size: 40px; margin: 0">${thisItem.name}</p>
					<h5 style="margin: 0;">${thisItem.brand }</h5>
					<h2 style="margin-top: 30px;">$${thisItem.price }</h2>
				</div>
				<div style="display: flex; flex-direction: column; gap: 10px;">
					<form:form action="/add/cart/${item.id}" method="get"
						modelAttribute="cart">
						<button class="btn" value="Add to Cart"
							style="background-color: black; color: white; border: 2px solid white; margin-top: 10px; width: 70%;">Add
							to Cart</button>
					</form:form>
					<button class="btn" style="border: 2px solid black; width: 70%">Message
						Seller</button>
				</div>
			</div>
		</div>
	</div>
	
	<div
		style="width: 50%; padding: 20px; background-color: white; border-radius: 20px; margin: auto; margin-top: 30px;">
		<h4>Listed Items by
			${thisItem.user.userinfos.firstName }</h4>
		<div style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 20px; ">
			<c:forEach items="${allItemsByThisUser }" var="item">
				<a href="#"><img src="${item.image }" alt="user-post"
					style="width: 100px; height: 100px; border-radius: 20px; object-fit: cover;" /></a>
			</c:forEach>
		</div>
</body>
</html>