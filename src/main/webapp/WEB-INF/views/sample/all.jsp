<%@page import="org.springframework.security.core.Authentication"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%-- <%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String name = "";
	if(principal != null) {
		name = auth.getName();
	}
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional/
/EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>all.jsp</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" href="/resources/css/styles.css" type="text/css">
</head>
<body>
	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>


	<h1>/sample/all page: 메인 페이지로 대체 예정</h1>

	<sec:authorize access="isAnonymous()">
		<!-- isAnonymous(): 익명의 사용자(로그인 하지 않은 경우) -->
		<a href="/member/customLogin">로그인</a>
		<a href="/member/join">회원가입</a>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="pinfo"/>
		<div>${ pinfo }</div>
		<!-- isAuthenticated(): 인증된 사용자 -->
		<!-- <a href="/customLogout">로그아웃</a> -->
		<div class="panel-body">
			<form role="form" method='post' action="/customLogout">
				<!-- logout-url을 form 태그의 action에 설정함 -->
				<fieldset>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<!-- Change this to a button or input when using this as a form -->
					<button type="submit" class="btn btn-lg btn-success btn-block">Logout</button>
				</fieldset>
			</form>
			<!-- 마이페이지로 가는 길 -->
			<button type="button" class="btn btn-mp btn-myPage btn-block"
			onclick="window.location.href='/member/myInfo'"
			>My Page</button>

		</div>

		<!-- Modal  추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">로그인 완료</h4>
					</div>
					<div class="modal-body">
						<p>로그인이 완료되었습니다.
						<p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<!-- <button type="button" class="btn btn-primary">Save
								changes</button> -->
					</div>
				</div>
				<!-- modal-content -->
			</div>
			<!-- modal-dialog -->
		</div>
		<!-- /.modal -->
		
		<!-- Modal  추가 -->
		<div class="modal fade" id="modiModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">회원정보 수정 완료</h4>
					</div>
					<div class="modal-body">
						<p>회원정보 수정이 완료되었습니다.
						<p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-close" data-dismiss="modal">Close</button>
						<!-- <button type="button" class="btn btn-primary">Save
								changes</button> -->
					</div>
				</div>
				<!-- modal-content -->
			</div>
			<!-- modal-dialog -->
		</div>
		<!-- /.modal -->
		
		
		<%
		String chk = request.getParameter("chk");
		%>
		<script type="text/javascript">
			$(document).ready(function() {
				var chk = '<%=chk%>';
				if (chk !== '') {
					
					$("#myModal").modal("show");
					
					$("#myModal").on("hidden.bs.modal", function() {
			            $(this).remove();
			        });
				}
			});
			
			$(document).ready(function(){
				var result = '<c:out value="${result}"/>';
				
				checkModal(result);
				
				function checkModal(result){
					if(result === ''){
						return;
					}
					$("#modiModal").modal("show");
				}
			
			});
		</script>
	</sec:authorize>

	</div>
	<!--  end panel-body -->
	</div>
	<!-- end panel -->
	</div>
	</div>
	<!-- /.row -->


	<%-- <% String chk = request.getParameter("chk"); %>

<script type="text/javascript">
	$(document).ready( /* 문서 준비 시 작동하는 코드 */function() {
						
						var chk = '<%= chk %>'; 
						
						//register()에서 addFlashAttribute()를 사용했기 때문에 처음 쓰는 거면 숫자가 지정되지만 아니라면 빈 상태로 나옴

						checkModal(chk);	
						
						//페이지를 새로고침하지 않고 url만 변경하고 싶을 때 사용
						history.replaceState({}, null, null); //세션 히스토리에 새로운 항목을 추가하는 대신 현재 상태를 변경함
						//여기서는 두 세 번째 인수가 모두 null이기 때문에 url이 변경되지 않음

						function checkModal(chk) {

							if (chk === '' || history.state) { //result 값이 비었을 때 또는 history.state가 있을 때
								//history의 state 요소 확인 -> 현재 문서의 상태를 나타냄, 이 속성이 존재하면 참
								return; //프로그램 종료
							}

							/* if (parseInt(mem_id) > 0) { //result 값이 0보다 크면
								$(".modal-body").html(
										"안녕하세요" + mem_id + "님. 별빛누리캠핑장 사이트입니다.");
							} */

							$("#myModal").modal("show");
						}
						
	});
	</script> --%>

</body>
</html>