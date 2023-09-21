	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<c:set var="path" value="${pageContext.request.contextPath }" />
	<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:title" content="Final project : EpicTrip">
    <meta property="og:url" content="https://mrrobotcorp.github.io/project6_EpicTrip/">
    <meta property="og:image" content="https://mrrobotcorp.github.io/project6_EpicTrip//source/thumbnail.png">
    <meta property="og:description" content="4조 프로젝트 사이트 - EpicTrip">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="Final project : EpicTrip">
    <meta name="twitter:url" content="https://mrrobotcorp.github.io/project6_EpicTrip/">
    <meta name="twitter:image" content="https://mrrobotcorp.github.io/project6_EpicTrip//source/thumbnail.png">
    <meta name="twitter:description" content="4조 프로젝트 사이트 - EpicTrip">
    <meta name="description" content="4조 프로젝트 사이트 - EpicTrip">
    <meta name='keywords' content='project, EpicTrip, toy project, community, trip, tour'>

    <link rel="icon" href="./source/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="./source/apple-icon-180x180.png" sizes="180x180">
    <title>EpicTrip | 에픽트립</title>

    <link href="./css/headFoot.css" rel="stylesheet">
    <link href="./css/mypage.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.3/gsap.min.js"></script>
</head>

<body>
     <header>
        <nav>
            <a href="./EpicTrip"><img class="headLogo" src="./source/logo.png"></a>
            <div class="gnb">
                <ul class="gnbTab">
                    <li>
                        <a href="/Store"  class="store">여행상점</a>
                    </li>
                    <li>
                        <a href="/Community_Group"  class="community">커뮤니티</a>
                    </li>
                </ul>
                
					<%-- 로그인 되어 있을 경우 --%>
					<c:if test="${not empty user.userid}">
					    <div class="userHead">
					        <a href="/message"><img class="msgImg" src="./source/msg.png"></a>
					        <a href="/Mypage_mymain?userid=${user.userid}"><img class="userImg" src="./source/${user.image}.jpg"></a>
					        <ul class="userList">
					            <li>${user.name}</li>
					            <li><a href="/Mypage_mymain?userid=${user.userid}">마이페이지</a></li>
					            <c:if test="${user.auth == 'admin'}">
					                <li><a href="/Admin">관리자 일정</a></li>
					            </c:if>					            
					            <li><a href="/user/logout">로그아웃</a></li>
					        </ul>
					    </div>
					</c:if>
					
					<%-- 로그인 되어 있지 않을 경우 --%>
					<c:if test="${empty user.userid}">
					    <div class="account">
					        <a href="/login">로그인</a>
					        <a href="/join">회원가입</a>
					    </div>
					</c:if>

            </div>
        </nav>
    </header>

    <section>
        <div class="myWrap">
            <div class="myInner">
                <div class="mypageGnb">
                    <div class="mlInner">
                        <a href="/Mypage_mymain?userid=${user.userid}" class="mproname menuin">
                            <img class="mypimg" src="./source/${user.image}.jpg" alt="">
                            <div class="nameflag">
                                <span>${user.name}</span>
                        	<c:choose>
						        <c:when test="${user.userid == 'dudwo123' || user.userid == 'heoyoun38' || user.userid == 'dbsdk123' || user.userid == 'hPdnjs123'}">
		                                    <img src="./source/Lv_Max.png" alt="">
						        </c:when>
						        <c:otherwise>
		                                    <img src="./source/${levelInfo.grade_img}" alt="">
						        </c:otherwise>
					        </c:choose>
                            </div>
                        </a>
                        <ul>
                            <li>
                                <div class="menuin  pointbox">
                                    <img src="./source/mypoint.png" alt="">
                               		<span id="price"><fmt:formatNumber value="${user.point}" type="number" pattern="#,##0"/>P</span>
                                </div>
                            </li>
                            <li id="mysetting">
                                <a href="./Mypage_mysetting?userid=${user.userid}" class="menuin">
                                    <img src="./source/mysetting.png" alt="">
                                    <span>계정 설정</span>
                                </a>
                            </li>
                            <li id="mybill">
                                <a href="./Mypage_mybill?userid=${user.userid}" class="menuin">
                                    <img src="./source/mybill.png" alt="">
                                    <span>구매 내역</span>
                                </a>
                            </li>
                            <li id="myreview">
                                <a href="./Mypage_myreview?userid=${user.userid}" class="menuin">
                                    <img src="./source/myreview.png" alt="">
                                    <span>내 후기</span>
                                </a>
                            </li>
                            <li id="mygroup">
                                <a href="./Mypage_mygroup?userid=${user.userid}" class="menuin">
                                    <img src="./source/mygroup.png" alt="">
                                    <span>내 동행</span>
                                </a>
                            </li>
                            <li id="mycal">
                                <a href="./Mypage_mycal?userid=${user.userid}" class="menuin">
                                    <img src="./source/mycal.png" alt="">
                                    <span>내 일정</span>
                                </a>
                            </li>
                            <li id="mywish">
                                <a href="./Mypage_mywish?userid=${user.userid}" class="menuin">
                                    <img src="./source/mywish.png" alt="">
                                    <span>위시리스트</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="mypageCon">
                    <h1 class="mypageName">매너 등급 가이드</h1>
                    <div class="mmgide">
                        <div class="mmImgid">
                            <img src="./source/${user.image}.jpg" alt="">
                        </div>
                        <div class="mmnow">
                            <h1>@${user.userid} 님의 현황</h1>
                            <div class="mmnowbox">
                                <div class="mmnowMycon">
                                    <span>${levelInfo.cnt}</span>
                                    <p>좋아요</p>
                                </div>
                                <div class="mmLine"></div>
                                <div class="mmnowMycon">
                                    <span>${CompanionCnt}</span>
                                    <p>동행 글 갯수</p>
                                </div>
                                <div class="mmLine"></div>
                                <div class="mmnowMycon">
                                    <span>${ScheduleCnt}</span>
                                    <p>일정 글 갯수</p>
                                </div>
                                <div class="mmLine"></div>
                                <div class="mmnowMycon">
                                    <span>${ReviewCnt}</span>
                                    <p>후기 글 갯수</p>
                                </div>
                            </div>
			                <c:choose>
						        <c:when test="${user.userid == 'dudwo123' || user.userid == 'heoyoun38' || user.userid == 'dbsdk123' || user.userid == 'hPdnjs123'}">
		                            <div class="mmforyou">
		                                <div class="mmyourchal">
		                                    <p>나의 등급</p>
		                                    <span>에픽 운영자</span>
		                                    <img src="./source/Lv_Max.png" alt="">
		                                </div>
		                            </div>
						        </c:when>
						        <c:otherwise>
								   	<div class="mmforyou">
		                                <div class="mmyourchal">
		                                    <p>나의 등급</p>
		                                    <span>${levelInfo.grade_name}</span>
		                                    <img src="./source/${levelInfo.grade_img}" alt="">
		                                </div>
		                            </div>
						        </c:otherwise>
					        </c:choose>
                        </div>
                    </div>
                    <div class="manners">
                        <div class="gione">
                            <div class="howto">
                                <img src="./source/introduceguide.png" alt="">
                                <p class="fment">좋아요를 눌러 동행자의 매너를 평가해 보세요.</p>
                                <p class="sment">매너 등급을 올려 여행자들 간의 신뢰도를 쌓아보세요. </p>
                            </div>
                            <div class="gionement">
                                <p>매너 제도</p>
                                <h1 class="mguideh1">믿을만한 <br> 동행자와 함께 여행을..</h1>
                                <p class="mguidep">동행자의 매너 등급을 통해 안전하고 즐거운 여행을 경험해 보세요.</p>
                            </div>
                        </div>

                        <div class="gitwo">
                            <div class="gionement">
                                <p>매너 있는 동행자가 되는 길</p>
                                <h1 class="mguideh1">전설의 콜롬버스까지</h1>
                                <p class="mguidep">뻔한 여행은 저리가라! 하수 여행자 부터 전설의 콜롬버스까지 동행자들의 신뢰로 나의 등급을 올리자!</p>
                            </div>
                            <div class="mannerLevel">
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_0.png" alt="">
                                            <p>하수 여행자</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_1.png" alt="">
                                            <p>중수 여행자</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>20</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_2.png" alt="">
                                            <p>고수 여행자</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>50</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_3.png" alt="">
                                            <p>하수 콜롬버스</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>80</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_4.png" alt="">
                                            <p>중수 콜롬버스</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>100</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_5.png" alt="">
                                            <p>고수 콜롬버스</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>130</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_6.png" alt="">
                                            <p>대단한 콜롬버스</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>150</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_7.png" alt="">
                                            <p>엄청나 콜롬버스</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>200</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_8.png" alt="">
                                            <p>굉장해 콜롬버스</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>250</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_9.png" alt="">
                                            <p>전설의 콜롬버스</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>300~</p>
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                                                        <div class="gionement">
                                <p>여행자분들</p>
                                <h1 class="mguideh1">조심하세요!!</h1>
                                <p class="mguidep">싫어요가 많은 경우 기쁘지 않은 등급을 받게 될 수 있습니다!</p>
                            </div>
                            <div class="mannerLevelM">
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_-1.png" alt="">
                                            <p>아슬한 여행자</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>-1</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_-2.png" alt="">
                                            <p>위험한 여행자</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>-10</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mlb">
                                    <div class="mlbInner">
                                        <div class="lvimg">
                                            <img src="./source/Lv_-3.png" alt="">
                                            <p>없어질 여행자</p>
                                        </div>
    
                                        <div class="lvhow">
                                            <img src="./source/thumbsUp.png" alt="">
                                            <p>-30</p>
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                            <div class="lastment">
                                <p>🌍 즐겁고 안전한 여행을 위해 매너있게 행동합시다.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        </div>
        </div>

    </section>

    <footer>
        <img src="./source/logo_white.png">
        <p><a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a></p>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/mypage.js"></script>

</body>

</html>