<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 이민진 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>드림즈</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="/dreams_project_2/resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="/dreams_project_2/resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="/dreams_project_2/resource/css/common/common.css">
    <link rel="stylesheet" href="/dreams_project_2/resource/css/common/header.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="/dreams_project_2/resource/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- header.js -->
    <script src="/dreams_project_2/resource/js/common/header.js"></script>
</head>
<div class="wrap">
    <!-- 상단 이동 헤더 -->
    <div id="header"></div>
    <body>
        <div class="container-fluid container-box">
            <header>
                <div class="header-top">
                    <div class="top-box">
                        <div class="right">
                            <ul>
                                <li><a href="/dreams_project_2/resource/page_6/myPage.html">마이페이지</a></li>
                                <li><a href="/dreams_project_2/resource/page_1/login.html">로그인</a></li>
                                <li><a href="/dreams_project_2/resource/page_1/join.html">회원가입</a></li>
                                <li><a href="/dreams_project_2/resource/page_4/qna.html">안내 및 Q&A</a></li>
                                <li><a href="https://www.youtube.com/results?search_query=%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8" target="_blank">
                                        <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/common/top_sns1.png"
                                            alt="youtube">
                                    </a></li>
                                <li><a href="https://www.instagram.com/explore/tags/%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8/top/" target="_blank">
                                        <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/common/top_sns2.png"
                                            alt="instagram">
                                    </a></li>
                                <li><a href="https://www.facebook.com/watch/sbsdrama.official/2552511298297818/" target="_blank">
                                        <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/common/top_sns3.png"
                                            alt="facebokk">
                                    </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="header-bottom">
                    <nav>
                        <h2>
                            <a href="./index.html">
                                <img src="/dreams_project_2/resource/image/logoSmall.png" style="width: 100%;" alt="logoSmall">
                            </a>
                        </h2>
                        <!-- pc -->
                        <ul id="menu_box" class="menu-box">
                            <li>
                                <a href="/dreams_project_2/resource/page_6/Introduce.html">DREAMS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="/dreams_project_2/resource/page_6/Introduce.html">드림즈 소개</a></li>
                                    <li><a href="/dreams_project_2/resource/page_6/stadium.html">구장안내</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="/dreams_project_2/resource/page_4/players.html">PLAYERS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="/dreams_project_2/resource/page_4/players.html">선수</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/coaching.html">코칭스태프</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/steff.html">구단관계자</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">GAMES</a>
                                <ul class="menu-son display-none">
                                    <li><a href="/dreams_project_2/resource/page_3/games.html">경기일정 및 결과</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">STATS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="#">팀순위</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="/dreams_project_2/resource/page_5/productList.html">GOODS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="/dreams_project_2/resource/page_5/productList.html">야구용품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="/dreams_project_2/resource/page_4/news.html">BOARDS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="/dreams_project_2/resource/page_4/news.html">구단소식</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/dreamsBoard.html">영웅게시판</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/qna.html">다운로드</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/qna.html">응원단</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/qna.html">안내 및 Q&A</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="/dreams_project_2/resource/page_2/ticketFee.html">TICKET</a>
                                <ul class="menu-son display-none">
                                    <li><a href="/dreams_project_2/resource/page_2/ticketFee.html">일일티켓</a></li>
                                    <li><a href="/dreams_project_2/resource/page_2/DreamsMembership.html">멤버쉽</a></li>
                                    <li><a href="/dreams_project_2/resource/page_2/groupViewing.html">단체관람</a></li>
                                    <li><a href="/dreams_project_2/resource/page_2/skybox.html">스카이박스</a></li>
                                </ul>
                            </li>
                        </ul>

                        <!-- mobile -->
                        <ul id="mo-menu-box" class="mo-menu-box">
                            <li style="position: relative;">
                                <div class="home-box">
                                    <a href="#">HOME</a>
                                    <a href="/dreams_project_2/resource/page_6/myPage.html">마이페이지</a>
                                    <a href="/dreams_project_2/resource/page_1/login.html">로그인</a>
                                    <a href="/dreams_project_2/resource/page_1/join.html">회원가입</a>
                                </div>
                            </li>
                            <li>
                                <a href="#">DREAMS</a>
                                <ul class="menu-son">
                                    <li><a href="/dreams_project_2/resource/page_1/test.html">드림즈 소개</a></li>
                                    <li><a href="/dreams_project_2/resource/page_6/stadium.html">구장안내</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">PLAYERS</a>
                                <ul class="menu-son">
                                    <li><a href="/dreams_project_2/resource/page_4/players.html">선수</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/coaching.html">코칭스태프</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/steff.html">구단관계자</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">GAMES</a>
                                <ul class="menu-son">
                                    <li><a href="/dreams_project_2/resource/page_3/games.html">경기일정 및 결과</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">STATS</a>
                                <ul class="menu-son">
                                    <li><a href="#">팀순위</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">GOODS</a>
                                <ul class="menu-son">
                                    <li><a href="/dreams_project_2/resource/page_5/productList.html">야구용품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">BOARDS</a>
                                <ul class="menu-son ">
                                    <li><a href="/dreams_project_2/resource/page_4/news.html">구단소식</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/dreamsBoard.html">영웅게시판</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/qna.html">다운로드</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/qna.html">응원단</a></li>
                                    <li><a href="/dreams_project_2/resource/page_4/qna.html">안내 및 Q&A</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">TICKET</a>
                                <ul class="menu-son ">
                                    <li><a href="/dreams_project_2/resource/page_2/ticketFee.html">일일티켓</a></li>
                                    <li><a href="/dreams_project_2/resource/page_2/DreamsMembership.html">멤버쉽</a></li>
                                    <li><a href="/dreams_project_2/resource/page_2/groupViewing.html">단체관람</a></li>
                                    <li><a href="/dreams_project_2/resource/page_2/skybox.html">스카이박스</a></li>
                                </ul>
                            </li>
                            <div class="ul-bg"></div>
                        </ul>
                    </nav>
                    <div id="menu_bg" class="menu-bg display-none"></div>
                    <div id="left-bg" class="left-bg"></div>
                    <div id="son-menu-bg" class="son-menu-bg"></div>

                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" id="icon"
                        class="bi bi-list icon" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                    </svg>
                </div>
            </header>
        </div>
    </body>
</div>
</html>