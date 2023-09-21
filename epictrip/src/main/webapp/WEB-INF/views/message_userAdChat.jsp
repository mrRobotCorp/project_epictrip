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
        <div class="chatMemList">
            <p>현재 대화 상대</p>
            <div class="memandselmem">
                <div class="memPro">
                    <div class="member">
                        <a href="#">
                            <img src="./source/cAdmin.png" alt="">
                        </a>
                        <span>EpicTrip</span>
                        <p class="groupon"></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="selchat">
            <div></div>
            <div>
                <a href="/message" class="ms"><button id="memChat">채팅</button></a>
                <a href="/message_userAdChat" class="msA"><button id="adminChat">1:1 문의</button></a>
            </div>

        </div>
        <div class="chatandlist">
            <div class="chatList">
                <div class="chatListInner">
                    <h3>채팅목록</h3>
                    <div class="chatListinin">
                        <ul>
                            <div class="chatroom">
                                <img src="./source/cAdmin.png" alt="">
                                <div class="roominfo">
                                    <div class="roomtitle">
                                        <p>1:1 문의</p>
                                        <span>2</span>
                                    </div>
                                    <p class="lastMsg">네 고객님, 삭제해 드리겠습니다.</p>
                                    <div class="listmsgtime">
                                        <div></div>
                                        <span>19일전</span>
                                    </div>
                                </div>
                            </div>
                        </ul>
    
                    </div>
                </div>
            </div>
            <div class="chatBoard">
                <div class="chatWrap">
                    <div class="chatroomname">
                        <p>1:1 문의</p>
                        <span>2</span>
                    </div>
                    <div  class="chatInner">
                        <ul>
                            <li class="ment">
                                <p class="mentp">2023년 8월 16일</p>
                            </li>
                            <li class="ansarea">
                                <div class="ansprof">
                                    <img src="./source/cAdmin.png" alt="">
                                </div>
                                <div class=".chatCom">
                                    <p>에픽트립</p>
                                    <p class="ansInner">
                                        <span>무엇을 도와드릴까요?</span>
                                    </p>
                                </div>
                                <p class="sendDate">오후 5:30</p>
                            </li>
                            <li class="mychat">
                                <div class="mychatBlank"></div>
                                <div class="mychatTime">
                                    <p class="sendDate">오후 5:30</p>
                                </div>
                                <div class=".chatCom">
                                    <p class="mychatInner">
                                        <span>최근에 작성한 동행 게시글 삭제해주세요.</span>
                                    </p>
                                </div>
                            </li>
                            <li class="ansarea">
                                <div class="ansprof">
                                    <img src="./source/cAdmin.png" alt="">
                                </div>
                                <div class=".chatCom">
                                    <p>에픽트립</p>
                                    <p class="ansInner">
                                        <span>네 고객님, 삭제해 드리겠습니다.</span>
                                    </p>
                                </div>
                                <p class="sendDate">오후 5:31</p>
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
                <button class="sendBtn" id="sendButton"></button>
            </div>
        </div>





    </section>

    <footer>
        <img src="./source/logo_white.png">
        <p><a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a></p>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>


    <script src="./js/header.js"></script>
    <script src="./js/mesAPI.js"></script>

</body>

</html>