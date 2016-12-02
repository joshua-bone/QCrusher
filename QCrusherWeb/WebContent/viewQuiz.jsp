<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Quiz</title>
</head>
<body>
	<%@include file="/WEB-INF/common/head.inc"%>
	<h3>${quiz.name}by ${quiz.user.username}</h3>
	<hr>
	<ul>
		<li>Created on ${quiz.createDate	}</li>
		<li>Contains ${fn:length(quiz.questionObjects)} questions</li>
		<li>Attempted ${fn:length(quiz.attempts)} times</li>
		<li>Average Score: <fmt:formatNumber type="number"
				maxFractionDigits="1" value="${quiz.averageScore}" /></li>
		<li>High Score: <fmt:formatNumber type="number"
				maxFractionDigits="1" value="${quiz.highScore}" />% by
			${quiz.highScoringAttempt.user.username} on
			${quiz.highScoringAttempt.dateTime }
		</li>
	</ul>

	<form action="takeQuiz">
	
		<sec:authorize access="isAnonymous()">
			<input type="hidden" name="username" value="Anonymous" />
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="username" value="${principal.username}" />
		</sec:authorize>
		
		<input type="hidden" name="quizNumber" value="${quiz.id}" /> 
		<input type="submit" value="Take Quiz" />
	</form>

	<c:if test="${not empty allowedToViewQuestions}">
		<h3>You ${createdOrAttempted} this quiz.</h3>
		<h6>Questions:</h6>
		<ol>
			<c:forEach var="question" items="${quiz.questionObjects}">
				<li>Q: ${question.question} A: ${question.answer}</li>
			</c:forEach>
		</ol>
	</c:if>

</body>
</html>