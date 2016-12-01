<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authentication var="principal" property="principal" />
<!-- A variable to get the "principal" (logged in user) onto the page with JSTL -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<%@include file="/WEB-INF/common/head.inc"%>
	<p1>QCrusher</p1><br>
	<p3><em>Go Quiz Yourself</em></p3>
	
	<form action = "viewQuiz">
	<sec:authorize access="isAnonymous()">
		<input type = "hidden" name = "username" value = "Anonymous"/>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<input type = "hidden" name = "username" value = "${principal.username}"/>
	</sec:authorize>
		Select Quiz: 
		<select name="quizID">
			<c:forEach var = "quiz" items = "${quizzes}">
				<option value="${quiz.id}"> ${quiz.name} by ${quiz.user.username} </option>
			</c:forEach>
		</select> <input type = "submit" value = "Select">
	</form>
	
	<sec:authorize access="isAnonymous()">
	<h6><a href = "signup">Create an Account</a></h6>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<h6><a href = "createQuiz">Create a Quiz</a></h6>
	</sec:authorize>
</body>
</html>