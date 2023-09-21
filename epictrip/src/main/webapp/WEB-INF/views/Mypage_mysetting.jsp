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
                    <h1 class="mypageName">계정 설정</h1>
                    <div class="line"></div>
                    <div class="myConIn">
                        <div class="proset">
                            <div class="userimname">
                                <div class="uEdit" onclick="openProImg()">
                                    <img class="userPro" src="./source/${user.image}.jpg" alt="">
                                    <img class="profEdit" src="./source/cmmtIco.png" alt="">  
                                </div>
                                <div class="changeImg">
                                    <div class="imgbox">
                                        <input type="radio" name="changeImg" id="img1">
                                        <label for="img1"><img src="./source/profImg1.jpg" alt=""></label>
    
                                        <input type="radio" name="changeImg" id="img2">
                                        <label for="img2"><img src="./source/profImg2.jpg" alt=""></label>
                                        
                                        <input type="radio" name="changeImg" id="img3">
                                        <label for="img3"><img src="./source/profImg3.jpg" alt=""></label>
                                        
                                        <input type="radio" name="changeImg" id="img4">
                                        <label for="img4"><img src="./source/profImg4.jpg" alt=""></label>
                                    </div>
                                    <div class="buttonBox">
                                        <button id="chImgcancle" onclick="climbox()">취소</button>
                                        <button id="chImgsave" onclick="saveAndCloseImageBox()">저장</button>
                                    </div>
                                </div>  
                                
                           	<c:choose>
						        <c:when test="${user.userid == 'dudwo123' || user.userid == 'heoyoun38' || user.userid == 'dbsdk123' || user.userid == 'hPdnjs123'}">
		                                    <p>에픽 운영자</p>
						        </c:when>
						        <c:otherwise>
		                                    <p>${leveltitle}</p>
						        </c:otherwise>
					        </c:choose>
                                <div class="mpnid">
                                    <div class="mpname"><span>${user.name}</span></div>
                                    <div class="mpuid"><span>@${user.userid}</span></div>
                                </div>


                            </div>
                            <div class="myintro">
                                <div class="myintTop">
                                    <p>소개글</p>
                                    <button type="button" class="cmmtBtn" onclick="chIntorduce()">수정</button>
                                </div>
                                <div class="cmmtBox">
                                    <textarea id="introTextarea" placeholder="소개글을 입력해주세요.(100자 이내)" readonly maxlength="100">${user.userintroduce}</textarea>
                                </div>
                            </div>
                            </div>
                            <div class="birgen">
                                <div class="mybirth">
                                    <p>생년월일</p>
                                    <span><fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd" /></span>
                                </div>
                                <div class="mygen">
                                    <p>성별</p>
                                    <span>${user.gender}</span>
                                </div>
                                <div class="mybirth">
                                    <p>휴대전화 번호</p>
                                    <span>${user.phnumber}</span>
                                </div>
                                <div class="mybirth">
                                    <p>가입일</p>
                                     <span><fmt:formatDate value="${user.joindate}" pattern="yyyy-MM-dd" /></span>
                                </div>
                            </div>
                            <div class="btns">
                                <div class="btnsIn">
                                    <button onclick="openchpwdmodal()">비밀번호 변경 <div class="arrow"></div></button>
                                    <!-- 
                                    <button onclick="openchpnummodal()">핸드폰 번호 변경<div class="arrow"></div></button>
                                     -->
	                                <button onclick="openquitmodal()">회원 탈퇴<div class="arrow"></div></button>
                                </div>

                            </div>
                    </div>
                </div>
            </div>
            <div class="mypaModal modalWrap">
                <div class="myMp">
                
                    <div class="chPwd">
                        <p class="modalname">비밀번호 변경</p>
                        <input class="passwordField" type="password" value="" id="pwd" name="pwd" placeholder="현재 비밀번호"
                        onfocus="this.placeholder=''" onblur="this.placeholder='현재 비밀번호'" maxlength="12">
                        <input class="passwordField" type="password" value="" id="newPwd" name="pwd" placeholder="비밀번호(8자~12자,영문+숫자+특수문자 사용)"
                        onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호(8자~12자,영문+숫자+특수문자 사용)'" maxlength="12">
                        <input class="passwordField" type="password" value="" id="pwdCk" name="pwdCk" placeholder="비밀번호 확인"
                        onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 확인'" maxlength="12">
                        <p class="mypgerrms" id="errform">비밀번호 형식이 올바르지 않습니다.</p>
                        <p class="mypgerrms" id="errPrepwd">입력하신 현재 비밀번호가 틀렸습니다.</p>
                        <p class="mypgerrms" id="errNopwd">비밀번호를 입력해주세요.</p>
                        <div class="modlabtn">
                            <button class="mychBtn" onclick="colsechpwd()">취소</button>
                            <button class="mychBtn" onclick="okchanpwd()">변경하기</button>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="phoneWrap mypaModal">
                <div class="myMp">
                    <div class="phoneModal">
                        <p class="modalname">전화번호 변경</p>
                        <div class="phoneInput">
                            <input type="number" value="" id="idPnum" name="pNum" placeholder="휴대폰 번호 (-없이 입력해주세요)"
                            onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호 (-없이 입력해주세요)'">
                            <button  onclick="msgCk()">인증 요청</button>
                        </div>
                        <p class="mypgerrms" id="nonepnum"></p>
    
                        <div class="phoneInput">
                            <input type="number" value="" id="idCode" name="code" placeholder="인증번호 입력"
                            onfocus="this.placeholder=''" onblur="this.placeholder='인증번호 입력'">
                            <button>인증 확인</button>
                        </div>
                        <!-- <p class="mypgerrms" id="wrongCode">인증번호가 일치하지 않습니다.</p> -->
                        <div class="modlabtn">
                            <button class="mychBtn" onclick="closePhoneModal()">취소</button>
                            <button class="mychBtn" onclick="changePhoneNumber()">변경하기</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mypaModal quitWrap">
                <div class="myMp">
                    <div class="quitInner">
                        <p>탈퇴하시면 그동안의 모든 데이터가 사라집니다. <br>
                            그래도 회원 탈퇴하시겠습니까?</p>
                        <div class="modlabtn">
                            <button class="mychBtn" onclick="closequitModal()">취소</button>
                            <button class="mychBtn" onclick="closequitModal(); withdrawAccount()">탈퇴하기</button>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/mypage.js"></script>

</body>

</html>