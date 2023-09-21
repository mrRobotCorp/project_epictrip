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
    <link href="./css/find.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

    <section class="findWrap">
            <div class="findInner">
                <h1>계정찾기</h1>
                <div class="selectOption">
                    <button id="findIdButton" class="active">아이디 찾기</button>
                    <button id="findPasswordButton">비밀번호 찾기</button>
                </div>
                <div class="test">
                    <div class="testInner id">
                        <input type="text" value="" id="idName" name="name" placeholder="이름"
                        onfocus="this.placeholder=''" onblur="this.placeholder='이름'">
                            <div class="sendCode">
				                <input type="number" value="" id="idPnum" name="pNum" placeholder="휴대폰 번호 (-없이 입력해주세요)" 
				                onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호 (-없이 입력해주세요)'">
				                <input type="button" value="인증 요청" onclick="codeCk('idPnum')">
				            </div>
				            <div class="sendCode">
				                <input type="number" value="" id="idCode" name="code" placeholder="인증번호 입력" 
				                onfocus="this.placeholder=''" onblur="this.placeholder='인증번호 입력'">
				                <input type="button" value="인증 확인" onclick="checkMsg('idCode')">
				            </div>
                        <button id="idFindBtn">아이디 찾기</button>
                    </div>
                    <div class="testInner pwd">
                        <input type="text" value="" id="pwdId" name="id" placeholder="아이디"
                        onfocus="this.placeholder=''" onblur="this.placeholder='아이디'" maxlength="16">

				            <div class="sendCode">
				                <input type="number" value="" id="pwdPnum" name="pNum" placeholder="휴대폰 번호 (-없이 입력해주세요)" 
				                onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호 (-없이 입력해주세요)'">
				                <input type="button" value="인증 요청" onclick="codeCk('pwdPnum')">
				            </div>
				
				            <div class="sendCode">
				                <input type="number" value="" id="pwdCode" name="code" placeholder="인증번호 입력" o
				                nfocus="this.placeholder=''" onblur="this.placeholder='인증번호 입력'">
				                <input type="button" value="인증 확인" onclick="checkMsg('pwdCode')">
				            </div>
                        <button id="pwdFindBtn">비밀번호 찾기</button>
                    </div>
                </div>
            </div>
    </section>

    <footer>
        <img src="./source/logo_white.png">
        <a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>

    <script src="./js/header.js"></script>
    <script src="./js/find.js"></script>
	<script>
	$(document).ready(function() {
	    $('#idFindBtn').click(function() {
	        const name = $('#idName').val();
	        const phnumber = $('#idPnum').val();
			// 아이디 찾기 로직
	        $.ajax({
	            type: 'POST',
	            url: '/findUserId',
	            data: JSON.stringify({ name: name, phnumber: phnumber }),
	            contentType: 'application/json',
	            success: function(response) {
	                alert(response.result);
	            },
	            error: function() {
	                alert('이름과 전화번호를 확인해주세요');
	            }
	        });
	    });
		
	    $('#pwdFindBtn').click(function() {
	        const userid = $('#pwdId').val();
	        const phnumber = $('#pwdPnum').val(); 
			// 비밀번호 찾기 로직
	        $.ajax({
	            type: 'POST',
	            url: '/findUserPassword',
	            data: JSON.stringify({ userid: userid, phnumber: phnumber }),
	            contentType: 'application/json',
	            success: function(response) {
	                alert(response.result);
	            },
	            error: function() {
	                alert('아이디와 전화번호를 확인해주세요');
	            }
	        });
	    });
	});
	</script>

    
</body>

</html>