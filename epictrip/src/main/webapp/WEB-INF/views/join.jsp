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

    <link rel="icon" href="${path}/source/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="${path}/source/apple-icon-180x180.png" sizes="180x180">
    <title>EpicTrip | 에픽트립</title>

    <link href="${path}/css/headFoot.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/css/join.css">
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
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
    <section class="logJoinWrap">
        <div class="joinInner">
            <h1>회원가입</h1>
            <p>입력사항 (필수)</p>
            <div class="joinInput">
                <input type="text" value="" id="id" name="userid" placeholder="아이디 입력"
                onfocus="this.placeholder=''" onblur="this.placeholder='아이디 입력'" maxlength="16">
                <p id="idCheck" class="msg errMsg"></p>
                
                <input type="password" value="" id="pass" name="pass" placeholder="비밀번호(8자~12자, 영문+숫자+특수문자 사용)"
                onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호(8자~12자, 영문+숫자+특수문자 사용)'" maxlength="12">
                <p id="pwdCheck" class="msg errMsg"></p>
                
                <input type="password" value="" id="pwdCk" name="pwdCk" placeholder="비밀번호 재입력"
                onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 재입력'" maxlength="12">
                <p id="pwddbCheck" class="msg errMsg"></p>
                
                <input type="text" name="name" id="name" placeholder="이름"
                onfocus="this.placeholder=''" onblur="this.placeholder='이름'">
                <p id="nameCheck" class="msg errMsg"></p>
                <input type="text" name="email" id="email" placeholder="이메일"
                onfocus="this.placeholder=''" onblur="this.placeholder='이메일'">
                <p id="emailCheck" class="msg errMsg"></p>
                
                
                
                <div class="phone">
                    <input type="number" name="phoneNum" id="phoneNum" placeholder="휴대폰 번호 (-없이 입력해주세요)"
                    onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호 (-없이 입력해주세요)'">
                    <input type="button" class="phoneNumCk" value="인증번호 발송" onclick="codeCk()">
                    <!-- onclick="codeCk()" : 인증코드 인풋창 나오게 하는 함수 -->
                </div>
                <div class="phone codeCk">
                    <div class="codeWrap">
                        <div class="codeInner">
                            <input type="number" name="code" id="code" placeholder="인증번호"
                            onfocus="this.placeholder=''" onblur="this.placeholder='인증번호'">
                            <input type="button" class="phoneNumCk" value="인증번호 확인" onclick="checkMsg()">
                        </div>
                        <p id="codeCheck" class="msg errMsg"></p>
                    </div>




                </div>
                <details class="custom-select">
                    <summary class="radios first">
                        <input type="radio" name="item" id="default" title="성별" checked>
                        <input type="radio" name="item" id="item1" title="여자" value="여">
                        <input type="radio" name="item" id="item2" title="남자" value="남">
                    </summary>
                    <ul class="list">
                        <li><label for="default">성별</label></li>
                        <li> <label for="item1"> 여자</label></li>
                        <li><label for="item2">남자</label></li>
                    </ul>
                </details>
                <input type="date" name="birth" id="birth">
                <div class="agreeForm">
                    <div class="allAgree">
                        <input type="checkbox" name="check_all" class="ckAgree" id="allAgree"> 
                       <label for="allAgree"></label>
                       <p>이용약관 전체 동의</p>
                    </div>
                    <div class="agree">
                        <input type="checkbox" name="agree"class="ckAgree" id="fAgree">
                        <label for="fAgree"></label>
                        <p>(필수) 서비스 이용약관 동의</p>

                    </div>
                    <div class="agree">
                        <input type="checkbox" name="agree" class="ckAgree" id="sAgree">
                        <label for="sAgree"></label>
                        <p>(필수) 개인정보처리방침 동의</p>

                    </div>
                    <div class="agree">
                        <input type="checkbox" name="agree" class="ckAgree" id="tAgree">
                        <label for="tAgree"></label>
                        <p>(필수) 위치기반서비스 동의</p>

                    </div>
                    <div class="agree">
                        <input type="checkbox" name="agree" class="ckAgree" id="foAgree">
                        <label for="foAgree"></label>
                        <p>(선택) 마케팅 정보 활용 동의</p>

                    </div>
                    <div class="agree">
                        <input type="checkbox" name="agree" class="ckAgree" id="fiAgree">
                        <label for="fiAgree"></label>
                        <p>(필수) 만 14세 이상입니다</p>

                    </div>
                </div>
            </div>
            <button class="joinBtn" id="joinBtn">회원가입</button> 
            <div class="modalWrap">
                <div class="modalInner">
                    <div class="errModal">
                        <p>휴대폰 번호를 올바르게 입력해주세요.</p>
                        <button class="errModalBtn" onclick="msgCk()">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<footer>
    <img src="${path}/source/logo_white.png">
    <a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a>
    <p>유선 상담 010-1234-1234</p>
    <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
