<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
                <h2>예약 정보</h2>
            </div>
        </div>
    </section>
    <hr/>
    <section>
        <table style="border-collapse: collapse; border: 1px solid royalblue;">
            <thead style="background-color: #00b3ff">
            <tr>
                <th>예약 번호</th>
                <th>사이트</th>
                <th>가격</th>
                <th>예약일</th>
                <th>비고</th>
            </tr>
            </thead>
            <c:forEach items="${reserve}" var="reserve">
                <tr>
                    <td><c:out value="${reserve.reserve_no}"/></td>
                    <td><c:out value="${reserve.camp_no}"/></td>
                    <td><c:out value="${reserve.reserve_price}"/></td>
                    <td>
                        <c:out value="${reserve.reserve_startDate}"/>
                    </td>
                    <td>
                        <button type="button"><a href="/reserve/getRes?reserve_no=${reserve.reserve_no}">상세보기</a>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </section>
</div>

<script>
    // var mem_id = document.getElementById("inputValue_mem_id").value; // 입력된 값 가져오기
    // var reserve_no = document.getElementById("inputValue_reserve_no").value; // 입력된 값 가져오기
    //
    // // 이전 페이지의 URL을 가져옴
    // var referrerURL = document.referrer;
    //
    // // URLSearchParams 객체 생성
    // var searchParams = new URLSearchParams(referrerURL);
    //
    // // GET 매개변수 가져오기
    // var parameterValue = searchParams.get("mem_id"); // parameterName은 실제 GET 매개변수의 이름으로 대체해야 함
    //
    // // 이전 페이지의 URL이 특정 페이지이고 GET 매개변수도 특정한 값인 경우에만 실행
    // if (referrerURL === "enter_info" && parameterValue === mem_id) {
    //     // alert 창을 띄움
    //     alert("예약이 완료되었습니다.");
    //     alert("예약번호 : " + reserve_no);
    // }

</script>


<%@include file="../includes/footer.jsp" %>