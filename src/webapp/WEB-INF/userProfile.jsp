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
/*   * {
	outline: 1px solid black;
   } */
</style>
<meta charset="UFT-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<title>User Profile</title>
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



	<div style="width: 50%; margin: auto; margin-top: 120px;">

		<div style="display: flex; gap: 20px; align-items: center;">
			
			
			<img src="${thisUser.userinfos.photo }" alt="user-profile-photo"
				style="width: 200px; height:200px; border-radius: 20px; object-fit: cover;" />
			

			<div>
				<h3>${thisUser.userinfos.firstName}
					${thisUser.userinfos.lastName}</h3>
				<p>from ${thisUser.userinfos.city },
					${thisUser.userinfos.country }</p>

				<c:choose>
					<c:when test="${user_id == thisUser.id }">
						<a href="/edit/profile/${thisUser.userinfos.id}" class="btn btn-secondary">Edit Profile</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="btn btn-secondary">Message</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div
			style="margin-top: 30px; display: flex; justify-content: space-between;">
			<div
				style="background-color: white; border-radius: 20px; padding: 30px; width: 60%">
				<h4 style="margin-bottom: 20px;">Most recent looks</h4>
				<div style="display: flex; flex-wrap: wrap; gap: 10px;">
					<c:forEach items="${looksByUser }" var="look">
						<a href="/look/view/${look.id}"><img src="${look.image }"
							alt="user-post"
							style="width: 200px; height: 200px; border-radius: 20px; object-fit: cover;"/></a>
					</c:forEach>
				</div>
				
				
				
				<h4 style="margin: 20px 0 20px 0;">Listed Items</h4>
				<div style="display: flex; flex-wrap: wrap; gap: 10px;">
					<c:forEach items="${itemsByUser }" var="item">
						<a href="/item/view/${item.id}"><img src="${item.image }"
							alt="user-post"
							style="width: 200px; height: 200px; border-radius: 20px; object-fit: cover;"/></a>
					</c:forEach>
				</div>
				

			</div>


			<div
				style="width: 35%; display: flex; flex-direction: column; gap: 10px;">
				<div
					style="background-color: white; border-radius: 20px; padding: 30px;">
					<h4>About Me</h4>
					<p>${thisUser.userinfos.bio}</p>
				</div>
				<div
					style="background-color: white; border-radius: 20px; padding: 30px;">
					<h4>Contact</h4>
					<p style="margin: 0;">
						EMAIL: <a href="">${thisUser.email}</a>
					</p>
					<p style="margin: 0;">
						INSTAGRAM: <a href="">instagram.com/thisusernameig</a>
					</p>
					<p style="margin: 0;">
						BLOG: <a href="">thisuserblog.me/</a>
					</p>
				</div>

				<div
					style="background-color: white; border-radius: 20px; padding: 30px;">
					<h4 style="margin-bottom: 20px;">Most recent liked</h4>
					<div style="display: flex; gap: 10px; flex-wrap: wrap;">
						<c:forEach items="${looksLikedByUser }" var="lookliked">
							<a href="/look/view/${lookliked.id}"><img
								src="${lookliked.image }" alt="user-liked-post"
								style="max-width: 100px; max-height: 100px; border-radius: 20px;" /></a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>