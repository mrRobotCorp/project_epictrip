!Templates.jsp20xhtmlxml.content!
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
    <link rel="apple-touch-icon" href="${path}/source/apple-icon-180x180.png" sizes="180x180">
    <title>EpicTrip | 에픽트립</title>
    
    <link href="./css/headFoot.css" rel="stylesheet">
    <link href="./css/store.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/slick.css" />
    <link rel="stylesheet" href="./css/slick_theme.css" />
    	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
        <h3>나라별 여행지</h3>
        <div class="ctryBanner">
            <a href="Store_List?country=대만" class="ctry">
                <img src="./source/cG_bg10.jpg" class="ctryBg">
                <div class="ctryTxt">
                    <h4>대만</h4>
                    <p><span class="sCnt" id="a"></span>개의 상품 > </p>
                </div>
            </a>

            <a href="Store_List?country=홍콩" class="ctry">
                <img src="./source/cG_bg9.jpg" class="ctryBg">
                <div class="ctryTxt">
                    <h4>홍콩</h4>
                    <p><span class="sCnt" id="b"></span>개의 상품 > </p>
                </div>
            </a>

            <a href="Store_List?country=한국" class="ctry">
                <img src="./source/cG_bg7.jpg" class="ctryBg">
                <div class="ctryTxt">
                    <h4>한국</h4>
                    <p><span class="sCnt" id="c"></span>개의 상품 > </p>
                </div>
            </a>

            <a href="Store_List?country=마카오" class="ctry">
                <img src="./source/cG_bg13.jpg" class="ctryBg">
                <div class="ctryTxt">
                    <h4>마카오</h4>
                    <p><span class="sCnt" id="d"></span>개의 상품 > </p>
                </div>
            </a>

            <a href="Store_List?country=일본" class="ctry">
                <img src="./source/cG_bg10.jpg" class="ctryBg">
                <div class="ctryTxt">
                    <h4>일본</h4>
                    <p><span class="sCnt" id="e"></span>개의 상품 > </p>
                </div>
            </a>

            <a href="Store_List?country=중국" class="ctry">
                <img src="./source/cG_bg2.jpg" class="ctryBg">
                <div class="ctryTxt">
                    <h4>중국</h4>
                    <p><span class="sCnt" id="f"></span>개의 상품 > </p>
                </div>
            </a>

            <a href="Store_List?country=몽골" class="ctry">
                <img src="./source/cG_bg12.jpg" class="ctryBg">
                <div class="ctryTxt">
                    <h4>몽골</h4>
                    <p><span class="sCnt" id="g"></span>개의 상품 > </p>
                </div>
            </a>
        </div>

        
        <div class="slider">
            <div class="bn01 bn">
                <div class="bContent01 bContent ">
                    <p>몽골 기획전 오픈</p>
                </div>
            </div>
            <div class="bn02 bn">
                <div class="bContent02 bContent ">
                    <p>홍콩 에어텔 보러가기</p>
                </div>
            </div>
            <div class="bn03 bn">
                <div class="bContent03 bContent ">
                    <p>마카오로 떠나는 에픽트립</p>
                </div>
            </div>
            <div class="bn04 bn">
                <div class="bContent04 bContent ">
                    <p>오사카 시티투어</p>
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
    <script src="./js/store.js"></script>
</body>
<!-- 화면단 -->
<script type="text/javascript">
    var countryInfo = ${countryCntJson};
    console.log(countryInfo);

    $("#a").text(countryInfo.대만)
    $("#b").text(countryInfo.홍콩)
    $("#c").text(countryInfo.한국)
    $("#d").text(countryInfo.마카오)
    $("#e").text(countryInfo.일본)
    $("#f").text(countryInfo.중국)
    $("#g").text(countryInfo.몽골)
    // 이제 변수들을 사용하여 원하는 방식으로 화면에 출력하거나 조작할 수 있습니다.
</script>


</html>