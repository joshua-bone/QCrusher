<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quiz Score</title>
</head>
<body>
<div class="container-fluid">
<%@include file="/WEB-INF/common/head.inc"%>
<div class="jumbotron">
	<h2>Quiz Complete!</h2>
</div>
<h2>Your score for ${quiz.name}:</h3>

<c:forEach var = "attemptq" items = "${answeredQuestions}">
	<c:choose>
		<c:when test="${attemptq.passFail}">
		 <div class="alert alert-success">
		</c:when>
		<c:otherwise>
		 <div class="alert alert-danger">
		</c:otherwise>
	</c:choose>
    ${attemptq.questionObject.question} <br>
	Desired Answer: ${attemptq.questionObject.answer}<br>
	Answered Correctly: ${attemptq.passFail}</div>
</c:forEach>

<h3>Percent Correct: ${percentCorrect}</h3>
<hr>
<form action = "rateQuiz">
<h3>How would you rate this quiz?<select name="quizRating">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
					</select></h3>
				<h3>Any feedback for the quiz writer?</h3>
				<input type="text" name="feedbackText" />
				<input type="hidden" name="quizNumber" value="${quiz.id}"/>
				<input type = "hidden" name = "username" value = "${principal.username}"/>
				<input type="submit" class="btn btn-primary" value="Submit" />

</form>

</div>
</body>
</html>