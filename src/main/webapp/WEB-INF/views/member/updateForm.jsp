<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- -->
<section id="about" class="about">
	
	<sec:authorize access="isAuthenticated()">
	<!-- 사이드메뉴 -->
	<div class="myPage-sideMenu">
		<div class="myAccount">
			<button type="button" class="btn-sidebar yogi yo" onclick="window.location.href='/member/myAccount'">내 정보</button>
		</div>
		<div class="reservation">
			<button type="button" class="btn-sidebar yogi yo" onclick="window.location.href='/member/myAccount'">예약내역</button>
		</div>
		<div class="payRecord">
			<button type="button" class="btn-sidebar yogi yo" onclick="window.location.href='/member/myAccount'">결제 정보</button>
		</div>
		<div class="myReview">
			<button type="button" class="btn-sidebar yogi yo" onclick="window.location.href='/member/myAccount'">내가 작성한 글</button>
		</div>
	</div>
	
	<!-- 회원정보 수정 -->
	<br>
	<h2 id="modifyInfo-title">회원정보 수정</h2>
	<div class="modify-box">
	<div class="jb-division-line"></div>
	<form role="form" action="/member/updateForm" method="post">
	<input type='hidden' name='mem_id' value='${member.mem_id}' />
	<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}' />
		<div class="form-group">
			<label>아이디</label>
			<div class="form-control" id="modify-group" name='mem_id'>${member.mem_id}</div>
		</div>
		
		<div class="form-group">
			<label>비밀번호</label>
			<input class="form-control" id="modify-group" type="password" name="mem_pw" value='${member.mem_pw}'>
		</div>
		
		<div class="form-group">
			<label>이름</label>
			<input class="form-control" id="modify-group" name='mem_name' value='${member.mem_name}' readonly="readonly" >
		</div>
		<div class="form-group">
			<label>이메일</label>
			<input class="form-control" id="modify-group" type="text" name='mem_email' value='${member.mem_email}'>
		</div>
		<div class="form-group">
			<label>전화번호</label>
			<input class="form-control" id="modify-group" type="text" name='mem_tel' value='${member.mem_tel}'>
		</div>
		<div class="form-group">
			<label>가입 날짜</label>
			<input class="form-control" id="modify-group" name='mem_date' value='${member.mem_date}' readonly="readonly"/>
		</div>
		
		<div id="modifyCompleted"><button type="submit" class="btn btn-primary">수정</button></div>
	</form>
	</div>
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
						<p>회원정보 수정이 완료되었습니다.
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
		
		
		<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	Bootstrap Core JavaScript
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	Metis Menu Plugin JavaScript
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	Custom Theme JavaScript
	<script src="/resources/dist/js/sb-admin-2.js"></script>
	
		<script type="text/javascript">
			$(document).ready(function(){
				
				var result = '<c:out value="${result}"/>';
				
				checkModal(result);
				
				history.replaceState({}, null, null);
				
				function checkModal(result){
					if(result === '' || history.state){
						return;
					}
					$("#myModal").modal("show");
					$('#myModal').on('hidden.bs.modal', function () {
					    // 모달이 닫힐 때 수행할 동작을 여기에 작성
					    console.log('모달이 닫혔습니다.');
					});
				}
			
			});
		</script>
</sec:authorize>

</section>

<%@include file="../includes/footer.jsp"%>
