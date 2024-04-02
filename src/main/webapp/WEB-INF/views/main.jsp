<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

  <!-- ======= Hero Section ======= -->
<section id="hero" style="margin-top: 50px; height: 755px;">
    <div id="heroCarousel" data-bs-interval="3000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(/resources/assets/img/slide/main1.jpg); height: 755px;">
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(/resources/assets/img/slide/main2.jpg); height: 755px;">
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(/resources/assets/img/slide/main3.jpg); height: 755px;">
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev" style="text-decoration: none;">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next" style="text-decoration: none;">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>
  </section><!-- End Hero -->


  <main id="main">

    <!-- ======= My & Family Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2>My & Family</h2>
          <p>"별빛누리캠핑장"은 도심의 소란을 떠나, 자연 속에서의 평온한 휴식을 선사하는 곳입니다.<br>넓은 공간과 다양한 활동으로 자연을 만끽하며 새로운 경험을 쌓을 수 있는 곳입니다. 함께 힐링하고 휴식을 취하며 새로운 모험을 시작해보세요!</p>
        </div>

        <div class="row content">
          <div class="col-lg-6">
            <img src="/resources/assets/img/about.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <p>
            </p>
            <ul>
              <li><i class="ri-check-double-line"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat</li>
              <li><i class="ri-check-double-line"></i> Duis aute irure dolor in reprehenderit in voluptate velit</li>
              <li><i class="ri-check-double-line"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat</li>
            </ul>
            <p>
              Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
              velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
              culpa qui officia deserunt mollit anim id est laborum.
            </p>
            <a href="our-story.html" class="btn-learn-more">Learn More</a>
          </div>
        </div>

      </div>
    </section><!-- End My & Family Section -->

    <!-- ======= Features Section ======= -->
    <section id="features" class="features">
      <div class="container">

        <div class="row">
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-laptop"></i></div>
            <h4 class="title"><a href="">Lorem Ipsum</a></h4>
            <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-bar-chart"></i></div>
            <h4 class="title"><a href="">Dolor Sitema</a></h4>
            <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-bounding-box"></i></div>
            <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
            <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-broadcast"></i></div>
            <h4 class="title"><a href="">Magni Dolores</a></h4>
            <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-camera"></i></div>
            <h4 class="title"><a href="">Nemo Enim</a></h4>
            <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-diagram-3"></i></div>
            <h4 class="title"><a href="">Eiusmod Tempor</a></h4>
            <p class="description">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi</p>
          </div>
        </div>

      </div>
    </section><!-- End Features Section -->

    <!-- ======= Recent Photos Section ======= -->
    <section id="recent-photos" class="recent-photos">
      <div class="container">

        <div class="section-title">
          <h2>다양한 테마를 가진 캠핑존</h2>
        </div>
        <div class="recent-photos-slider swiper">
          <div class="swiper-wrapper align-items-center">
			<div class="swiper-slide"><a href="/resources/assets/img/카라반.jpeg" class="glightbox"><img src="/resources/assets/img/카라반.jpeg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/카라반2.jpeg" class="glightbox"><img src="/resources/assets/img/카라반2.jpeg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/샤워실(1).png" class="glightbox"><img src="/resources/assets/img/샤워실.png" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/탈의실.jpeg" class="glightbox"><img src="/resources/assets/img/탈의실.jpeg" class="img-fluid" alt=""></a></div>
          	<div class="swiper-slide"><a href="/resources/assets/img/B동.jpeg" class="glightbox"><img src="/resources/assets/img/B동.jpeg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/B동1.jpeg" class="glightbox"><img src="/resources/assets/img/B동1.jpeg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/C동.jpg" class="glightbox"><img src="/resources/assets/img/C동.jpg" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/그으을램핑.png" class="glightbox"><img src="/resources/assets/img/그으을램핑.png" class="img-fluid" alt=""></a></div>
			<div class="swiper-slide"><a href="/resources/assets/img/그으을램핑1.png" class="glightbox"><img src="/resources/assets/img/그으을램핑1.png" class="img-fluid" alt=""></a></div>
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section><!-- End Recent Photos Section -->

  </main><!-- End #main -->
<%@include file="includes/footer.jsp"%>
  