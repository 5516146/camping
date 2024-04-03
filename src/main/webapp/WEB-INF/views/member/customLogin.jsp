<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
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
					<div class="title"><span class="yogi">로그인</span></div>
					<div class="center">
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<div class="error-msg">
												<c:if test="${not empty errorMsgName}" >
												<font color="red"> <!-- <p>Your Login attempt was not successful due to <br/> -->
													<p class="yogi yo">${errorMsgName}</p>
												</font>
												</c:if>
											</div>
											
											<div class="panel-body">
											<div id="login-form">
												<form role="form" method='post' action="/login">
													<!-- 3. post 메서드를 통해서 /login URI로 폼 데이터 전달(아이디, 비밀번호(토큰) 전달) -> security-context.xml로 넘어감 -->
													<div class="form-group">
														<input type="text" name="username" class="form-style yogi yo"
															id="logusername" autocomplete="off" required="required"
															placeholder="아이디"> <i
															class="input-icon uil uil-at"></i>
													</div>
													<div class="form-group mt-2">
														<input type="password" name="password" class="form-style yogi yo"
															placeholder="비밀번호" id="logpass" autocomplete="off" required="required">
														<i class="input-icon uil uil-lock-alt"></i>
													</div>
													<div class="remember">
														<label> <input type="checkbox" id="rememberAccount" class="chk-box-remember yogi yo" name="remember-me" > 아이디 저장
														</label>
													</div>
													<!-- <a href="index.html" class="btn btn-lg btn-success btn-block">submit</a> -->
													<%-- <input type="submit"
														class="btn btn-lg btn-success btn-block" value="Submit" />
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" /> --%>
												<!-- </form> -->
												<input type="submit" id="loginButton"
														class="btn btn-lg btn-login btn-block yogi" value="로그인">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												</form>
												</div>
											</div>
											<p class="mb-0 mt-4 text-center">
												<a href="/member/findAccount" class="link findAccount yogi yo">아이디/비밀번호 찾기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
		</div>
	</div>

	<!-- Modal  추가 -->
	<%-- 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">회원가입 완료</h4>
            </div>
            <div class="modal-body">
                <p>회원가입이 완료되었습니다.</p><br />
                <p>로그인 페이지로 이동합니다.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!-- modal-content -->
    </div>
    <!-- modal-dialog -->
</div>
		<!-- /.modal -->
		
		<%
    		String result = request.getParameter("result");
		%>

<script type="text/javascript">
    $(document).ready(function() {
        var result = '<%=result%>';
        
        $(".btn-success").on("click", function(){
        if (result !== '' || result !== null) {
            $("#myModal").modal("show");
            $("#myModal").on("hidden.bs.modal", function() {
                $(this).remove();
            });
        }
        
        });
    });

    // 모달을 보여주는 함수
    function showResultModal(result) {
        if (result !== '') {
            $("#myModal").modal("show");
            $("#myModal").on("hidden.bs.modal", function() {
                $(this).remove();
            });
        }
    }

    // 서버에서 result 값을 받아서 모달을 보여주는 스크립트 호출
    $(document).ready(function(){
        var result = '<c:out value="${result}"/>';
        showResultModal(result);
    });
</script> --%>
	
	
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

					if ($("#logusername").val() === null
							|| $("#logusername").val() === "") {
						// 빈칸이 있는 상태로 submit을 눌렀을 때
						alert("아이디를 입력하세요.");
					} else if($("#logpass").val() === null || $("#logpass").val() === "") {
						alert("비밀번호를 입력하세요.");
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
</section>

<%@include file="../includes/footer.jsp"%>
