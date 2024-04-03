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
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center">
				<div class="title"><span class="yogi">회원가입</span></div>
					<div class="center">
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<div class="panel-body">
											<div id="signup-form">
												<!-- <form role="form" method='post' action="/member/join" id="myForm"> -->
														<!-- 사용할 아이디 입력 -->
														<div class="form-group mt-2">
															<input type="text" name="mem_id" class="form-style yogi yo"
																placeholder="아이디" id="mem_id"
																oninput="checkId(),activateSignupbtn()"
																autocomplete="off">
															
																 <span id="idChk"></span></p>
														</div>
														<!-- 사용할 비밀번호 입력 -->
														<div class="form-group mt-2">
															<input type="password" name="mem_pw" class="form-style yogi yo"
																placeholder="비밀번호" id="mem_pw"
																oninput="checkPwd(),activateSignupbtn()"
																autocomplete="off">
																<font color="red" id="failpwd" style="display:none">
																8~16자의 영문과 숫자를 조합하여 입력하세요.
																</font>
														</div>
														
														<!-- oninput="checkPwd2(),activateSignupbtn()" -->
														<!-- 비밀번호 한 번 더 입력 -->
														<div class="form-group mt-2">
															<input type="password" name="pwCheck" class="form-style yogi yo"
																placeholder="비밀번호 확인" id="pwCheck"
																oninput="checkPwd2(),activateSignupbtn()"
																autocomplete="off">
														</div>
														
														<!-- oninput="checkName(),activateSignupbtn()" -->
														<!-- 사용자 이름 -->
														<div class="form-group mt-2">
															<input type="text" name="mem_name" class="form-style yogi yo"
																placeholder="이름" id="joinname" 
																oninput="checkName(),activateSignupbtn()"
																autocomplete="off"> <i
																class="input-icon uil uil-at"></i>
														</div>
														
														<!-- oninput="checkEmail(),activateSignupbtn()" -->
														<!-- 이메일 -->
														<div class="form-group mt-2">
															<input type="email" name="mem_email" class="form-style yogi yo"
																placeholder="이메일" id="joinemail"
																oninput="checkEmail(),activateSignupbtn()"
																autocomplete="off">
														</div>
														
														<!-- oninput="addhyphen(),checkTel(),activateSignupbtn()" -->
														<!-- 전화번호 -->
														<div class="form-group mt-2">
															<input type="text" name="mem_tel" class="form-style yogi yo"
																placeholder="전화번호" id="jointel"
																oninput="addhyphen(),checkTel(),activateSignupbtn()"
																autocomplete="off">
																<div class="arrow_box">입력된 전화번호로 인증 문자가 발송됩니다!</div>
														</div>
														<!-- <div class="authMessage">
														<input type="button" onclick="authnum()" class="btn btn-authbtn" value="인증 요청">
															<div style="display:none;" class="successMessage">
																<b>입력하신 휴대전화로 인증번호가 발송되었습니다.</b>
															</div>
														<input type="text" name="authNum" id="authNum" class="authNum" placeholder="인증번호를 입력하세요">
														<input type="button" class="btn btn-authNum" 
														onclick="checkMessage()" value="인증 확인">
														<div style="display:none;" class="authsuccessMessage"><b>인증 성공</b></div>
														</div> -->
														
														<!-- <a href="#" class="btn mt-4">submit</a> -->
														<%-- <input type="submit" value="Submit">
														<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" /> --%>
												<!-- </form> -->
												<input type="submit" id="joinButton" class="btn btn-lg btn-join btn-block yogi"
														value="완료">
														<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
												<!-- </form> -->
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
	
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- <script src="css/styles.css"></script> -->
	
	
	
	<!-- 완료 -->
	<script>
	$(document).ready(function(){
    $(".btn-join").on(
        "click",
        function(e) {
            e.preventDefault();

            if ($("#mem_id").val() === null || $("#mem_id").val() === "") {
                // 빈칸이 있는 상태로 submit을 눌렀을 때
                alert("아이디를 입력하세요.");
            } else if ($("#mem_pw").val() === null || $("#mem_pw").val() === "") {
                alert("비밀번호를 입력하세요.");
            } else if ($("#pwCheck").val() === null || $("#pwCheck").val() === "") {
                alert("비밀번호를 확인하세요.");
            } else if ($("#joinname").val() === null || $("#joinname").val() === "") {
                alert("이름을 입력하세요.");
            } else if ($("#joinemail").val() === null || $("#joinemail").val() === "") {
                alert("이메일을 입력하세요.");
            } else if ($("#jointel").val() === null || $("#jointel").val() === "") {
                alert("전화번호를 입력하세요.");
            } else {
                $("form").submit();
            }
        });
	});
