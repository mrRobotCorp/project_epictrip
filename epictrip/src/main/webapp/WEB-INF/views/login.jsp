<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<%--  
복사
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<c:set var="path" value="${pageContext.request.contextPath }" />
	<fmt:requestEncoding value="utf-8" />


	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
--%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta property="og:title" content="Final project : EpicTrip">
<meta property="og:url"
	content="https://mrrobotcorp.github.io/project6_EpicTrip/">
<meta property="og:image"
	content="https://mrrobotcorp.github.io/project6_EpicTrip//source/thumbnail.png">
<meta property="og:description" content="4조 프로젝트 사이트 - EpicTrip">
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="Final project : EpicTrip">
<meta name="twitter:url"
	content="https://mrrobotcorp.github.io/project6_EpicTrip/">
<meta name="twitter:image"
	content="https://mrrobotcorp.github.io/project6_EpicTrip//source/thumbnail.png">
<meta name="twitter:description" content="4조 프로젝트 사이트 - EpicTrip">
<meta name="description" content="4조 프로젝트 사이트 - EpicTrip">
<meta name='keywords'
	content='project, EpicTrip, toy project, community, trip, tour'>

<link rel="icon" href="${path}/source/favicon-32x32.png" sizes="32x32">
<link rel="apple-touch-icon"
	href="${path}/source/apple-icon-180x180.png" sizes="180x180">
<title>EpicTrip | 에픽트립</title>

<link href="${path}/css/headFoot.css" rel="stylesheet">
<link href="${path}/css/login.css" rel="stylesheet">

</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.3/gsap.min.js"></script>

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

<section class="logJoinWrap">


<c:set var="login">home.login</c:set>
<c:set var="idsave">home.idsave</c:set>
<c:set var="start">home.start</c:set>
<c:set var="passwordfind">home.passwordfind</c:set>
<c:set var="signup">home.signup</c:set>
<c:set var="id">home.id</c:set>
<c:set var="pass">home.pass</c:set>


        <form method="post" class="logInner">
            <h1><fmt:message key="${login}"/></h1>
     
            <div class="logInput">
                <input type="text" value="" id="userid" name="userid" placeholder="<fmt:message key="${id}"/>"
                    onfocus="this.placeholder=''" onblur="this.placeholder='아이디'">
                <input type="password" value="" id="pass" name="pass" placeholder="<fmt:message key="${pass}"/>"
                    onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'">
            </div>
            <div class="checkAll">
                <div class="checkbox">
                    <input type="checkbox" id="saveId">
                    <label for="saveId"></label>
                    <span><fmt:message key="${idsave}"/></span>
                </div>
			<span class="langAll">
			    <input type="radio" name="lang" value="ko" id="langKor" class="lBtn">
			    <label for="langKor"></label>
			    <input type="radio" name="lang" value="en" id="langUs" class="lBtn">
			    <label for="langUs"></label>
			</span>
            </div>
            <input type="button" value="<fmt:message key="${start}"/>" class="logBtn">
            <div class="findJion">
                <a href="${path}/findAccount" class="find"><fmt:message key="${passwordfind}"/></a> 
                <a href="${path}/join"><fmt:message key="${signup}"/></a>
            </div>
        </form>
    </section>
	

	<footer>
		<img src="${path}/source/logo_white.png"> <a
			href="heoyoun38@naver.com">프로젝트 문의 heoyoun38@naver.com</a>
		<p>유선 상담 010-3329-3090</p>
		<p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
	</footer>
	<script src="${path}/js/header.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='lang']").change(function() {
	        // 선택한 언어 값을 가져옴
	        var selectedLanguage = $("input[name='lang']:checked").val();

	        // 서버로 언어 변경 요청을 보냄
	        $.ajax({
	            type: "get",
	            url: "changeLang?lang=" + selectedLanguage,
	            success: function(response) {
	                // 성공한 경우 페이지 새로 고침
	                window.location.reload();
	            },
	            error: function(error) {
	                console.log(error);
	            }
	        });
	    });
						$(".logBtn").click(function() {
							if($("#userid").val()==""){
								alert("아이디를 입력해 주세요")
							}else if($("#pass").val()==""){
								alert("비밀번호를 입력해 주세요")
							}else{
								loginCheck()
							}
							
						})
						$("#pass").keyup(function(key) {
							if (key.keyCode == 13) {
								loginCheck()
							}
						})

						
						// 저장한 쿠키를 가져오는 로직 
						function getCookie(name) {
							var value = "; " + document.cookie;
							var parts = value.split("; " + name + "=");
							if (parts.length === 2) {
								return parts.pop().split(";").shift();
							}
						}
						
						// 쿠키를 생성하는 로직
						function setCookie(name, value, days) {
						    var expires = "";
						    if (days) {
						        var date = new Date();
						        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
						        expires = "; expires=" + date.toUTCString();
						    }
						    document.cookie = name + "=" + (value || "") + expires + "; path=/";
						}
						

						// "myCookie"라는 이름의 쿠키 값을 가져와서 출력
						var cookieValue = getCookie("userCookie");
							if (cookieValue) {
								console.log("myCookie: " + cookieValue);
								$("#userid").val(cookieValue);
								$("#saveId").prop("checked", true);
							} else {
								console.log("쿠키 없어유");
								$("#saveId").prop("checked", false);
							}

							
							
						// 체크박스가 false일시 쿠키 삭제하겠다는 뜻
						$("#saveId").change(function() {
						    if (!$(this).prop("checked")) {
							    deleteCookie("userCookie");
							    $("#userid").val(""); // 입력 요소의 값을 비움
							}
						});
						
						// 쿠키 삭제 로직
						function deleteCookie(name) {
						    document.cookie = 
						    name + '=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
						}
						
						
						
						
						// 로그인 로직
						function loginCheck() {
							console.log($(".logInner").serialize());
							$.ajax({
								type : "post",
								url : "${path}/loginYN",
								data : $(".logInner").serialize(),
								dataType : "text",
								success : function(yn) {
									console.log(yn)
										if (yn == "로그인 성공") {
											alert(yn)
											window.location.href = "./EpicTrip";
											
											if ($("#saveId").prop("checked")) {
												setCookie("userCookie", $("#userid").val(), 7);
											}	
											
										}else {
											alert(yn)
										}
								},
								error : function(err) {
									console.log(err)
								}
							})
						}
						console.log("1")
						console.log(${userInfo.userid})
					})// document 괄호임
</script>
</html>