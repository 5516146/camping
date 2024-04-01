<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>
<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<div class="container">
		<div class="section-title">
			<h2>My & Family</h2>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">공지 사항 내용</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->


	<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">공지 상세 내용</div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="board_no" class="form-label">번호</label>
                    <input class="form-control" id="board_no" value='<c:out value="${notice.board_no}"/>' readonly="readonly">
                </div>
                <div class="mb-3">
                    <label for="board_title" class="form-label">제목</label>
                    <input class="form-control" id="board_title" value='<c:out value="${notice.board_title}"/>' readonly="readonly">
                </div>
                <div class="mb-3">
                    <label for="board_content" class="form-label">내용</label>
                    <textarea class="form-control" id="board_content" rows="15" readonly="readonly"><c:out value="${notice.board_content}"/></textarea>
                </div>
                <div class="mb-3">
                    <label for="mem_id" class="form-label">작성자</label>
                    <input class="form-control" id="mem_id" value='<c:out value="${notice.mem_id}"/>' readonly="readonly">
                </div>
                
                <div class="mb-3">
                    <label for="mem_id" class="form-label">조회수</label>
                    <input class="form-control" id="board_hit" value='<c:out value="${notice.board_hit}"/>' readonly="readonly">
                </div>
                
                <button type="button" class="btn btn-secondary" onclick="location.href='/notice/noticemodify?board_no=<c:out value="${notice.board_no}"/>'">수정</button>
                <button type="button" class="btn btn-primary" onclick="location.href='/notice/noticelist'">목록</button>
                
                <form id='operForm' action="/notice/noticemodify" method="get">
                	<input type='hidden' id='board_no' name='board_no' value='<c:out value="${board.board_no}"/>'>
                </form>
                
            </div>
        </div>
    </div>
</div>
		
</section>

<%@include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='noticemodify']").on("click", function(e){
	
		operForm.attr("action", "/notice/noticemodify").submit();
		
	});
	
	$("button[data-oper='noticelist']").on("click", function(e){
		
		operForm.find(#board_no).remove();
		operForm.attr("action", "/notice/noticelist")
		operForm.submit();
		
	});
});
</script>