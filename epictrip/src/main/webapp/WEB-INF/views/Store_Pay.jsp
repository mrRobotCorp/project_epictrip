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
    <link href="./css/sPay.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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
<c:set var="Reserve">home.reserve</c:set>
<c:set var="ReserverInformation">home.reserve_info</c:set>
<c:set var="ReserverName">home.reserve_name</c:set>
<c:set var="Gender">home.reserve_gender</c:set>
<c:set var="DateofBirth">home.reserve_birth</c:set>
<c:set var="MobilePhoneNumber">home.reserve_phone</c:set>
<c:set var="EmailAddress">home.reserve_email</c:set>
<c:set var="MakeaPayment">home.payment</c:set>
<c:set var="PleaseCheck">home.please_check</c:set>
<c:set var="SelectedProduct">home.selected_product</c:set>
<c:set var="TotalProductPrice">home.total_payment</c:set>
<c:set var="UsePoint">home.use_point</c:set>
<c:set var="TotalPaymentPrice">home.total_price</c:set>
<c:set var="Accumulate">home.accumulate</c:set>
<c:set var="PaymentMethod">home.payment_method</c:set>
<c:set var="CardPayment">home.card_payment</c:set>
<c:set var="BankTransfer">home.nobank_payment</c:set>
    
    
        <form action="" class="payWrap">
            <div class="buyerInfo">
                <h1><fmt:message key="${Reserve}"/></h1>
                <div class="bIline"></div>
                <h2><fmt:message key="${ReserverInformation}"/></h2>
                <div class="buyerInfoList">
                    <div class="nameGen">
                        <span>
                            <p><fmt:message key="${ReserverName}"/></p>
                            <input type="text" name="name" id="name" value="${payUser.name}" disabled>
                        </span>
                        <span>
                            <p><fmt:message key="${Gender}"/></p>
                            <input type="text" name="name" id="name" value="${payUser.gender}" disabled>
                        </span>
                    </div>
                    <div class="birth">
                        <p><fmt:message key="${DateofBirth}"/></p>
                        <input type="date" name="birth" id="birth" disabled>
                    </div>
                    <div class="phoneNum">
                        <p><fmt:message key="${MobilePhoneNumber}"/></p>
                        <input type="number" name="phoneNum" id="phoneNum" value="${payUser.phnumber}" disabled>
                    </div>
                    <div class="email">
                        <p><fmt:message key="${EmailAddress}"/></p>
                        <input type="text" name="email" id="email">
                        <p class="checkEmail"></p>
                    </div>
    
                </div>
            </div>

            <div class="itemInfo">
            
                <div class="itemInfoInner">
					<div class="infoTop">
                        <h1><fmt:message key="${MakeaPayment}"/></h1>
						<span class="langAll">
						    <input type="radio" name="lang" value="ko" id="langKor" class="lBtn">
						    <label for="langKor"></label>
						    <input type="radio" name="lang" value="en" id="langUs" class="lBtn">
						    <label for="langUs"></label>
						</span>
                    </div>
					
                    <p class="ment"><fmt:message key="${PleaseCheck}"/></p>
                    <div class="itemThumb">
                        <div class="imgWrap">
                            <img src="./source/storeImg/${param.titleimage}" alt="">
                        </div>
                        <div class="itemThtext">
                            <span class="itemTitle">${param.prodtitle}</span>
                            <p><span>${param.totDate} [${param.dayweek}요일]</span> 출발</p>
                        </div>
                    </div>
                    <p class="selP"><fmt:message key="${SelectedProduct}"/></p>
                    <div class="selectItem">
                        <span><fmt:message key="${TotalProductPrice}"/></span>
                        <div class="datePrice">
                            <p>${param.cntNum} 인</p>
                            <h3>총 <fmt:formatNumber value="${param.totprice}"/>원</h3>
                        </div>
                    </div>
                    <div>
                        <div  class="point">
                            <p><fmt:message key="${UsePoint}"/></p>
                            <span id="poinrView"><fmt:message key="${TotalProductPrice}"/> : <fmt:formatNumber value="${payUser.point}"/> p</span>
                        </div>
                        <div class="usePoint">
                            <input type="number" name="point" id="point" value="" placeholder="0">
                            <button type="button" id="allPoint">전액 사용</button>
                        </div>
                    </div>
                    <div class="payLine"></div>
                    <div class="priceInfo">
                        <h3><fmt:message key="${TotalProductPrice}"/></h3>
                        <div class="pspt">
                            <div class="psptIn">
                                <p><fmt:message key="${TotalPaymentPrice}"/></p>
                                <p><fmt:formatNumber value="${param.totprice}"/> 원</p>
                            </div>
                            <div class="psptIn">
                                <p><fmt:message key="${UsePoint}"/></p>
                                <p id="usePoints">0 원</p>
                            </div>
                            <div class="psptIn tot">
                                <p class="totment"><fmt:message key="${TotalPaymentPrice}"/></p>
                                <p id="totment"><fmt:formatNumber value="${param.totprice}"/> 원</p>
                            </div>
                            <div class="psptIn pspBlue">
	                            <p>💰 <fmt:message key="${Accumulate}"/></p>
	                            <p id = "accumulate" > 원</p>
                        	</div>
                        </div>
                    </div>
                    <div class="payLine"></div>
                    <h3 class="hP"><fmt:message key="${PaymentMethod}"/></h3>
                    <div class="howPay">
                        <button id="cardPay" type="button"><fmt:message key="${CardPayment}"/></button>
                        <button id="nobankBook" type="button"><fmt:message key="${BankTransfer}"/></button>
                    </div>
                </div>
                <input type="hidden" value="${param.prodkey}" id="prodkey">
                <button class="itemBtn" id="itemBtn" type="button">총 <fmt:formatNumber value="${param.totprice}"/>원 결제하기</button>
            </div>
        </form>


    </section>

    <footer>
        <img src="./source/logo_white.png">
        <p><a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a></p>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>


    <script src="./js/header.js"></script>
    <script src="./js/sPay.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$("input[name='lang']").change(function() {
        // 선택한 언어 값을 가져옴
        var selectedLanguage = $("input[name='lang']:checked").val();

        // 서버로 언어 변경 요청을 보냄
        $.ajax({
            type: "get",
            url: "changeLang02?lang=" + selectedLanguage,
            success: function(response) {
                // 성공한 경우 페이지 새로 고침
                window.location.reload();
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
	
	
	
	var userId= "${param.userid}"
	var userprodkey= "${param.prodkey}"
	var userName= "${payUser.name}" // 이름
	var userGender= "${payUser.gender}"	// 성별
	// 생년월일 YYYY-MM-DD 형식으로 변환하여 넣어줌
	var userBirth= "${payUser.birth}"
	var userBirth02 = moment(userBirth, "ddd MMM DD HH:mm:ss z YYYY").format("YYYY-MM-DD");
	$("#birth").val(userBirth02)
	
	// 보낼 데이터
	var endPrice = ${param.totprice}; // 총계
	var usePoint = 0;// 사용 포인트
	var endPoint = ${param.totprice}*0.04; //적립금 
	var payMethod = ""; // 결제 방식
	var email = ""; // 이메일
	
	$("#accumulate").text(parseInt(${param.totprice}*0.04) +" p")	
	// 모두 작성했을때
	var allPass = false;
	var allPass02 = false;
	
	
	
	// 결제 포인트 + 가격
	function priceView(num){ // 천번째 단위 , 찍기 + 앞에 0 빼기
		return num.toString().replace(/^0+/, '').replace(/\B(?=(\d{3})+(?!\d))/g, ',')
	}
	
	// 최대 최소값 넘길시 값 조정
	var userPoint= ${payUser.point} // 포인트
	const pointInput = $("#point");
	pointInput.on("input", function() {
		const inputValue = parseInt(pointInput.val());
	    if (inputValue > userPoint) { // 보유 포인트보다 많을시 불가
	      	pointInput.val(userPoint);
	    }else if(${param.totprice} < inputValue){ // 제품 가격보다 포인트가 높을시
	    	alert("제품 가격보다 포인트가 많습니다.")
	    	pointInput.val(0);
	    }
	    if(inputValue < 0){ // -1일시 불가
	    	pointInput.val(0); 
	    }

	    if(inputValue == 00){ //00일시 초기화
	    	pointInput.val(0);
	    }
	    if(inputValue.length > userPoint.length){
	    	alert("최대 " + maxLength + "자리까지 입력할 수 있습니다.");
	        numberInput.value = inputValue.slice(0, maxLength); // 초과된 부분 제거
	    }
	    
	    totSum(inputValue)
		$("#usePoints").text(priceView($("#point").val())+" 원") // 포인트 사용시 화면출력
		
	    if(isNaN(inputValue)){ // - 입력 불가 or value가 Nan이거나 공백일때 
	    	pointInput.val(0);
	    	totSum(0)
	    	$("#usePoints").text("0 원")
	    }
	    
	    usePoint = $("#point").val()
	  });

	// 전액사용 클릭시
	const allPoint = $("#allPoint")
	allPoint.click(function(){
		if(${payUser.point}>${param.totprice}){
			$("#point").val(${param.totprice})
			$("#usePoints").text(priceView($("#point").val())+" 원") // 포인트 사용시 화면출력
			totSum(${param.totprice})
			usePoint = $("#point").val()
					console.log(${param.totprice})
		}
		if(${payUser.point}<${param.totprice}){
			$("#point").val(${payUser.point})
			$("#usePoints").text(priceView($("#point").val())+" 원") // 포인트 사용시 화면출력
			totSum(${payUser.point})
			usePoint = $("#point").val()
					console.log(${payUser.point})
		}
	})
	

	// 총결제 금액 출력
	function totSum(point){
		var totment = $("#totment") // 출력 위치
		var totprice = ${param.totprice} // 받아온 가격
		var maxPoint = ${payUser.point} // 최대값 설정
		var totSumPrice = totprice-point // 계산
		
		console.log(point)
		console.log(totSumPrice)
		var accumulate = $("#accumulate") // 적립금 계산 
		var accumulateTot = parseInt(totSumPrice*0.04)
		
		if(totSumPrice < -1){
			totSumPrice = totprice-maxPoint
			accumulateTot = parseInt(totSumPrice*0.04)
		}
		
		if(totSumPrice < 1){
			accumulate.text("0 p")
			totment.text("0원")
			$("#itemBtn").text("총 0원 결제하기")
			endPrice = totSumPrice
			endPoint = accumulateTot
		}else{
			accumulate.text(priceView(accumulateTot)+" p")
			totment.text(priceView(totSumPrice)+"원")
			$("#itemBtn").text("총 "+priceView(totSumPrice)+"원 결제하기")
			endPrice = totSumPrice
			endPoint = accumulateTot
		}
		

	}
	
	
	// 카드 결제
	$("#cardPay").click(function(){
		payMethod = "card";
		allPass02 = true
	})
	
	// 무통장 입금
	$("#nobankBook").click(function(){
		payMethod = "nobank";
		allPass02 = true
	})
	
	
	
	// 이메일 정규식 
	var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
	
	function valemail(email) { //이메일
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	    return emailPattern.test(email);
	}
	$("#email").keyup(function(){
		if (valemail($(this).val())) {
			email = $(this).val()
			allPass = true
			 $(".checkEmail").text("")
		} else {
	        $(".checkEmail").text("이메일 형식이 올바르지 않습니다.")
	        allPass = false
		}
	})
	
	
	// 결제하기
	$("#itemBtn").click(function(){
		if(!allPass02){
			alert("결제 방식을 선택해주세요")
		}
		else if(!allPass){
			alert("이메일 주소를 확인해 주세요")
		}
		if(allPass && allPass02){
			console.log("사용한"+usePoint) // 사용한 포인트
			 console.log("적립한"+endPoint) // 적립한 포인트
			
			console.log("선택 날짜"+"${param.totDate}") // 선택 날짜
			console.log("선택 날짜"+typeof(new Date(${param.totDate}))) // 선택 날짜
			
			console.log("총"+endPrice) // 총 결제 금액
			var point = endPoint-usePoint
			console.log("적립포인트"+point) // 적립포인트 (적립할 포인트에서 사용한 포인트를 빼준다)
			
 			var url = "Store_Pay_insert?";
			url = url + "&userid=" + userId;// 유저 아이디
			url = url + "&prodkey=" + userprodkey; // 포스트키
			url = url + "&savedpoint=" + endPoint; // 적립된 금액
			url = url + "&usepoint=" + usePoint; // 사용한 적립금
			url = url + "&paymethod=" + payMethod; //결제방식
			url = url + "&totprice=" + endPrice; // 총액
			url = url + "&poinsSum=" + point; // 총액
			url = url + "&people=" + ${param.cntNum}; // 총액
			url = url + "&choiceDateS=" + "${param.totDate}"; // 선택날짜
			
			url = url + "&email=" + email; //이메일
			
			url = url + "&usepoint=" + point; // 유저에 포인트 합산
			
			location.href = url;
			alert("결제완료 잠시후 페이지가 이동됩니다.")
			

		}
	})
	
	
	
})










</script>

</html>
	