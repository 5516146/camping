<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Custom Login Page</title>

<style>
.modal {
	position: absolute;
	display: none;
	justify-content: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}
</style>

<!-- Bootstrap Core CSS -->
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link href="/resources/assets/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<link href="/resources/assets/dist/css/sb-admin-2.css" rel="stylesheet">

<link href="/resources/assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" href="/resources/assets/css/styles.css" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	
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
							<span>LOGIN</span><span>Sign Up</span>
						</h6>
						<input class="checkbox" type="checkbox" id="reg-log"
							name="reg-log" /> <label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<div class="error-msg">
												<c:out value="${error}" />
											</div>
											<h3 class="mb-4 pb-3">LOGIN</h3>
											<div class="panel-body">
												<form role="form" method='post' action="/login">
													<!-- 3. post 메서드를 통해서 /login URI로 폼 데이터 전달(아이디, 비밀번호(토큰) 전달) -->
													<div class="form-group">
														<input type="text" name="username" class="form-style"
															id="logusername" autocomplete="off" required="required"
															placeholder="ID"> <i
															class="input-icon uil uil-at"></i>
													</div>
													<div class="form-group mt-2">
														<input type="password" name="password" class="form-style"
															placeholder="Password" id="logpass" autocomplete="off">
														<i class="input-icon uil uil-lock-alt"></i>
													</div>
													<div class="remember">
														<label> <input name="remember-me" type="checkbox">Remember
															Me
														</label>
													</div>
													<!-- <a href="index.html" class="btn btn-lg btn-success btn-block">submit</a> -->
													<input type="submit"
														class="btn btn-lg btn-success btn-block" value="Submit" />
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												</form>
											</div>
											<p class="mb-0 mt-4 text-center">
												<a href="#0" class="link">Forgot your password?</a>
											</p>
										</div>
									</div>
								</div>
								<!-- <div class="card-back">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">Sign Up</h4>
											<div class="panel-body">
												<form role="form" method='post' action="/signup">
														<div class="form-group">
															<input type="text" name="username" class="form-style"
																placeholder="ID" id="username"
																autocomplete="off"> <i
																class="input-icon uil uil-user"></i>
														</div>
														<div class="form-group mt-2">
															<input type="password" name="password" class="form-style"
																placeholder="Password" id="password"
																autocomplete="off"> <i
																class="input-icon uil uil-lock-alt"></i>
														</div>
														<div class="form-group mt-2">
															<input type="text" name="name" class="form-style"
																placeholder="Name" id="name"
																autocomplete="off"> <i
																class="input-icon uil uil-at"></i>
														</div>
														<div class="form-group mt-2">
															<input type="email" name="logemail" class="form-style"
																placeholder="Email" id="logemail"
																autocomplete="off"> <i
																class="input-icon uil uil-at"></i>
														</div>
														<div class="form-group mt-2">
															<input type="text" name="tel" class="form-style"
																placeholder="TEL." id="tel"
																autocomplete="off"> <i
																class="input-icon uil uil-at"></i>
														</div>
													
														
														<a href="#" class="btn mt-4">submit</a>
												</form>
											</div>
										</div>
									</div>
								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal  추가 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- jQuery -->
   <script src="/resources/assets/vendor/jquery/jquery.min.js"></script>

   <script src="/resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

   <script src="/resources/assets/vendor/metisMenu/metisMenu.min.js"></script>

   <script src="/resources/assets/dist/js/sb-admin-2.js"></script>

   <!-- <script src="css/styles.css"></script> -->
   <script>
      $(".btn-success").on("click",function(e) {
               e.preventDefault();

               if ($(".form-style").val() === null || $(".form-style").val() === "") {
                  // 에러 처리 코드 작성
                   var errorSpace = ${error-space};
                   console.log(errorSpace-space);
               } else {
                  $("form").submit();
               }
            });
   </script>

   <c:if test="${param.logout != null}">
      <script>
         $(document).ready(function() {
            alert("로그아웃하였습니다.");
         });
      </script>
   </c:if>
</body>

</html>
