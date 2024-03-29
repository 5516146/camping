<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>
<style>
    table {
        border-collapse: collapse;
        margin: 0 auto; /* 테이블을 수평 가운데 정렬합니다. */
        width: 1240px;
        height: 510px;
    }

    tr {
        text-align: center;
    }

    td {
        border: 1px solid #dddddd;
        padding: 8px;
    }

    a {
        color: inherit; /* 링크의 색을 부모 요소의 색으로 상속 */
        text-decoration: none; /* 링크의 밑줄 제거 */
    }


</style>
<!-- <img src="/resources/assets/img/main.jpg" class="img-fluid" alt="..."> -->
<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white" style="font-family: 'Nanum Gothic'; font-weight: bold;">예약 확인</h1>
    </div>
</div>

<%-- 캠핑동 -------------------------------------------------------------------------------------------------------------- --%>
<div id="slideshow-container-1">
    <section class="about">
        <div class="container">
            <div class="section-title">
                <h2>예약 상세 보기</h2>
            </div>
        </div>
    </section>
    <hr/>
    <section>
<%--        <c:set var="reserve" value="${reserve}"/>--%>
        <ol style="list-style: none;">
            <li class="li-padding">
                <i class="ri-check-double-line"></i>
                <p> 예약 번호 : <c:out value="${reserve.reserve_no}"/> </p>
            </li>
            <li class="li-padding">
                <i class="ri-check-double-line"></i>
                <p> 사이트 : <c:out value="${reserve.camp_no}"/> </p>
            </li>
            <li class="li-padding">
                <i class="ri-check-double-line"></i>
                <p>
                    예약날짜 : <c:out value="${reserve.reserve_startDate}"/> ~
                    <c:out value="${reserve.reserve_endDate}"/>
                </p>
            </li>
            <li class="li-padding">
                <i class="ri-check-double-line"></i>
                <p> 인원 : <c:out value="${reserve.reserve_people}"/> </p>
            </li>
            <li class="li-padding">
                <i class="ri-check-double-line"></i>
                <p> 가격 : <c:out value="${reserve.reserve_price}"/> </p>
            </li>
        </ol>
        <button onclick="goBack()">목록</button>
        <button type="button"><a href="/reserve/go_modify?reserve_no=${reserve.reserve_no}">수정</a></button>
        <button type="button" onclick="showAlertAndRedirect()">예약 취소</button>
    </section>
    <br/>
    <br/>
    <hr/>
    <br/>
    <br/>

</div>

<script>
    function goBack() {
        window.history.back();
    }

    function showAlertAndRedirect() {
        // confirm 창 띄우기
        var confirmation = confirm("정말 예약을 취소하시겠습니까?");

        // 확인 버튼을 클릭한 경우에만 페이지 이동
        if (confirmation) {
            // 다른 페이지로 이동하기
            window.location.href = "/reserve/remove";
        }
    }
</script>

<%@include file="../includes/footer.jsp"%>
