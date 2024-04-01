<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<div class="container">
		<div class="section-title">
			<h2>테스트페이지</h2>
			
			<!-- 로그인된 유저아이디는 userId로 사용. 인증되지않으면 빈값 -->
			<c:set var="userId" value="" /> <!-- 일단 userId 변수를 빈 값으로 설정 -->
			<sec:authorize access="isAuthenticated()"> <!-- 사용자가 인증된 경우 -->
		    	<sec:authentication var="userIdDetails" property="principal"/>
		    	<c:set var="userId" value="${userIdDetails.username}" /> <!-- userId 변수에 사용자 이름 할당 -->
			</sec:authorize>
			
			<p>로그인 한 계정 ID : ${userId}</p>
		</div>
	</div>

	







</section>

<%@include file="includes/footer.jsp"%>