</footer>


<script type="text/javascript">
var allTrue = false;
function valId(id) { //아이디
    const idPattern = /^[A-Za-z0-9]{8,}$/;
    return idPattern.test(id);
}
function valPass(password) { //비밀번호
    const passPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@!#$?/]).{8,}$/;
    return passPattern.test(password);
}
function valemail(email) { //이메일
    const emailPattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
    return emailPattern.test(email);
}
var regex = /^[가-힣]+$/;



$(document).ready(function() {
		// 이름
		$("#name").keyup(function(){
			if (regex.test($(this).val())) {
		        $("#nameCheck").text("올바른 형식입니다.").removeClass("errMsg");
		        allTrue = true
			} else {
		        $("#nameCheck").text("한글만 입력해주세요.").addClass("errMsg");
		        allTrue = false
			}
		})
		// 비밀번호
	   $("#pass").keyup(function() {
		      const password = $(this).val();
		      if (valPass(password)) {
		        $("#pwdCheck").text("사용할 수 있는 비밀번호 입니다.").removeClass("errMsg");
		        allTrue = true
		      } else if($("#pass").val()==""){
		         $("#pwdCheck").text(" ").addClass("errMsg");
		         allTrue = false
		      }else{
		         $("#pwdCheck").text("영문, 숫자, 특수기호(@,!,#,$,?,/)포함 8글자 이상").addClass("errMsg");
		         allTrue = false
		      }
		   });
		// 비밀번호 확인
	   $("#pwdCk").keyup(function() {
		      if ($("#pwdCk").val()==$("#pass").val()) {
		        $("#pwddbCheck").text("확인").removeClass("errMsg");
		        allTrue = true
		      } else if($("#pass1").val()==""){
		         $("#pwddbCheck").text("비밀번호가 일치하지 않습니다.").addClass("errMsg");
		         allTrue = false
		      }else {
		         $("#pwddbCheck").text("비밀번호가 일치하지 않습니다.").addClass("errMsg");
		         allTrue = false
		      }
		   });
	
	   // 이메일
	   $("#email").keyup(function() {
		      const email = $(this).val();
		      if (valemail(email)) {
		        $("#emailCheck").text("사용 가능한 이메일입니다.").removeClass("errMsg");
		        allTrue = true
		      } else if(email==""){
		         $("#emailCheck").text("").addClass("errMsg");
		         allTrue = false
		      } else {
		         $("#emailCheck").text("이메일이 정상적이지 않습니다.").addClass("errMsg");
		         allTrue = false
		      }
		   });
	
	// 아이디 중복 검사
	$("#id").keyup(function(key){
		const idval = $(this).val();
		  $.ajax({
				type : "post",
				url : "${path}/checkUserId",
				data : {userid: $("#id").val()},
				dataType : "text",
				success : function(yn) {
					if (yn == "Y") {
						$("#idCheck").text("중복된 아이디 입니다.").addClass("errMsg");
					} else {
						if (!valId(idval) && idval != "") { // 정규식 혹은 "" 이 아닐때
						      $("#idCheck").text("영문, 숫자로 8자이상 입력해 주세요.").addClass("errMsg");
						      allTrue = false
						 }else if (valId(idval)) {
							$("#idCheck").text("사용 가능한 아이디 입니다.").removeClass("errMsg");
							allTrue = true
						 }else if(idval == ""){
							 $("#idCheck").text("")
							 allTrue = false
						 }
					}
				},
				error : function(err) {
					console.log(err)
				}
			})	  
	})
	// 회원가입 
		$(".joinBtn").click(function(){
	if(allTrue==true){
	        $.ajax({
	            type: "get",
	            url: `${path}/insertUser`,
	            data: {
	                userid: $("#id").val(),
	                pass: $("#pass").val(),
	                name: $("#name").val(),
	                phnumber: $("#phoneNum").val(),
	                gender: $("input[name='item']:checked").val(),
	                birthS: $("#birth").val(),
	                email: $("#email").val()
	            },
	            dataType: "text",
	            success: function(response) {
	                // 요청이 성공적으로 완료되었을 때 실행할 코드
	                console.log("요청 성공:", response);
	            },
	            error: function(xhr, status, error) {
	                // 요청이 실패했을 때 실행할 코드
	                console.log("요청 실패:", status, error);
	            }
	        });
	}else{
		alert("확인")
	}
		})
	
	
	
	
	


	
})

</script>

<script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
<script src="${path}/js/header.js"></script>
<script src="${path}/js/logJoin.js"></script>
<script type="text/javascript"></script>
</html>