<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>
<!-- <img src="/resources/assets/img/main.jpg" class="img-fluid" alt="..."> -->
<div style="padding-top: 70px;">
	<div style="background-image: url('/resources/assets/img/main.jpg'); background-size: cover; background-position: center; height: 270px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding-top: 30px;">
    	<h1 class="text-white" style="font-family: 'Nanum Gothic'; font-weight: bold;">시설정보</h1>
	</div>
</div>





<!-- -->
<section id="about" class="about">
    <div class="container">
        <div class="section-title">
            <h2>캠핑동</h2>
            <br/>
            <br/>
            <h3>캠핑 A동</h3>
            <!-- 이미지 클릭시 모달 -->
            <img src="/resources/assets/img/캠피잉.jpeg" class="img-fluid resized-img" alt="..." onclick="openModal('modal1', '/resources/assets/img/캠피잉.jpeg')">
            <img src="/resources/assets/img/캠피잉2.jpeg" class="img-fluid resized-img" alt="..." onclick="openModal('modal2', '/resources/assets/img/캠피잉2.jpeg')">
            <img src="/resources/assets/img/캠핑장.png" class="img-fluid resized-img" alt="..." onclick="openModal('modal3', '/resources/assets/img/캠핑장.png')">
            
             <br/>
            <br/>
            <h3>캠핑 B동</h3>
            <!-- 이미지 클릭시 모달 -->
            <img src="/resources/assets/img/B동.jpeg" class="img-fluid resized-img" alt="..." onclick="openModal('modal1', '/resources/assets/img/B동.jpeg')">
            <img src="/resources/assets/img/B동(1).jpeg" class="img-fluid resized-img" alt="..." onclick="openModal('modal2', '/resources/assets/img/B동(1).jpeg')">
            <img src="/resources/assets/img/B동(2).jpeg" class="img-fluid resized-img" alt="..." onclick="openModal('modal3', '/resources/assets/img/B동(2).jpeg')">
            
             <br/>
            <br/>
            <h3>캠핑 C동</h3>
            <!-- 이미지 클릭시 모달 -->
            <img src="/resources/assets/img/C동.jpg" class="img-fluid resized-img" alt="..." onclick="openModal('modal1', '/resources/assets/img/C동.jpg')">
            <img src="/resources/assets/img/C동(1).jpg" class="img-fluid resized-img" alt="..." onclick="openModal('modal2', '/resources/assets/img/C동(1).jpg')">
            <img src="/resources/assets/img/C동(2).jpeg" class="img-fluid resized-img" alt="..." onclick="openModal('modal3', '/resources/assets/img/C동(2).jpeg')">

            <div id="modal2" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('modal2')">&times;</span>
                    <img class="img-fluid" id="img2">
                </div>
            </div>
            
            <div id="modal3" class="modal">
                <div class="modal-content" onclick="closeModal('modal3')">
                    <span class="close" onclick="closeModal('modal3')">&times;</span>
                    <img class="img-fluid" id="img3">
                </div>
            </div>
        </div>
    </div>
</section>


<style>
    .resized-img {
        width: 300px; /* 가로 크기를 조정 */
        height: 300px; /* 세로 크기를 가로 크기와 동일하게 설정 */
        object-fit: cover; /* 이미지를 화면에 꽉 채우도록 설정 */
        cursor: pointer; /* 포인터 커서로 변경하여 사용자에게 클릭 가능함을 보여줌 */
    }

    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
    }

    .modal-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        max-width: 500px;
        max-height: 500px;
        cursor: pointer;
        background-color: rgba(0, 0, 0, 0.9); /* 모달 내용의 배경색을 지정 */
    }

    .close {
        position: absolute;
        top: 15px;
        right: 35px;
        color: #fff;
        font-size: 30px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: #bbb;
        text-decoration: none;
        cursor: pointer;
    }
</style>

<script>
    // 모달 열기
    function openModal(modalId, imgSrc) {
        var modal = document.getElementById(modalId);
        var img = modal.querySelector('img');
        img.src = imgSrc;
        modal.style.display = "block";
        document.body.style.overflow = "hidden"; // 모달이 열릴 때 스크롤 방지

        // 모달 외부 영역을 클릭했을 때 닫히도록 이벤트 리스너 추가
        modal.addEventListener('click', function(event) {
            if (event.target === modal) {
                closeModal(modalId);
            }
        });
    }

    // 모달 닫기
    function closeModal(modalId) {
        var modal = document.getElementById(modalId);
        modal.style.display = "none";
        document.body.style.overflow = "auto"; // 모달이 닫힐 때 스크롤 재개
    }
</script>




<%@include file="includes/footer.jsp"%>

