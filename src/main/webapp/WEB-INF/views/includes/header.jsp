<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>별빛 누리 캠핑장</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/style.css" rel="stylesheet">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  

  <!-- =======================================================
  * Template Name: MeFamily
  * Template URL: https://bootstrapmade.com/family-multipurpose-html-bootstrap-template-free/
  * Updated: Mar 17 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
    .logo a {
	  text-decoration: none;
	  font-size: 30px; 
	}
	
	.navbar ul li a,
	.navbar ul li ul li a {
	  text-decoration: none;
	}

    #header {
      box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); 
    }
    
    
  </style>
  
  
  <style> /* 내용폰트바꾸깃 */
    @font-face {
        font-family: 'Yogitae';
        src: url('/resources/assets/fonts/JALNAN2.OTF') format('truetype');
        /* resources 폴더 내의 fonts 폴더에 여기어때.ttf 파일이 있다고 가정합니다. */
    }
    h2 {
        font-family: 'Yogitae', sans-serif;
        /* "여기어때" 폰트를 사용하고, 사용할 수 없는 경우 sans-serif 폰트로 대체합니다. */
        font-weight: bold;
    }
</style>

  <style> /* 내용폰트바꾸깃 */
    @font-face {
        font-family: 'Yogitae';
        src: url('/resources/assets/fonts/JALNAN2.OTF') format('truetype');
        /* resources 폴더 내의 fonts 폴더에 여기어때.ttf 파일이 있다고 가정합니다. */
    }
    .text-white {
        font-family: 'Yogitae', sans-serif;
        /* "여기어때" 폰트를 사용하고, 사용할 수 없는 경우 sans-serif 폰트로 대체합니다. */
        font-weight: bold;
    }
</style>

 


<style>
    .dropdown a span {
        font-family: 'Yogitae', sans-serif;
        font-weight: bold;
        font-size: 16px;
    }
</style>

<!-- 내가저장한폰트 -->


</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="/">별빛누리캠핑장</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar" >
        <ul>
          <li><a class="active" href="/" style="font-weight: bold; font-size: 16px;">Home</a></li>
          <li class="dropdown"><a href="#"><span style="font-weight: bold; font-size: 16px;">캠핑장안내</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/info1">캠핑장 소개</a></li>
              <li><a href="/info2">이용수칙</a></li>
              <li><a href="/info3">요금정보</a></li>
              <li><a href="/info4">오시는길</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span style="font-weight: bold; font-size: 16px;">시설정보</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/siseol">배치도</a></li>
              <li><a href="/siseol2">캠핑동</a></li>
              <li><a href="/siseol3">글램핑동</a></li>
              <li><a href="/siseol4">카라반동</a></li>
              <li><a href="/siseol5">주변 시설</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="/reserve/site_choice"><span style="font-weight: bold; font-size: 16px;">예약하기</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/reserve/site_choice_camping">Drop Down 1</a></li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
            
          <li class="dropdown"><a href="#"><span style="font-weight: bold; font-size: 16px;">커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <a href="tour"><span style="font-weight: bold; font-size: 16px;">주변 관광지</span></a>
          <li><a href="#" style="font-weight: bold; font-size: 16px;">로그인</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->