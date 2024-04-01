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
        <form action="/reserve/getMem" method="get">
            <h3>예약이 정상적으로 완료되었습니다</h3>
            <p>예약 번호 : ${flashScope.reserve_no}</p>
            <input type="hidden" name="mem_id" value="jjj"> <!-- 리다이렉트 오류로 임시 처리 -->
            <button type="submit">확인</button>
        </form>
    </section>
</div>


<script>
    <%-- 1 --%>
    var slideIndex1 = 1;
    showSlide1(slideIndex1);

    function plusSlide1(n) {
        showSlide1(slideIndex1 += n);
    }

    function currentSlide1(n) {
        showSlide1(slideIndex1 = n);
    }

    function showSlide1(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide1");
        if (n > slides.length) {
            slideIndex1 = 1
        }
        if (n < 1) {
            slideIndex1 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex1 - 1].style.display = "block";
    }

    // 2
    var slideIndex2 = 1;
    showSlide2(slideIndex2);

    function plusSlide2(n) {
        showSlide2(slideIndex2 += n);
    }

    function currentSlide2(n) {
        showSlide2(slideIndex2 = n);
    }

    function showSlide2(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide2");
        if (n > slides.length) {
            slideIndex2 = 1
        }
        if (n < 1) {
            slideIndex2 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex2 - 1].style.display = "block";
    }

    // 3
    var slideIndex3 = 1;
    showSlide3(slideIndex3);

    function plusSlide3(n) {
        showSlide3(slideIndex3 += n);
    }

    function currentSlide3(n) {
        showSlide3(slideIndex3 = n);
    }

    function showSlide3(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide3");
        if (n > slides.length) {
            slideIndex3 = 1
        }
        if (n < 1) {
            slideIndex3 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex3 - 1].style.display = "block";
    }

    // 4 - 글램핑
    var slideIndex4 = 1;
    showSlide4(slideIndex4);

    function plusSlide4(n) {
        showSlide4(slideIndex4 += n);
    }

    function currentSlide4(n) {
        showSlide4(slideIndex4 = n);
    }

    function showSlide4(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide4");
        if (n > slides.length) {
            slideIndex4 = 1
        }
        if (n < 1) {
            slideIndex4 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex4 - 1].style.display = "block";
    }

    // 5 - 글램핑
    var slideIndex5 = 1;
    showSlide5(slideIndex5);

    function plusSlide5(n) {
        showSlide5(slideIndex5 += n);
    }

    function currentSlide5(n) {
        showSlide5(slideIndex5 = n);
    }

    function showSlide5(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide5");
        if (n > slides.length) {
            slideIndex5 = 1
        }
        if (n < 1) {
            slideIndex5 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex5 - 1].style.display = "block";
    }


    // 6 - 카라반
    var slideIndex6 = 1;
    showSlide6(slideIndex6);

    function plusSlide6(n) {
        showSlide6(slideIndex6 += n);
    }

    function currentSlide6(n) {
        showSlide6(slideIndex6 = n);
    }

    function showSlide6(n) {
        var i;
        var slides = document.getElementsByClassName("mySlide6");
        if (n > slides.length) {
            slideIndex6 = 1
        }
        if (n < 1) {
            slideIndex6 = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex6 - 1].style.display = "block";
    }


    function changePage(page) {
        var page1Content = document.getElementById("slideshow-container-1");
        var page2Content = document.getElementById("slideshow-container-2");
        var page3Content = document.getElementById("slideshow-container-3");

        if (page === 'page1') {
            page1Content.style.display = "block";
            page2Content.style.display = "none";
            page3Content.style.display = "none";
        } else if (page === 'page2') {
            page1Content.style.display = "none";
            page2Content.style.display = "block";
            page3Content.style.display = "none";
        } else if (page === 'page3') {
            page1Content.style.display = "none";
            page2Content.style.display = "none";
            page3Content.style.display = "block";
        }
    }
</script>

<%@include file="../includes/footer.jsp" %>
