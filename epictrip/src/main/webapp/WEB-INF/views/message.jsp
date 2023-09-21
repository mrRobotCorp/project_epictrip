<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <link href="./css/headFoot.css" rel="stylesheet">
    <link href="./css/message.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.3/gsap.min.js"></script>
    
</head>

<body data-userid="${loginUser.userid}" data-auth="${loginUser.auth}" data-name="${loginUser.name}"
 data-phnumber="${loginUser.phnumber}" data-gender="${loginUser.gender}" data-birth="${loginUser.birth}" 
 data-email="${loginUser.email}" data-point="${loginUser.point}" data-joindate="${loginUser.joindate}" data-image="${loginUser.image}">
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
        <div class="chatMemList">
            <p>채팅 참여 유저</p>
            <div class="memandselmem">
                <div class="memPro" id="memberArea">
                
                </div>
                <div class="selgroupMem">
				<button class="selMbtn" onclick="confirmAndOpenSelm()">
				    <img src="./source/addUser.png" alt="">
				    동행 확정하기
				</button>

                    <div class="selmModal" id="selmModal">
                        <div class="modalname">
                            <h1>동행 확정하기</h1>
                            <button id="closeSelm" onclick="closeSelm()"></button>
                        </div>
                        <div class="warnmsg">
                            <p>📢 현재 채팅방에 있는 회원만 노출됩니다.</p>
                        </div>
                        <span>확정할 상대 선택</span>

                    </div>
                </div>

            </div>
        </div>



        <div class="selchat">
            <div></div>
            <div>
               <!-- <a href="/message" class="ms"><button id="memChat">채팅</button></a> --> 
               <!--   <a href="/message_userAdChat" class="msA"><button id="adminChat">1:1 문의</button></a> -->
            </div>

        </div>
        <div class="chatandlist">
            <div class="chatList">
                <div class="chatListInner">
                    <h3>채팅목록</h3>
                    <div class="chatListinin">
                        <ul id="chatRoomListArea">

                        </ul>
                    </div>
                </div>
            </div>
            <div class="chatBoard">
                <div class="chatWrap">
					<div class="chatroomname">
                        <div>
                            <span id="chatTitle">채팅방을 선택해주세요</span>
                            <span></span>
                        </div>
                        <button id="exitButton" type="button">나가기</button>
                    </div>

                    <div  class="chatInner" id="chatInnerId">
                        <ul id="messageArea">

                            <li class="ansarea">

                            </li>
                            <li class="mychat"  >

                            </li>
    
                        </ul>
    
                    </div>
                </div>
            </div>
        </div>
        <div class="sendflex">
            <div></div>
            <div class="sendMs">
                <textarea placeholder="메세지를 입력해주세요." class="msArea" id="messageTextarea"></textarea>
                <button class="sendBtn" id="sendButton" onclick="sendMessage()"></button>
            </div>
        </div>

        <div class="memMpModal">
            <div class="memMp">
                <div class="memMpclose">
                    <div></div>
                    <button onclick="memMpclose()"></button>
                </div>
                <div class="memMpInner">
                    <div class="memIninfo">
                        <div class="memimgLv">
                            <img src="./source/profImg1.jpg" class="profile">
                            <img src="./source/Lv_0.png" class="level">
                        </div>
                        <div class="lvandN">
                            <p>초보 여행자</p>
                            <div class="memMoidname">
                                <div class="memMoname"><span>신혜원</span></div>
                                <div class="memMoid"><span>@hyewon01</span></div>
                            </div>
                        </div>
                        <div class="recoBtn">
                            <button class="goodMem" value="0"></button>
                            <div class="reconBtnline"></div>
                            <button class="badMem" value="0"></button>
                        </div>
                        <input type="hidden" value="${userInfo.userid}" id="logUserId">
                    </div>
                    <div class="myintroduce">
                        <p>소개글</p>
                        <div class="myintroin">
                            <span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Saepe, dicta autem molestiae et esse magni</span>
                        </div>
                    </div>
                    <div class="subgb">
                        <div class="ageGen">
                            <div class="mybirth">
                                <p>나이</p>
                                <span>20대</span>
                            </div>
                            <div class="mygen">
                                <p>성별</p>
                                <span>여자</span>
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
        <p onclick="memMpBox()">유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>

	<script>
	    const loggedInUserId = "${loginUser.userid}";
	 // 쿼리 스트링 값 추출
	    function getUrlParameter(name) {
	        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
	        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
	        var results = regex.exec(location.search);
	        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
	    }
	    // 동행 신청하기 버튼 유효성 검사
	    function confirmAndOpenSelm() {
	        var urlUserId = getUrlParameter('userid');
	        var sessionUserId = "${user.userid}"; 
	        if (urlUserId === sessionUserId) {
	            openSelm();
	        } else if(urlUserId === "") {
	            alert('채팅방에 입장 후에 신청할 수 있습니다.');
	        } else {
	            alert('작성자만 동행 신청 할 수 있습니다.');
	        } 
	    }
	</script>


	</script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/mes.js"></script>

</body>
<script type="text/javascript">


</script>
</html>