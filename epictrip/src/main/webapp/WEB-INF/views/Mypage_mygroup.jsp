<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
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

    <link rel="stylesheet" href="./css/slick.css" />
    <link rel="stylesheet" href="./css/slick_theme.css" />
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
                    <h1 class="mypageName">내 동행</h1>
                    <div class="slider">
						<c:forEach var="companion" items="${Companion}" varStatus="status">
						    <c:if test="${status.index % 6 == 0}">
						        <div class="groAll">
						    </c:if>
						
						    <a href="Community_GroDetail?cpkey=${companion.cpkey}" class="goDetail">
						        <div class="schOne" data-birth="<fmt:formatDate value="${companion.birth}" pattern="yyyy-MM-dd" />" 
						        data-startdate="<fmt:formatDate value="${companion.startDate}" pattern="yyyy-MM-dd" />" 
						        data-enddate="<fmt:formatDate value="${companion.endDate}" pattern="yyyy-MM-dd" />" 
						        data-gender="${companion.gender}">
						            <div class="schTopInfo">
						                <div class="schUser">
						                    <img src="/source/${companion.image}.jpg">
						                    <div>
						                        <span class="schNicK">${companion.name} &nbsp;&nbsp;|&nbsp;</span>
						                        <span>${age}대 • ${companion.gender}</span>
						                    </div>
						                </div>
						                <div class="schDays">
						                    <p>여행기간&nbsp;&nbsp;<span class="days">${daysCount}일</span></p>
						                    <p class="subTxt">
						                        <fmt:formatDate value="${companion.startDate}" pattern="yy-MM-dd" /> ~ 
						                        <fmt:formatDate value="${companion.endDate}" pattern="yy-MM-dd" />
						                    </p>
						                </div>
						            </div>
						            <div class="post post01">
						                <div class="postImg">
						                    <img src="/source/groupImg/${companion.cpImage}" alt="">
						                    <div class="hiddenBox">
						                        <p id="pCnt">모집중 | ${companion.cpNum}명</p>
						                        <div class="viewInner">
						                            <span class="viewCnt">${companion.hits}</span>
						                            <span class="chatCnt">${companion.currentNum}</span>
						                        </div>
						                    </div>
						                </div>
						            </div>
						            <div class="postBottom">
						                <h3 id="truncated">${companion.cpTitle}</h3>
						            </div>
						        </div>
						    </a>
						
						    <c:if test="${status.index % 6 == 5}">
						        </div>
						    </c:if>
						</c:forEach>
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
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="./js/slick.min.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/mypage.js"></script>
    <script type="text/javascript">
	    window.onload = function() {
	        // 1. 현재 날짜 가져오기
	        let currentDate = new Date();
	
	        // 모든 컴패니언 요소를 반복하며 나이와 여행 기간 계산
	        let companions = document.querySelectorAll('.schOne');
	        companions.forEach(function(companion) {
	            // 2. 태어난 날짜를 사용하여 나이 계산하기
	            let birthDate = new Date(companion.getAttribute('data-birth'));
	            let age = currentDate.getFullYear() - birthDate.getFullYear();
	            let adjust = currentDate.getMonth() < birthDate.getMonth() || 
	                         (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate()) ? -1 : 0;
	            age += adjust;
	            age = age - (age % 10);
	            let gender = companion.getAttribute('data-gender'); // gender 데이터 가져오기
	            companion.querySelector('.schNicK').nextElementSibling.textContent = age + "대 • " + gender;
	
	            // 3. 여행 시작 및 종료 날짜를 사용하여 여행 기간 계산하기
	            let startDate = new Date(companion.getAttribute('data-startdate')); 
	            let endDate = new Date(companion.getAttribute('data-enddate'));
	            let daysCount = Math.round((endDate - startDate) / (1000 * 60 * 60 * 24)) + 1;
	            companion.querySelector('.days').textContent = daysCount + "일";
	        });
	    }
    </script>

</body>

</html>