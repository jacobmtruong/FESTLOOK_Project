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
/*  * {
	outline: 1px solid black;
}  */
</style>
<meta charset="UFT-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<title>Edit Profile Info</title>
</head>
<body style="background-image: url('/images/editProfile.jpg'); background-size: cover;">
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

	<div style="width: 50%; margin: auto;">
		<div style="width: 60%; padding: 30px; margin-top: 200px; background-color: rgb(242,242,242,0.7); border-radius: 20px;">
			<form:form action="/edit/profile/${thisUser.id}" method="post"
				modelAttribute="thisUser">
				<h1
					style="margin-bottom: 20px; color: #212121; text-shadow: 0 0 10px #fff;">Edit
					your Profile</h1>

				<input type="hidden" name="_method" value="put">
				<p>
					<form:errors path="firstName" />
				</p>
				<p>
					<form:errors path="lastName" />
				</p>
				<p>
					<form:errors path="city" />
				</p>
				<p>
					<form:errors path="country" />
				</p>
				<p>
					<form:errors path="bio" />
				</p>
				<p>
					<form:errors path="photo" />
				</p>
				<p>
					
					<form:input path="firstName" type="text"
						style="width: 70%;opacity:0.7;padding:10px; border-radius: 10px"
						placeholder="First Name" />
						<form:label path="firstName">First Name</form:label>
				</p>
				<p>
					
					<form:input path="lastName" type="text"
						style="width: 70%;opacity:0.7;padding:10px;border-radius: 10px"
						placeholder="Last Name" />
						<form:label path="lastName">Last Name</form:label>
				</p>

				<p>
					
					<form:input path="city" type="text"
						style="width: 70%;opacity:0.7;padding:10px;border-radius: 10px" placeholder="City" />
						<form:label path="city">City</form:label>
				</p>
				<p>
					
					<form:input path="country" type="text"
						style="width: 70%;opacity:0.7;padding:10px;border-radius: 10px" placeholder="Country" />
						<form:label path="country">Country</form:label>
				</p>
				<p>
					
					<form:textarea path="bio" type="text"
						style="width: 70%;opacity:0.7;padding:10px;border-radius: 10px"
						placeholder="About you ..." />
						<form:label path="Bio">Bio</form:label>
				</p>
				<div style="display: flex; gap: 50px; align-items: center;">
					<div>
						<p>
							<form:label path="photo">SET A NEW PROFILE PICTURE:</form:label>
							<form:input path="photo" type="text"
								style="width: 100%;opacity:0.7;padding:10px;border-radius: 10px"
								placeholder="Profile picture (URL)" />
						</p>
					</div>
					<img src="${thisUser.photo}" alt="user-profile"
						style="max-width: 200px; height: 200px; border-radius: 50%; object-fit: cover;" />
				</div>
				<div
					style="display: flex; gap: 20px; align-items: center; margin-top: 40px;">
					<input type="submit" value="Save Changes" class="btn"
						style="color: black; border: 3px solid black;">
					<a href="/profile/view/${user_id}"
						style="text-decoration: none; color: black;"><b>Cancel</b></a>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>