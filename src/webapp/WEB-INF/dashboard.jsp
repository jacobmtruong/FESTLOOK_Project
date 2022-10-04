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
<style>
/* 	 * {
	outline: 1px solid black;
}  */
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<title>FESTLOOK</title>
</head>
<body style="background-color: #f2f2f2;">

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


	<!--  =========== BANNER =========== -->
	<a href="/look/new" style="text-decoration: none; color: white;">
		<div
			style="width: 50%; margin: auto; margin-top: 100px; background-image: url('/images/background1.jpg'); border-radius: 20px; background-position: 70% 30%;">
			<h1 style="padding: 40px; text-align: center;">Share your style.
				Stay inspired.</h1>
		</div>
	</a>
	<!-- =====================================		 -->



	<c:forEach items="${allLooks }" var="look">
		<div
			style="display: flex; width: 50%; margin: auto; height: fit-content; margin-top: 30px; margin-bottom: 50px; border-radius: 20px; padding: 30px; background-color: white; justify-content: space-between;">
			<div
				style="width: 65%; display: flex; flex-direction: column; gap: 20px;">
				<div
					style="display: flex; align-items: center; justify-content: space-between;">

					<div style="display: flex; gap: 20px;">
						<c:choose>
							<c:when test="${look.poster.userinfos.photo != null}">
								<a href="/profile/view/${look.poster.id}"><img
									src="${look.poster.userinfos.photo}" alt="user-profile"
									style="max-width: 50px; height: 50px; border-radius: 50%;object-fit:cover;" /></a>
							</c:when>
							<c:otherwise>
								<a href="#"><img src="/images/user-icon.png"
									alt="user-profile"
									style="max-width: 50px; height: 50px; border-radius: 50%" /></a>
							</c:otherwise>
						</c:choose>

						<div style="display: flex; flex-direction: column;">
							<p style="margin: 0; font-size: 18px;">${look.poster.userinfos.firstName}
								${look.poster.userinfos.lastName} @${look.poster.username}</p>
							<p style="margin: 0; font-size: 12px;">
								${look.location} .
								<fmt:formatDate value="${look.poster.createdAt}"
									pattern="dd/MM/yyyy" />
							</p>
						</div>
					</div>


					<div
						style="display: flex; align-items: center; gap: 10px; justify-content: center; height: 100%'">
						<p style="margin: 0;">${look.getUserLiked().size() }</p>
						<c:choose>
							<c:when test="${look.getUserLiked().contains(sessionUser) }">
								<form action="/look/unlike/${look.id }" method="post">
									<input type="image" src="/images/liked.png" alt="liked-icon"
										style="width: 20px; height: 20px; display: flex;" />

								</form>

							</c:when>
							<c:otherwise>
								<form action="/look/like/${look.id }" method="post">
									<input type="image" src="/images/like.png" alt="like-icon"
										style="width: 20px; height: 20px; display: flex;" />
								</form>

							</c:otherwise>
						</c:choose>
					</div>
				</div>



				<div>
					<h3 style="margin: 0;">${look.title }</h3>
					<p style="margin: 0;">${look.description }</p>
				</div>

				<div>
					<a href="/look/view/${look.id}"><img src="${look.image}"
						alt="look-image"
						style="max-width: 500px; max-height: 500px; border-radius: 20px;" /></a>
				</div>
				<div style="display: flex; justify-content: space-between;">
					<div class="btn-group" role="group" style="width: 70%">
						<a href="/look/view/${look.id}" class="btn btn-secondary">Comment</a>
						<a href="/" class="btn btn-light">Get the Look</a>
					</div>
					<div style="display: flex; gap: 10px; align-items: center">
						<a href="/"><img src="/images/instagram.png"
							alt="instagram-icon" style="width: 30px; height: 30px" /></a> <a
							href="/"><img src="/images/facebook.png" alt="facebook-icon"
							style="width: 30px; height: 30px" /></a>
					</div>
				</div>
			</div>

			<div>
				<c:forEach items="${allItems }" var="item">
					<c:if test="${item.look.id == look.id }">
						<h4>Available item</h4>
						<div
							style="border: 3px solid black; padding: 30px; border-radius: 20px;">
							<a href="/item/view/${item.id}"><img src="${item.image }" alt="item"
								style="width: 250px; height: 250px; margin-bottom: 20px; object-fit:cover;" /></a>
							<p style="margin: 0;">${item.name }</p>
							<h5 style="margin: 0;">$${item.price }</h5>
							<p style="margin: 0;">Condition: ${item.description }</p>
							
							<form:form action = "/add/cart/${item.id}" method="get" modelAttribute="cart">
							<button class="btn" value="Add to Cart"
								style="background-color: black; color: white; border: 2px solid white; margin-top: 10px; width: 100%;">Add
								to Cart</button>
							</form:form>
								
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</c:forEach>


	<hr />
	<div
		style="width: 60%; margin: auto; display: flex; justify-content: space-between;">
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