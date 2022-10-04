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
<style>
/* * {
	outline: 1px solid black;
} */
</style>
<title>View Look</title>
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


	<div
		style="display: flex; width: 50%; margin: auto; height: fit-content; margin-top: 120px; margin-bottom: 50px; padding: 20px; justify-content: space-between; gap: 30px;">
		<div
			style="width: 70%; display: flex; flex-direction: column; gap: 20px; background-color: white; border-radius: 20px; padding: 30px;">
			<div
				style="display: flex; align-items: center; justify-content: space-between;">

				<div style="display: flex; gap: 20px;">
					<c:choose>
						<c:when test="${look.poster.userinfos.photo != null}">
							<a href="/profile/view/${look.poster.id}"><img
								src="${look.poster.userinfos.photo}" alt="user-profile"
								style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;" /></a>
						</c:when>
						<c:otherwise>
							<a href="/profile/view/${look.poster.id}"><img
								src="/images/user-icon.png" alt="user-profile"
								style="max-width: 50px; height: 50px; border-radius: 50%" /></a>
						</c:otherwise>
					</c:choose>

					<div style="display: flex; flex-direction: column;">
						<p style="margin: 0; font-size: 18px;">${look.poster.userinfos.firstName}
							${look.poster.userinfos.lastName} @${look.poster.username}</p>
						<p style="margin: 0; font-size: 12px;">
							at ${look.location} .
							<fmt:formatDate value="${look.poster.createdAt}"
								pattern="dd/MM/yyyy" />
						</p>
					</div>

				</div>

				<c:if test="${user_id == look.poster.id }">
					<div>
						<a href="/add/item/look/${look.id}" class="btn"
							style="background-color: black; color: white; border: 2px solid white; margin-top: 10px;">List
							an Item</a>
					</div>
				</c:if>
			</div>



			<div>
				<h3 style="margin: 0;">${look.title }</h3>
				<p style="margin: 0;">${look.description }</p>
			</div>

			<div>
				<a href="/look/view/${look.id}"><img src="${look.image}"
					alt="look-image" style="max-width: 600px; max-height: 600px; object-fit:cover; border-radius: 20px;" /></a>
			</div>
			<div style="display: flex; justify-content: space-between;">
				<div style="display: flex; gap: 10px; align-items: center">
					<a href="/"><img src="/images/instagram.png"
						alt="instagram-icon" style="width: 30px; height: 30px" /></a> <a
						href="/"><img src="/images/facebook.png" alt="facebook-icon"
						style="width: 30px; height: 30px" /></a>
				</div>
				<div></div>
			</div>
		</div>


		<!-- ============== RECENT LOOKS ============= -->

		<div style="display: flex; gap: 30px; flex-direction: column;">
			<c:if test="${itemsByLook.size() != 0 }">
			<div
				style="background-color: white; padding: 30px; border-radius: 20px; height: fit-content;">

				<c:forEach items="${itemsByLook }" var="item">

					<h4>Available item</h4>
					<div
						style="border: 3px solid black; padding: 30px; border-radius: 20px;">
						<img src="${item.image }" alt="item"
							style="width: 250px; height: 250px; margin-bottom: 20px; object-fit: cover;" />
						<p style="margin: 0;">${item.name }</p>
						<h5 style="margin: 0;">$${item.price }</h5>
						<p style="margin: 0;">Condition: ${item.description }</p>

						<form:form action="/add/cart/${item.id}" method="get"
							modelAttribute="cart">
							<button class="btn" value="Add to Cart"
								style="background-color: black; color: white; border: 2px solid white; margin-top: 10px; width: 100%;">Add
								to Cart</button>
						</form:form>

					</div>
				</c:forEach>
			</div>
			</c:if>
			
			<c:if test="${looksByPoster.size() != 0 }">
				<div
					style="background-color: white; padding: 20px; border-radius: 20px;">
					<p style="font-size: 20px">
						Recent looks by <b>${look.poster.userinfos.firstName}
							${look.poster.userinfos.lastName}</b>
					</p>
					<div style="display: flex; gap: 20px;">
						<c:forEach items="${looksByPoster }" var="look">

							<a href="/look/view/${look.id}"><img src="${look.image }"
								alt="poster-looks"
								style="width: 150px; height: 150px; border-radius: 20px; object-fit: cover;" /></a>

						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>

		<!-- ============================================== -->



	</div>

	<div style="margin: auto; width: 50%; padding-left: 20px;">

		<!--          All the comments of this LOOK         -->
		<div style="width: 50%;">
			<c:forEach items="${thisLookComments}" var="comment">

				<div style="display: flex; justify-content: space-between;">
					<div style="display: flex; gap: 20px; margin-bottom: 20px;">


						<a href="#"><img src="${comment.commentUser.userinfos.photo }"
							alt="comment-user-profile-photo"
							style="width: 60px; height: 60px; border-radius: 50%; object-fit: cover;" /></a>


						<div>
							<h6 style="margin: 0;">${comment.commentUser.userinfos.firstName }
								${comment.commentUser.userinfos.lastName } <a href="/">@${comment.commentUser.username }</a>
							</h6>
							<p style="margin: 0;">${comment.comment}</p>
							<p style="margin: 0; font-size: 12px; color: grey;">
								posted on
								<fmt:formatDate value="${comment.createdAt}"
									pattern="dd/MM/yyyy" />
							</p>
						</div>

					</div>

					<div>
						<c:if test="${user_id == comment.commentUser.id }">
							<a href="/comment/delete/${comment.id }"><img
								src="/images/delete.png" alt="delete-icon"
								style="width: 20px; height: 20px; float: right;" /></a>
						</c:if>
					</div>
				</div>
			</c:forEach>

		</div>


		<!-- 	COMMENT INPUT  -->

		<div style="width: 50%; margin-top: 10px; margin-bottom: 20px;">
			<form:form action="/comment/post/${look.id}" method="post"
				modelAttribute="comment">
				<p>
					<form:errors path="comment" />
				</p>
				<p>
					<form:label path="comment"></form:label>
					<form:textarea path="comment" type="text"
						placeholder="Post a comment ..."
						style="width: 100%; border-radius:10px; padding:16px;" />
				</p>
				<div style="display: flex; justify-content: space-between;">
					<input type="submit" value="Post Comment" class="btn btn-secondary">
				</div>
			</form:form>
		</div>
	</div>


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