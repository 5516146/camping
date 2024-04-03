<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<h2>
		<c:out value="${error}" />
	</h2>
	<h2>
		<c:out value="${logout}" />
	</h2>
	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h6 class="mb-0 pb-3">
							<span>LOGIN</span>
						</h6>
						<input class="checkbox" type="checkbox" id="reg-log"
							name="reg-log" /> <label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
							
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<h3 class="mb-4 pb-3">아이디 찾기</h3>
											<div class="panel-body">
											<div id="findId-form">
												<form role="form" method='post' action="/member/findId">
													<!-- 3. post 메서드를 통해서 /login URI로 폼 데이터 전달(아이디, 비밀번호(토큰) 전달) -> security-context.xml로 넘어감 -->
													<div class="form-group">
														<input type="text" name="mem_name" class="form-style"
															id="myName" autocomplete="off" required="required"
															placeholder="이름"> <i
															class="input-icon uil uil-at"></i>
													</div>
													<div class="form-group">
														<input type="text" name="mem_tel" class="form-style"
															id="myTel" autocomplete="off" required="required"
															placeholder="전화번호"> <i
															class="input-icon uil uil-at"></i>
													</div>
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<button type="submit"
														class="btn btn-lg btn-success btn-block">검색</button>
												</form>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	Bootstrap Core JavaScript
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	Metis Menu Plugin JavaScript
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	Custom Theme JavaScript
	<script src="/resources/dist/js/sb-admin-2.js"></script>

	<!-- <script src="css/styles.css"></script> -->
	<script>
		$(".btn-success").on(
				"click",
				function(e) {
					e.preventDefault();

					if ($("#myName").val() === null
							|| $("#myName").val() === "") {
						// 빈칸이 있는 상태로 submit을 눌렀을 때
						alert("이름을 입력하세요.");
					} else {
						$("form").submit();
					}
				});
	</script>

	<script>
		$(document).ready(function() {
			$('#myModal').modal('show');
			/* backdrop: 'static', //배경 클릭해도 모달 안 닫히도록 해놓음
			keyboard: false //esc 키로 모달 안 닫히도록 해놓음 */
		});
	</script>
	
	
	<c:if test="${param.logout != null}">
		<script>
			$(document).ready(function() {
				alert("로그아웃하였습니다.");
			});
		</script>
	</c:if>
	
	<script>
		var myId = '<c:out value="${myId}"/>'
		
	</script>
</section>

<%@include file="includes/footer.jsp"%>