</script>

<script>
$(function() {
    
    //각 입력값들의 유효성 검증을 위한 정규표현식을 변수로 선언.
       const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
       const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
       const getNameCheck = RegExp(/^[가-힣]+$/);
       
    // 입력값 중 하나라도 만족하지 못한다면 회원가입 처리를 막기위한 논리형 변수 선언.
   	 let chk1 = false, chk2 = false, chk3 = false, chk4 = false;
   	    
    //회원가입시 사용자의 입력값 검증!
    
    //1. ID입력값 검증 
    $('#mem_id').keyup(function() {
    // 입력값이 변경될 때마다 실행되는 코드
    const id = $(this).val(); // 입력된 아이디 값 가져오기

    // 아이디 유효성 검사
    if (id === '') {
        $(this).css('background-color', 'pink');
        $('#idChk').html('<b style="font-size: 14px; color: red">[아이디는 필수값입니다.]</b>');
        chk1 = false;
    } else if (!getIdCheck.test(id)) {
        $(this).css('background-color', 'pink');
        $('#idChk').html('<b style="font-size: 14px; color: red">[영문자, 숫자조합 4-14로쓰세요]</b>');
        chk1 = false;
    } else {
        // 아이디 중복 확인 ajax 호출
        $.ajax({
            type: 'post',
            url: '/member/idCheck',
            headers: {
                'Content-Type': 'application/json'
            },
            dataType: 'text',
            data: id,
            success: function(result) {
                console.log('통신 성공!' + result);
                if (result === 'available') {
                    $('#mem_id').css('background-color', 'aqua');
                    $('#idChk').html('<b style="font-size: 14px; color: green">[아이디 사용이 가능하다.]</b>');
                    chk1 = true;
                } else {
                    $('#mem_id').css('background-color', 'pink');
                    $('#idChk').html('<b style="font-size: 14px; color: red">[아이디 중복!.]</b>');
                    chk1 = false;
                }
            },
            error: function(status, error) {
                console.log('통신실패');
                console.log(status, error);
            }
        });
    }
});
       
    //2. 비밀번호 입력값 검증
    $('#mem_pw').keyup(function() {
       if($(this).val() === '' ) {//지금 발생하는 이곳이 빈 문자열이니?
          $(this).css('background-color', 'pink');
          $('#pwChk').html('<b style="font-size: 14px; color: red">[비밀번호는 필수값입니다.]</b>');//텍스트를 집어넣을거야 
          chk1 = false;
       }
</script>

	<script>
			//전화번호 자동 입력 함수 구현
			function addhyphen() {
			   $(document).on("keyup", "#jointel", function () {
			      $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); //- 자동으로 입력
			   })
			}
			
			/* //인증문자
			function authnum(){
				var inputed=$("#jointel").val();
				$.ajax({
					data: {
						jointel : inputed
					},
					url : "sendMessage",
					success : function(){
						$(".authbtn").prop("disabled",true);
				        $(".authbtn").css("display", "none");
				        $(".successMessage").css("display", "block");
					}
				});
			} */
			
			//회원가입 조건 확인
			function activateSignupbtn() {
			   
			   if( idCheck == 1 && pwdCheck == 1  && nameCheck == 1  && pwCheck == 1 && authCheck ==1) {
			      $(".signupbtn").prop("disabled", false);   
			      $(".signupbtn").css("background-color", "#B0F6AC");
			   }
			   else  {
			      $(".signupbtn").css("background-color", "#aaaaaa");
			      $(".signupbtn").prop("disabled", true);
			   }
			}
	</script>

</section>

<%@include file="../includes/footer.jsp"%>