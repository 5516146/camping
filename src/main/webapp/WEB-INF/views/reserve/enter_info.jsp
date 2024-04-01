<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../includes/header.jsp" %>

<style>
    /*--------------------------------------------------------------
    # Hero-camp-a Section
    --------------------------------------------------------------*/
    #hero-camp-a {
        width: 620px;
        height: 510px;
        background-color: rgba(22, 30, 56, 0.8);
        overflow: hidden;
        position: relative;
        left: 25%;
        transform: translateX(-25%);
    }

    #hero-camp-a .carousel,
    #hero-camp-a .carousel-inner,
    #hero-camp-a .carousel-item,
    #hero-camp-a .carousel-item::before {
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
    }

    #hero-camp-a .carousel-item {
        background-size: cover;
        background-position: center;
        background-repeat: repeat;
    }

    #hero-camp-a .carousel-container {
        display: flex;
        justify-content: center;
        align-items: center;
        position: absolute;
        bottom: 0;
        top: 70px;
        left: 50px;
        right: 50px;
    }

    #hero-camp-a .container {
        text-align: center;
        display: flex; /* 컨테이너를 플렉스 박스로 설정하여 가로 정렬합니다. */
        align-items: center; /* 아이템들을 세로 중앙 정렬합니다. */
    }

    #hero-camp-a h2 {
        color: #fff;
        margin-bottom: 20px;
        font-size: 48px;
        font-weight: 700;
    }

    #hero-camp-a p {
        animation-delay: 0.4s;
        margin: 0 auto 30px auto;
        color: #fff;
    }

    #hero-camp-a .carousel-inner .carousel-item {
        transition-property: opacity;
        background-position: center top;
    }

    #hero-camp-a .carousel-inner .carousel-item,
    #hero-camp-a .carousel-inner .active.carousel-item-start,
    #hero-camp-a .carousel-inner .active.carousel-item-end {
        opacity: 0;
    }

    #hero-camp-a .carousel-inner .active,
    #hero-camp-a .carousel-inner .carousel-item-next.carousel-item-start,
    #hero-camp-a .carousel-inner .carousel-item-prev.carousel-item-end {
        opacity: 1;
        transition: 0.5s;
    }

    #hero-camp-a .carousel-control-next-icon,
    #hero-camp-a .carousel-control-prev-icon {
        background: none;
        font-size: 30px;
        line-height: 0;
        width: auto;
        height: auto;
        background: rgba(255, 255, 255, 0.2);
        border-radius: 50px;
        transition: 0.3s;
        color: rgba(255, 255, 255, 0.5);
        width: 54px;
        height: 54px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    #hero-camp-a .carousel-control-next-icon:hover,
    #hero-camp-a .carousel-control-prev-icon:hover {
        background: rgba(255, 255, 255, 0.3);
        color: rgba(255, 255, 255, 0.8);
    }

    #hero-camp-a .carousel-indicators li {
        list-style-type: none;
        cursor: pointer;
        background: #fff;
        overflow: hidden;
        border: 0;
        width: 12px;
        height: 12px;
        border-radius: 50px;
        opacity: 0.6;
        transition: 0.3s;
    }

    #hero-camp-a .carousel-indicators li.active {
        opacity: 1;
        background: #006fbe;
    }

    #hero-camp-a .btn-get-started {
        font-family: "Raleway", sans-serif;
        font-weight: 500;
        font-size: 14px;
        letter-spacing: 1px;
        display: inline-block;
        padding: 14px 32px;
        border-radius: 4px;
        transition: 0.5s;
        line-height: 1;
        color: #fff;
        animation-delay: 0.8s;
        background: #006fbe;
    }

    #hero-camp-a .btn-get-started:hover {
        background: #007ed8;
    }

    @media (max-width: 992px) {
        #hero-camp-a {
            height: 100vh;
        }

        #hero-camp-a .carousel-container {
            top: 8px;
        }
    }

    @media (max-width: 768px) {
        #hero-camp-a h2 {
            font-size: 28px;
        }
    }

    @media (min-width: 1024px) {

        #hero-camp-a .carousel-control-prev,
        #hero-camp-a .carousel-control-next {
            width: 5%;
        }
    }

    @media (max-height: 500px) {
        #hero-camp-a {
            height: 120vh;
        }
    }

    table {
        border-collapse: collapse;
        margin: 0 auto; /* 테이블을 수평 가운데 정렬합니다. */
        width: 1240px;
        height: 510px;
    }

    td:first-child {
        border-right-width: 3px; /* 첫 번째 행의 마지막 열의 오른쪽 선의 굵기를 3px로 변경 */
    }

    td {
        padding: 50px;
        width: 50%;
    }

    a {
        color: inherit; /* 링크의 색을 부모 요소의 색으로 상속 */
        text-decoration: none; /* 링크의 밑줄 제거 */
    }

    .li-padding {
        padding-bottom: 10%;
    }

    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    /* 모달 내용 스타일 */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }

    /* 모달 닫기 버튼 스타일 */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
