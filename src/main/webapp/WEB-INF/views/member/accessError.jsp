<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<div class="container">
		<div class="section-title">
			<h2>My & Family</h2>
			<p>Magnam dolores commodi suscipit. Necessitatibus eius
				consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit.
				Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit
				alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
		</div>
	</div>
	<h1>Access Denied Page</h1>


<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h2> <!-- SPRING_SECURITY_403_EXCEPTION라는 이름으로 Access DeniedException 객체 전달 -->

<h2><c:out value="${msg}"/></h2> <!-- 모델 영역에 담긴 CommonController의 msg -->

	
</section>

<%@include file="../includes/footer.jsp"%>
