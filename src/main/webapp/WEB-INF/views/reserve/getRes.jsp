<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>
<style>
    table {
        border-collapse: collapse;
        margin: 0 auto; /* 테이블을 수평 가운데 정렬합니다. */
        width: 1240px;
        height: 510px;
        border: 1px solid #25a4ff;
    }

    tr {
        text-align: center;
    }

    td {
        border: 0px solid #dddddd;
        padding: 8px;
    }

    th {
        padding: 8px;
        width: 50%;
        border-right: 2px solid #25a4ff;
        text-align: center;
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
        <form action="/reserve/remove" method="get">
            <table>
                <tr>
                    <th>
                        <strong>예약 번호</strong>
                    </th>
                    <td>
                        <c:out value="${reserve.reserve_no}"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>사이트</strong>
                    </th>
                    <td>
                        <c:out value="${reserve.camp_no}"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>예약날짜</strong>
                    </th>
                    <td>
<%--                        <fmt:formatDate value="${reserve.reserve_startDate}" pattern="yyyy-MM-dd" var="startDate" />--%>
<%--                        <fmt:formatDate value="${reserve.reserve_endDate}" pattern="yyyy-MM-dd" var="endDate" />--%>

<%--                        <p>${startDate} ~ ${endDate}</p>--%>
                        <p><c:out value="${reserve.reserve_startDate}"/> ~ <c:out value="${reserve.reserve_endDate}"/></p>
                    </td>
                </tr>
                <tr>
                    <th>
                        <STRONG>인원</STRONG>
                    </th>
                    <td>
                        <p><c:out value="${reserve.reserve_people}"/>명</p>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>가격</strong>
                    </th>
                    <td>
                        <p>₩ <c:out value="${reserve.reserve_price}"/></p>
                    </td>
                </tr>
            </table>
            <br/>
            <br/>
            <br/>
            <input type="hidden" id="inputValue_reserve_no" name="reserve_no" value="${reserve.reserve_no}">
            <input type="hidden" id="inputValue_mem_id" name="mem_id" value="<c:out value='${reserve.mem_id}'/>">
            <!-- 리다이렉션 오류로 임시 처리 -->

            <div align="center">
            <button onclick="goBack()">목록</button>
            <button type="button"><a href="/reserve/modify?reserve_no=${reserve.reserve_no}">수정</a></button>
            <button type="button" onclick="showAlertAndRedirect()">예약 취소</button>
            </div>
        </form>
    </section>
    <br/>
    <br/>
    <hr/>
    <br/>
    <br/>

<%-- 장비 렌탈 내역--%>
    <section>
        <div align="center">
            <h2>장비 렌탈 내역</h2>
        </div>
        <div>
            <%-- if를 사용해 장비에 렌탈 내역이 있으면 내역을 보여주고, 없으면 장비 렌텔 내역이 없습니다. 보여주기--%>
        </div>
    </section>
</div>

<script>
    function goBack() {
        window.history.back();
    }

    function showAlertAndRedirect() {
        // confirm 창 띄우기
        var confirmation = confirm("정말 예약을 취소하시겠습니까?");
        var reserve_no = document.getElementById("inputValue_reserve_no").value; // 입력된 값 가져오기
        var mem_id = document.getElementById("inputValue_mem_id").value; // 입력된 값 가져오기

        // 확인 버튼을 클릭한 경우에만 페이지 이동
        if (confirmation) {
            // 다른 페이지로 이동하기
            window.location.href = "/reserve/remove?reserve_no=" + reserve_no + "&mem_id=" + mem_id;
        }
    }
</script>

<%@include file="../includes/footer.jsp" %>
