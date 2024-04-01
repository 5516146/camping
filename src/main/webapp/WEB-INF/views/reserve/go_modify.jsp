<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>
<style>
    /* 버튼 스타일 */
    .button-large {
        padding: 10px 20px;
        font-size: 16px;
    }

    table {
        border-collapse: collapse;
        margin: 0 auto; /* 테이블을 수평 가운데 정렬합니다. */
        width: 1240px;
        height: 510px;
    }

    tr {
        text-align: center;
    }

    tr:first-child td:last-child {
        border-right-width: 3px; /* 첫 번째 행의 마지막 열의 오른쪽 선의 굵기를 3px로 변경 */
    }

    td {
        border: 1px solid #dddddd;
        padding: 8px;
    }

    a {
        color: inherit; /* 링크의 색을 부모 요소의 색으로 상속 */
        text-decoration: none; /* 링크의 밑줄 제거 */
    }

    .slideshow-container {
        width: 620px;
        height: 510px;
        position: relative;
        margin: auto;
    }

    .mySlide1, .mySlide2, .mySlide3 {
        display: none;
    }

    .prev, .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -22px;
        color: white;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
    }

    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
    }

    .prev {
        left: 0;
        border-radius: 3px 0 0 3px;
    }

    .prev:hover, .next:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }


</style>
<!-- <img src="/resources/assets/img/main.jpg" class="img-fluid" alt="..."> -->
<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white" style="font-family: 'Nanum Gothic'; font-weight: bold;">예약</h1>
    </div>
</div>

<%-- 캠핑동 -------------------------------------------------------------------------------------------------------------- --%>
<div id="slideshow-container-1">
    <section class="about">
        <div class="container">
            <div class="section-title">
                <h2>예약 완료</h2>
            </div>
        </div>
    </section>
    <hr/>
    <section>
        <form action="/reserve/modify" method="post">
            <ol style="list-style: none;">
                <li class="li-padding">
                    <i class="ri-check-double-line"></i>
                    <p> 예약 번호 : <input type="number" value="${reserve.reserve_no}" readonly/> </p>
                </li>
                <li class="li-padding">
                    <i class="ri-check-double-line"></i>
                    <p> 사이트 : <input type="text" value="${reserve.camp_no}" readonly/> </p>
                </li>
                <li class="li-padding">
                    <i class="ri-check-double-line"></i>
                    <p>
                        예약날짜 : <input type="date" value="${reserve.reserve_startDate}" readonly/> ~
                        <input type="date" value="${reserve.reserve-endDate}" readonly/>
                    </p>
                </li>
                <li class="li-padding">
                    <i class="ri-check-double-line"></i>
                    <p> 인원 : <input type="number" name="reserve_people" value="${reserve.reserve_people}" min="1" max="4"> </p>
                </li>
                <li class="li-padding">
                    <i class="ri-check-double-line"></i>
                    <p> 가격 : <input type="number" value="${reserve.reserve_price}" readonly/> </p>
                </li>
            </ol>
            <input type="hidden" name="mem_id" value="kkw"> <!-- 리다이렉트 오류로 임시 지정 -->
            <button type="submit" onclick="showAlertAndRedirect()">확인</button>
        </form>
    </section>
</div>

<script>
    function showAlertAndRedirect() {
        // confirm 창 띄우기
        var confirmation = confirm("수정하시겠습니까?");

        // 확인 버튼을 클릭한 경우에만 페이지 이동
        if (confirmation) {
            // 다른 페이지로 이동하기
            window.location.href = "/reserve/modify";
        }
    }
</script>
<%@include file="../includes/footer.jsp" %>
