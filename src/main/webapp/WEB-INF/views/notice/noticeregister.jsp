<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<br>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">공지 등록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading"></div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/notice/noticeregister" method="post">
					<div class="mb-3">
						<label for="board_title" class="form-label">공지 제목</label> <input
							type="text" class="form-control" id="board_title"
							name="board_title">
					</div>

					<div class="mb-3">
						<label for="board_content" class="form-label">공지 내용</label>
						<textarea class="form-control" id="board_content" rows="20"
							name="board_content"></textarea>
					</div>

					<div class="mb-3">
						<label for="mem_id" class="form-label">작성자</label> <input
							type="text" class="form-control" id="mem_id" name="mem_id">
					</div>

					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-secondary">취소</button>
				</form>


			</div>
			<!-- end panel-body -->

		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>