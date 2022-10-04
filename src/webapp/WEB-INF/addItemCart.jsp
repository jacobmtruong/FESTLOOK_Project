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
/*  	 * {
	outline: 1px solid black;
}   */
</style>
<meta charset="UFT-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<title>List an Item</title>
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
				<b><a href="#" style="text-decoration: none; color: white;">Newsfeed</a></b>
				<b><a href="#" style="text-decoration: none; color: white;">Marketplace</a></b>
			</div>
			<div style="display: flex; gap: 10px;">
				<c:choose>
					<c:when test="${user_id != null }">
						<a href="/profile/view/${user_id}" class="btn"
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
		style="display: flex; margin: auto; margin-top: 200px; width: 60%; justify-content: space-around; padding: 30px; border-radius: 20px;">
		<div
			style="width: 40%; padding: 30px; border-radius: 20px; background-color: white;">
			<form:form action="/add/item/${thisLook.id}" method="post"
				modelAttribute="item">
				<h3 style="color: #212121; text-shadow: 0 0 10px #fff;">List an
					Item</h3>
				<p>
					from ${thisLook.location} .
					<fmt:formatDate value="${thisLook.createdAt}" pattern="dd/MM/yyyy" />
				</p>
				<p>
					<form:errors path="name" />
				</p>
				<p>
					<form:errors path="size" />
				</p>
				<p>
					<form:errors path="brand" />
				</p>
				<p>
					<form:errors path="price" />
				</p>
				<p>
					<form:errors path="description" />
				</p>
				<p>
					<form:errors path="image" />
				</p>


				<p>
					<form:input path="name" type="text"
						style="width: 70%;opacity:0.7;padding:10px;border-radius:10px"
						placeholder="Item's Name" />
				</p>
				<p>

					<form:input path="size" type="text"
						style="width: 70%;opacity:0.7;padding:10px;border-radius:10px" placeholder="Size" />
				</p>
				<p>

					<form:input path="brand" type="text"
						style="width: 70%;opacity:0.7;padding:10px;border-radius:10px" placeholder="Brand" />
				</p>
				<p>
					<form:select path="description" style="width: 70%;opacity:0.7;padding:10px;border-radius:10px">
						<form:option value="none" label="Condition" />
						<form:option value = "New" label = "New"/>
						<form:option value = "Like New" label = "Like New"/>
						<form:option value = "Good" label = "Good"/>
						<form:option value = "Fair" label = "Fair"/>
						<form:option value = "Poor" label = "Poor"/>
					</form:select>
				</p>
				<p>

					<form:input path="price" type="text"
						style="width: 70%;opacity:0.7;padding:10px;border-radius:10px"
						placeholder="Price $$" />
				</p>
				<p>

					<form:input path="image" type="text"
						style="width: 70%;opacity:0.7;padding:10px;border-radius:10px"
						placeholder="Item's picture (URL)" />
				</p>
				<div style="display: flex; justify-content: space-between;">
					<input type="submit" value="Submit" class="btn"
						style="background-color: black; color: white; border: 2px solid white; margin-top: 10px;">
				</div>
			</form:form>
		</div>

		<div>
			<img src="${thisLook.image }" alt="look"
				style="max-width: 500px; max-height: 600px; border-radius: 20px;" />
		</div>
	</div>
</body>
</html>