</style>


<!-- <img src="/resources/assets/img/main.jpg" class="img-fluid" alt="..."> -->
<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white" style="font-family: 'Nanum Gothic'; font-weight: bold;">예약</h1>
    </div>
</div>

<%-- 사이트 번호 site_no에 저장 --%>
<c:set var="site" value="${site}"/>
<c:set var="site_no" value="${fn:substring(site, 0, 1)}"/>

<main id="main">
    <!-- ======= My & Family Section ======= -->
    <section id="about" class="about">
        <div class="container">
            <div class="section-title">
                <h2>정보 입력</h2>
                <h3><c:out value="${site}"/></h3>
            </div>
            <hr/>
            <br/>
            <br/>
        </div>

        <table align="center">
            <div class="row content">
                <tr>
                    <td>
                        <!-- ======= Hero Section ======= -->
                        <section id="hero-camp-a">
                            <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade"
                                 data-bs-ride="carousel">

                                <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

                                <div class="carousel-inner" role="listbox">
                                    <c:choose>
                                        <c:when test="${site_no eq 'A'}">
                                            <!-- Slide 1 -->
                                            <div class="carousel-item active"
                                                 style="background-image: url(/resources/assets/img/캠피잉.jpeg)">
                                            </div>

                                            <!-- Slide 2 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/캠피잉2.jpeg)">
                                            </div>

                                            <!-- Slide 3 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/캠핑장.png)">
                                            </div>

                                        </c:when>
                                        <c:when test="${site_no eq 'B'}">
                                            <!-- Slide 1 -->
                                            <div class="carousel-item active"
                                                 style="background-image: url(/resources/assets/img/B동.jpeg)">
                                            </div>

                                            <!-- Slide 2 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/B동1.jpeg)">
                                            </div>

                                            <!-- Slide 3 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/B동2.jpeg)">
                                            </div>
                                        </c:when>
                                        <c:when test="${site_no eq 'C'}">
                                            <!-- Slide 1 -->
                                            <div class="carousel-item active"
                                                 style="background-image: url(/resources/assets/img/C동.jpg)">
                                            </div>

                                            <!-- Slide 2 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/C동1.jpg)">
                                            </div>

                                            <!-- Slide 3 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/C동2.jpeg)">
                                            </div>
                                        </c:when>
                                        <c:when test="${site_no eq 'D'}">
                                            <!-- Slide 1 -->
                                            <div class="carousel-item active"
                                                 style="background-image: url(/resources/assets/img/글램핑1.png)">
                                            </div>

                                            <!-- Slide 2 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/끌램핑.png)">
                                            </div>
                                        </c:when>
                                        <c:when test="${site_no eq 'E'}">
                                            <!-- Slide 1 -->
                                            <div class="carousel-item active"
                                                 style="background-image: url(/resources/assets/img/끌램핑1.png)">
                                            </div>

                                            <!-- Slide 2 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/그으을램핑.png)">
                                            </div>

                                            <!-- Slide 2 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/그을램핑.png)">
                                            </div>

                                            <!-- Slide 2 -->
                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/그을램핑1.png)">
                                            </div>
                                        </c:when>
                                        <c:when test="${site_no eq 'F'}">
                                            <!-- Slide 2 -->
                                            <div class="carousel-item active"
                                                 style="background-image: url(/resources/assets/img/카라반.jpeg)">
                                            </div>

                                            <div class="carousel-item"
                                                 style="background-image: url(/resources/assets/img/카라반2.jpeg)">
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <a class="carousel-control-prev" href="#heroCarousel" role="button"
                                   data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon bi bi-chevron-left"
                                          aria-hidden="true"></span>
                                </a>
                                <a class="carousel-control-next" href="#heroCarousel" role="button"
                                   data-bs-slide="next">
                                    <span class="carousel-control-next-icon bi bi-chevron-right"
                                          aria-hidden="true"></span>
                                </a>
                            </div>
                        </section><!-- End Hero -->
                    </td>
                    <td>
                        <form id="myForm">
                            <ol style="list-style: none;">
                                <li class="li-padding">
                                    <span>
                                        <i class="ri-check-double-line"></i>
                                        <strong> 입실 : </strong>
                                        <input type="date" id="start-date" name="reserve_startDate">
                                        <strong> 퇴실 : </strong>
                                        <input type="date" id="end-date" name="reserve_endDate">
                                    </span>
                                </li>
                                <li class="li-padding">
                                    <i class="ri-check-double-line"></i>
                                    <strong> 이름 : </strong>
                                    <input id="inputValue_mem_name" value="가나다" readonly/>
                                </li>
                                <li class="li-padding">
                                    <i class="ri-check-double-line"></i>
                                    <strong> 인원 : </strong>
                                    <input type="number" id="inputValue_res_people" name="reserve_people" min="1"
                                           max="4">
                                    <span> 인원은 1~4명으로 입력 가능합니다.</span>
                                </li>
                                <li class="li-padding">
                                    <i class="ri-check-double-line"></i>
                                    <strong> 가격 : </strong>
                                    <input name="reserve_price" id="inputValue_res_price" value="20000" readonly/>
                                </li>
                            </ol>
                            <div align="center">
                                <input type="hidden" id="inputValue_mem_id" name="mem_id" value="jjj"> <!-- 리다이렉션 오류로 임시 처리 -->
                                <input type="hidden" id="inputValue_camp_no" name="camp_no" value="${site}">
                                <button type="reset">취소</button>
                                <button type="submit" id="openModalBtn" onclick="validateInput()">결제</button>
                            </div>
                        </form>
                    </td>
                </tr>
            </div>
        </table>
        <hr/>
        <br/>
        <br/>
    </section><!-- End My & Family Section -->
