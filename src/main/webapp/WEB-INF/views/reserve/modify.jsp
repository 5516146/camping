<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
        text-align: center;
    }

    th {
        padding: 8px;
        width: 50%;
        border-right: 2px solid #25a4ff;
    }

    a {
        color: inherit; /* 링크의 색을 부모 요소의 색으로 상속 */
        text-decoration: none; /* 링크의 밑줄 제거 */
    }


</style>
<!-- <img src="/resources/assets/img/main.jpg" class="img-fluid" alt="..."> -->
<div style="padding-top: 70px;">
    <div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
        <h1 class="text-white" style="font-family: 'Nanum Gothic'; font-weight: bold;">예약 수정</h1>
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
        <form action="/reserve/modify" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

            <table>
                <tr>
                    <th>
                        <strong>예약 번호</strong>
                    </th>
                    <td>
                        <input type="text" name="reserve_no" value="<c:out value='${reserve.reserve_no}'/>" readonly/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>사이트</strong>
                    </th>
                    <td>
                        <input type="text" value="<c:out value='${reserve.camp_no}'/>" readonly>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>예약날짜</strong>
                    </th>
                    <td>
                        <input type="text" value="<c:out value='${reserve.reserve_startDate}'/>" readonly> ~
                        <input type="text" value="<c:out value='${reserve.reserve_endDate}'/>"><br/>
                        <span>예약 날짜를 변경하시려면 예약 취소 후 다시 예약해주세요.</span>
                    </td>
                </tr>
                <tr>
                    <th>
                        <STRONG>인원</STRONG>
                    </th>
                    <td>
                        <p><input type="number" id="inputValue_res_people" name="reserve_people" min="1"
                               max="4" value="<c:out value='${reserve.reserve_people}'/>"> 명</p>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>가격</strong>
                    </th>
                    <td>
                            <p>₩ <input type="text" value="<c:out value='${reserve.reserve_price}'/>" readonly></p>
                    </td>
                </tr>
            </table>
            <br/>
            <br/>
            <br/>
            <div align="center">
            <button><a href="/reserve/getMem?mem_id=<c:out value='${reserve.mem_id}'/>">변경 취소</a></button>
            <button type="submit" onclick="showAlert()">수정 완료</button>
            <button type="reset">초기화</button>
            </div>
        </form>
    </section>
    <br/>
    <br/>
    <hr/>
    <br/>
    <br/>

</div>

<script>
    // alert 띄우기
    function showAlert() {
        // alert 창 띄우기
        alert("수정이 완료되었습니다.");
        document.querySelector("form").submit(); // 폼 제출
    }
</script>


<%@include file="../includes/footer.jsp" %>
