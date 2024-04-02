<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>
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
	<div class="container mt-5">
        <h1 class="text-center mb-4">게시판 리스트</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="board" items="${boardList}">
                    <tr>
                        <td>${board.board_no}</td>
                        <td><a href="/board/detail?board_no=${board.board_no}">${board.board_title}</a></td>
                        <td>${board.mem_id}</td>
                        <td>${board.board_date}</td>
                        <td>${board.board_hit}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

	
</section>

<%@include file="includes/footer.jsp"%>
