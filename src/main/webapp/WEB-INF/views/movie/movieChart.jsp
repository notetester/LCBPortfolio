<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 영화차트</title>
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/reset10.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style10.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/swiper.css">
    <link href="${pageContext.request.contextPath}/resources/css/includebootstrap.css" rel="stylesheet">
		<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
    


    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
        rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
   
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/movieChart.css">

          </head>
          <body>
        <%@ include file = "../include/header.jsp" %>
    <br>
    <br>
    <br>

    <!-- //banner -->


    <section id="movie">
        <div class="container">
            <div class="row">
                <h2 class="ir_so">영화 예매</h2>
                <div class="movie">
                    <div class="movie_title">
                        <ul class="clearfix">
                            <li class="active"><a href="#">박스오피스</a></li>
                            <li><a href="#">최신개봉작</a></li>

                        </ul>
                    </div>
                    <div class="movie_chart">
                        <div class="swiper-container2">
                            <div class="chart_cont1 swiper-wrapper">
                                <div >
                                    <!--class=  "swiper-slide"기능은 묶여있음 -->
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/반도.jpg" srcset="assets/img/반도.jpg 2x" alt="반도">

                                        </figure>

                                        <div class="rank"><strong>1</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>반도</strong></h3>
                                        <!-- 관람 설정 icon ( 1> all: 전체관람  2> a12: 12세 3> a15: 15tp 4> a19:19세-->
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=1">상세보기</a> <!-- 상세보기는 detail -->
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule?num=1">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/살아있다.jpg" srcset="assets/img/살아있다.jpg 2x" alt="살아있다">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>살아있다</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=4">상세보기</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule?num=4">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/밤쉘.jpg" srcset="assets/img/밤쉘.jpg 2x"
                                                alt="밤쉘: 세상을 바꾼 폭탄선언">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>밤쉘</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=5">상세보기</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule?num=5">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/소년시절.jpg" srcset="assets/img/소년시절.jpg 2x"
                                                alt="소년시절의 너">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>소년시절의 너</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=7">상세보기</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule?num=7">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/알라딘.jpg" srcset="assets/img/알라딘.jpg 2x"
                                                alt="알라딘">
                                        </figure>
                                        <div class="rank"><strong>5</strong></div>

                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람</span> <strong>알라딘</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=3">상세보기</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule?num=3">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont1-->

                        <div class="swiper-container2">
                            <div class="chart_cont2 swiper-wrapper">
                                <div>   <!--class=  "swiper-slide"기능은 묶여있음 -->
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/블루아워.jpg" srcset="블루아워.jpg 2x" alt="블루아워">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>블루아워</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=6">상세정보</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule?num=6">예매하기</a>
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/팬데믹.jpg" srcset="팬데믹.jpg 2x" alt="팬데믹">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>팬데믹</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=8">상세정보</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule?num=8">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/아디오스.jpg" srcset="아디오스.jpg 2x" alt="아디오스">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>아디오스</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=9">상세정보</a>
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule?num=9">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <div class="poster">
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/resources/img/온워드.jpg" srcset="반도.jpg 2x" alt="반도">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람</span> <strong>온워드</strong></h3>
                                        <div class="infor_btn">
                                            <a href="${pageContext.request.contextPath}/movie/movieDetail?mno=2">상세정보</a> 
                                            <a href="${pageContext.request.contextPath}/reserve/ticketSchedule?num=2">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                

                            </div>
                        </div>


                        <!-- //chart_cont4-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //movie -->
    <br>
    <br>
    <br>
    <!-- 자바스크립트 라이브러리 -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min_1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modernizr-custom.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/ie-checker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/movieChart.js"></script>
<%@ include file = "../include/footer.jsp" %>



</body>

</html>