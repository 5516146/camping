<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>
<h2>비밀번호 확인</h2>
<form role="form" action="/member/checkPassword" method="post">
<input type="password" name="password" class="checkingPassword" autocomplete="off" />
<button type="submit" class="btn btn-checkingPasswordInput btn-block">확인</button>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<p><c:out value="${result}" /></p>
<p><%= request.getAttribute("success") %></p>
<!-- Modal  추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">회원정보 수정 완료</h4>
					</div>
					<div class="modal-body">
						<p>회원탈퇴가 성공적으로 완료되었습니다.
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
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#myModalLabel').on("click", function(){
			var result = '<c:out value="${result}" />'
				
			if(result != null){
				alert("회원탈퇴가 성공적으로 완료되었습니다.")
			}	
		})
		
	});
</script>
	
</section>

<%@include file="../includes/footer.jsp"%>