</main>

<div id="reservationData"
     data-start-date="<c:out value="${startDate}"/>"
     data-end-people="<c:out value="${endDate}"/>">
</div>

<!-- 모달 -->
<div id="myModal" class="modal">
    <div class="modal-content" align="center">
        <span class="close">&times;</span>
        <h2>결제 정보</h2>
        <hr/>
        <form action="/reserve/register" method="post">
            <p id="modalContent"></p>
<%--            <input type="hidden" name="camp_no" value="${site}">--%>
            <p align="center">결제 수단 :
                <select>
                    <option value="shinhan">신한카드</option>
                    <option value="samsung">삼성카드</option>
                    <option value="kakao">카카오뱅크</option>
                    <option value="toss">토스뱅크</option>
                </select>
            </p>
            <button type="submit" onclick="showAlert()">확인</button>
        </form>
    </div>
</div>

<script>
    // 현재 날짜 가져오기
    var today = new Date();

    // 현재 날짜를 YYYY-MM-DD 형식으로 변환
    var formattedDate = today.toISOString().substr(0, 10);

    // date input의 min 속성에 현재 날짜 할당
    document.getElementById("start-date").setAttribute("min", formattedDate);

    // 시작일과 종료일 입력란 가져오기
    var startDateInput = document.getElementById("start-date");
    var endDateInput = document.getElementById("end-date");

    // 시작일 변경 시 종료일의 최솟값 변경
    startDateInput.addEventListener("change", function () {
        endDateInput.min = startDateInput.value;
    });

    // 종료일 변경 시 시작일의 최댓값 변경
    endDateInput.addEventListener("change", function () {
        startDateInput.max = endDateInput.value;
    });

    // 인원 선택이 1미만, 4초과인 경우
    function validateInput() {
        // quantity 이름의 값을 가져옴
        var input = document.getElementById("inputValue_res_people").value;

        if (input < 1 || input > 4) {
            alert("입력값은 1에서 4 사이어야 합니다.");
        } else {
            // 유효한 경우에는 여기에 원하는 작업을 수행합니다.
            alert("입력값이 유효합니다.");
        }
    }


    // 모달 열기 버튼
    var openModalBtn = document.getElementById("openModalBtn");

    // 모달 요소
    var modal = document.getElementById("myModal");

    // 닫기 버튼
    var closeBtn = document.getElementsByClassName("close")[0];

    // 모달 열기 버튼 클릭 시 이벤트 핸들러
    openModalBtn.onclick = function () {
        modal.style.display = "block"; // 모달 보이기
    }

    // 닫기 버튼 클릭 시 이벤트 핸들러
    closeBtn.onclick = function () {
        modal.style.display = "none"; // 모달 숨기기
    }

    // 사용자가 모달 외부를 클릭할 때, 모달 닫기
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // 폼 제출 시 이벤트 핸들러
    document.getElementById("myForm").onsubmit = function (event) {
        event.preventDefault(); // 기본 동작 방지

        var camp_no = document.getElementById("inputValue_camp_no").value; // 입력된 값 가져오기
        var mem_id = document.getElementById("inputValue_mem_id").value; // 입력된 값 가져오기
        var res_people = document.getElementById("inputValue_res_people").value; // 입력된 값 가져오기
        var mem_name = document.getElementById("inputValue_mem_name").value; // 입력된 값 가져오기
        var res_price = document.getElementById("inputValue_res_price").value; // 입력된 값 가져오기
        var start_date = document.getElementById("start-date").value; // 입력된 값 가져오기
        var end_date = document.getElementById("end-date").value; // 입력된 값 가져오기

        modalContent.innerHTML = "<p>사이트 : " + <c:out value="camp_no"/> +"</p>" +
            "<p>예약자 : " + mem_name + "</p>" +
            "<p>예약 인원 : " + res_people + "</p>" +
            "<p>입실일 : " + start_date + "</p>" + // 모달에 입력된 값 표시
            "<p>퇴실일 : " + end_date + "</p>" + // 모달에 입력된 값 표시
            "<p>결제 금액 : " + res_price + "</p>" + // 모달에 입력된 값 표시
            "<input type='hidden' name='mem_id' value='kkw'/>" + // 모달에 입력된 값 표시
            "<input type='hidden' name='camp_no' value='" + camp_no + "'/>" + // 모달에 입력된 값 표시
            "<input type='hidden' name='reserve_startDate' value='" + start_date + "'/> " + // 모달에 입력된 값 표시
            "<input type='hidden' name='reserve_endDate' value='" + end_date + "'/>" + // 모달에 입력된 값 표시
            "<input type='hidden' name='reserve_people' value='" + res_people + "'/>" + // 모달에 입력된 값 표시
            "<input type='hidden' name='reserve_price' value='" + res_price + "'>"; // 모달에 입력된 값 표시


        modal.style.display = "block"; // 모달 보이기
    }

    // alert 띄우기
    function showAlert() {
        // alert 창 띄우기
        alert("예약이 완료되었습니다.");
        document.querySelector("form").submit(); // 폼 제출
    }

    // -----------------------------------------------------------------------------------------------------------------
    // 이미 예약된 날짜 선택 불가 ( 수정 필요 )
    var reservationDataElement = document.getElementById('reservationData');

    // 이미 예약된 날짜 목록
    var startDates = reservationDataElement.getAttribute('data-start-date'); // 예약된 시작 날짜를 서버에서 받아와서 배열에 저장
    var endDates = reservationDataElement.getAttribute('data-end-date'); // 예약된 종료 날짜를 서버에서 받아와서 배열에 저장

    // 문자열로 변환된 배열을 다시 배열로 파싱
    var start_Dates = JSON.parse(startDates);
    var end_Dates = JSON.parse(endDates);

    // 시작일과 종료일 input 요소 가져오기
    var startDateInput = document.getElementById("start-date");
    var endDateInput = document.getElementById("end-date");

    // 페이지 로드 시 실행되는 함수
    window.onload = function () {
        // 예약된 날짜를 비활성화
        disableReservedDates();
    };

    // 예약된 날짜를 비활성화하는 함수
    function disableReservedDates() {
        // 시작일과 종료일 각각의 날짜 선택 input 태그에 대해 처리
        [startDateInput, endDateInput].forEach(function (input) {
            // 예약된 날짜 목록을 순회하며 각 날짜를 비활성화
            start_Dates.forEach(function (startDate, index) {
                // 종료일과 시작일이 예약된 범위에 있는지 확인
                if (startDate <= endDateInput.value && endDateInput.value <= end_Dates[index]) {
                    input.disabled = true;
                }
            });
        });
    }


</script>
<!-- End #main -->
<%@include file="../includes/footer.jsp" %>
  