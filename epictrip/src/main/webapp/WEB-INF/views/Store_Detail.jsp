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

<link rel="icon" href="./source/favicon-32x32.png" sizes="32x32">
<link rel="apple-touch-icon" href="./source/apple-icon-180x180.png"
	sizes="180x180">
<title>EpicTrip | 에픽트립</title>

<link href="./css/headFoot.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link href="./css/sDetail.css" rel="stylesheet">

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
		<div class="banner">
			<img src="./source/storeImg/${prodDetail.titleimage}" class="bnImg">
		</div>

		<div class="postContent">
			<div class="pLeft">
				<strong>${prodDetail.prodtitle}</strong>
				<div class="titleBottom">
					<div class="postingBtn">
						<button type="button" class="wishBtn"></button>
						<button type="button" class="upBtn admBtn" id="upBtn">수정</button>
						<button type="button" class="delBtn admBtn" id="delBtn">삭제</button>
					</div>
					<span class="itemPrice"> <fmt:formatNumber
							value="${prodDetail.price}" /> <span>원</span></span>
				</div>

				<div class="postCon">
					<p class="postText">${prodDetail.prodcontent}</p>
					<img class="postImg"
						src="./source/storeImg/${prodDetail.detailimage}">
				</div>
				<button type="button" class="postMore">더보기</button>

				<div class="postDV">
					<span><fmt:formatDate value="${prodDetail.updtdate}"
							pattern="yyyy-MM-dd HH:mm" /></span>
					<p>조회수</p>
					<span>${prodDetail.hits}</span>
				</div>

				<form action="" class="cmmtFrm">
					<strong>여행 후기</strong>
					<div class="cmmtBox">
						<textarea placeholder="후기를 입력해주세요" id="cmmtText" maxlength="200"></textarea>
						<button type="button" class="cmmtBtn"></button>
					</div>
				</form>
				<c:forEach items="${prodComInfo}" var="prodComInfo">
					<div class="comment">
						<div class="uInfo">
							<img src="./source/${prodComInfo.image}.jpg" class="cmmtUserImg">
							<div class="cmmtUserTxt">
								<span>${prodComInfo.name}</span> <span>@${prodComInfo.userid}</span>
								<c:choose>
									<c:when test="${prodComInfo.userid eq userInfo.userid}">
										<button type="button" class="commDel">삭제</button>
									</c:when>
								</c:choose>
								<p class="cmmtCon">${prodComInfo.comments}</p>
							</div>
							<input type="hidden" value="${prodComInfo.commentkey}"
								id="commentkey"> <input type="hidden"
								value="${prodComInfo.prodkey}" id="prodkey"> <input
								type="hidden" value="${prodComInfo.userid}" id="userid">
							<input type="hidden" value="${prodComInfo.comments}"
								id="comments"> <input type="hidden"
								value="${prodComInfo.updatedate}" id="updatedate"> <input
								type="hidden" value="${prodComInfo.auth}" id="auth"> <input
								type="hidden" value="${prodDetail.startdate}" id="startdate">
							<input type="hidden" value="${prodDetail.enddate}" id="enddate">
						</div>
						<span class="cmmtDate"><fmt:formatDate
								value="${prodComInfo.updatedate}" pattern="yyyy-MM-dd HH:mm" /></span>
					</div>
				</c:forEach>

				<!-- 페이징 -->
				<div class="pagination">
					<c:if test="${pagination.prev}">
						<button type="button" class="prevBtn arrow"
							onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">
						</button>
					</c:if>

					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<button type="button" value="${idx}" class="pageNum"
							<c:out value="${pagination.currPageNo == idx ? 'active' : ''}"/>
							onClick="fn_pagination('${idx}', '${pagination.range}')">${idx}</button>
					</c:forEach>

					<c:if test="${pagination.next}">
						<button type="button" class="nextBtn arrow"
							onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">
						</button>
					</c:if>
				</div>


			</div>


			<div class="pRight">
				<div class="rightWrap">
					<div class="calendar"></div>
					<p class="saleTxt">요일별 금액현황</p>
					<div class="saleInfo">
						<div class="sRow sHead">
							<span>할인 요일</span> <span>할인율</span>
						</div>
						<div class="sRow">
							<span>${prodDetail.dcday}</span> <span class="percent">${prodDetail.dcprice}%</span>
						</div>
					</div>


					<form method="" action="">
						<p class="chTxt">상품 선택</p>
						<div class="priceCnt">
							<div>
								<p id="priceName">1인 예약금</p>
								<p class="onePrice">
								</p>
								<input type="hidden" id="onePriceVal" value=${prodDetail.price}>
							</div>
							<div class="cntCtrl">
								<span class="minus numBtn">&#8211</span> <span class="number"></span>
								<span class="plus numBtn">+</span>
							</div>
						</div>

						<div class="payInfo">
							<span>필수 유의 사항</span>
							<p>
								• 여권 만료일은 반드시 6개월 이상 남아 있어야 합니다. <br> • 기상 관련 취소는 100% 환불
								도와드립니다.<br> • 여행자 보험에 가입 후 투어를 진행할 것을 권장합니다.
							</p>
						</div>
					</form>
				</div>

				<button type="button" class="goPay">
					<span id="totPay"></span> <span>원 결제하기</span>
				</button>
			</div>
		</div>

	</section>

	<footer>
		<img src="./source/logo_white.png">
		<p>
			<a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a>
		</p>
		<p>유선 상담 010-1234-1234</p>
		<p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
	</footer>


	<script src="./js/header.js"></script>

	<script>
var setUserId = "${userInfo.userid}"
var setUserAuth = "${userInfo.auth}"
var setUsername = "${userInfo.name}"

var dateCheck = false;

if(setUserAuth != "admin"){ // 세션 유저 관리자 권한
	 $("#upBtn").hide()
	 $("#delBtn").hide()
}

var searchType = "";
$(document).ready(function() {
	
	
	
	// 위시리스트
		$.ajax({
			type : "post",
			url : "WishlistFind",
			data: {
                userid: setUserId,
                prodkey: "${prodDetail.prodkey}",
            },
			dataType : "text",
			success : function(yn) {
				
				if(yn=="Y"){
					$(".wishBtn").addClass("active");
					
					$(".wishBtn").click(function(){
						console.log("123")
						
						$.ajax({
							type : "post",
							url : "WishlistDelete",
							data: {
				                userid: setUserId,
				                prodkey: "${prodDetail.prodkey}",
				            },
							dataType : "text",
							success : function(yn) {
								console.log(yn)
								location.reload()
							},
							error : function(err) {
								console.log(err)
							}
						})
						
						console.log("123")
					});
				}
				
				if(yn=="N"){
						console.log("1231111")
					$(".wishBtn").click(function(){
						$.ajax({
							type : "post",
							url : "Wishlist_Inset",
							data: {
				                userid: setUserId,
				                prodkey: "${prodDetail.prodkey}",
				            },
							dataType : "text",
							success : function(yn) {
								console.log(yn)
								location.reload()
							},
							error : function(err) {
								console.log(err)
							}
						})
						console.log("1231111")
						
					});
				}

				

				
				console.log(yn)
			},
			error : function(err) {
				console.log(err)
			}
		})
	
	
	
	
	
	
	// 수정 이동
	$("#upBtn").click(function(){
		location.href = "Store_Detail_InsSle?prodkey=${prodDetail.prodkey}"
	})
	
	
	// 페이지 컬러
    var color = ${pagination.currPageNo};
    $(".pagination .pageNum").each(function() {
        if ($(this).val() === color.toString()) {
            $(this).addClass("active");
        }
    });
	  
    // 댓글 입력
	$(".cmmtBtn").click(function(){
		
		$.ajax({
			type : "get",
			url : "Store_Comment_Insert",
			data: {
                prodkey: "${prodDetail.prodkey}",
                userid: setUserId,
				comments: $("#cmmtText").val()
            },
			dataType : "text",
			success : function(yn) {
				location.href = "Store_Detail?prodkey=${prodDetail.prodkey}&currPageNo=1&range=1"
			},
			error : function(err) {
				console.log(err)
			}
		})
		
	})
	
	// 삭제
	$("#delBtn").click(function(){
		
		$.ajax({
			type : "post",
			url : "Store_Del",
			data: {
                prodkey: "${prodDetail.prodkey}",
                userid: "${user.userid}",
            },
			dataType : "text",
			success : function(yn) {
				alert("삭제 성공")
				location.href = "Store_List?country=${prodDetail.country}"
			},
			error : function(err) {
				console.log(err)
			}
		})
	})
	
	
	// 댓글 삭제
	$(".commDel").click(function() {
    var commentKey = $(this).closest(".uInfo").find("#commentkey").val();
    console.log(commentKey);
    
	$.ajax({
		type : "post",
		url : "Store_comment_Del",
		data: {
			commentkey: commentKey,
			prodkey: "${prodDetail.prodkey}",
        },
		dataType : "text",
		success : function(yn) {
			alert(yn)
			location.reload();
		},
		error : function(err) {
			console.log(err)
		}
	}) 
    
});
	

    
var price = ${prodDetail.price} // 원가
var priceVal = ${prodDetail.dcprice}/100 // 할인퍼센트
var priceTotar = 0;
var cntNum = 1;
// ---------------- calendar --------------------
	//주어진 날짜 문자열
function formatDate(dateString) {
  var monthMap = {
    Jan: '01', Feb: '02', Mar: '03', Apr: '04', May: '05', Jun: '06',
    Jul: '07', Aug: '08', Sep: '09', Oct: '10', Nov: '11', Dec: '12'
  };

  var parts = dateString.split(' ');
  var year = parts[5];
  var month = monthMap[parts[1]];
  var day = parts[2];

  return year + '-' + month + '-' + day;
}

var startSDate = "${prodDetail.startdate}";
var endSDate = "${prodDetail.enddate}";

var minDt = formatDate(startSDate);
var maxDt = formatDate(endSDate);


var totDate = "";
var dayName = "";
var dcdayVal = "${prodDetail.dcday}";
$(function() {
	
	
    function addPrice() {
        const td = document.querySelectorAll(".ui-datepicker td");
        td.forEach((e,i) => {
            let cls = e.getAttribute("data-month");
            if(true) {
                e.insertAdjacentHTML("beforeend", `<p class='dayPrice'>47만</p>`)
            }
        });
    }

 // 시작 날짜가 오늘보다 작으면 내일부터 상품을 구메할 수 있다.
    function startDateSet(){ 
    	var today = new Date();
    	var today02 = new Date(minDt);
    	if(today02<today){
    		minDt = +1; 
    	}
    	
    }
    startDateSet()
	// 할인 요일 출력    
    dayName = "";
    var dayMap = {
        "일": '1', "월": '2', "화": '3', "수": '4', "목": '5', "금": '6', "토": '7'
    };

    var dcdayArr = dcdayVal.split(" "); // 요일 문자열을 배열로 분리
    var dcdayVal01 = dcdayArr.map(function(day) {
        return dayMap[day]; // 요일 문자열에 해당하는 값을 가져와 새로운 배열 생성
    });


    var styleContent = ""; // 스타일 내용을 저장할 변수

    dcdayVal01.forEach(function(dayValue) {
        styleContent += ".calendar th:nth-child(" + dayValue + ") span { color: var(--color-main); font-family: pSemi; }";
    });
    
    var styleElement = document.createElement("style");
    styleElement.innerHTML = styleContent;
    document.head.appendChild(styleElement);

    $( ".calendar" ).datepicker({ 
        dateFormat: 'yy-mm-dd',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        minDate: minDt,
        maxDate: maxDt,

        onSelect: function() {
            totDate = $.datepicker.formatDate("yy-mm-dd", $(".calendar").datepicker("getDate")); 
            var date = new Date(totDate);
            var dayNames = ["일", "월", "화", "수", "목", "금", "토"];
            var dayIndex = date.getDay();
            dayName = dayNames[dayIndex];
            tomorrowDayOfWeek = dayName
            updateTotalPrice(); // 가격 계산

        },
    });
    totDate = $.datepicker.formatDate("yy-mm-dd", $(".calendar").datepicker("getDate")); 

});



// ------------ 더보기 버튼 ---------------
const postMore = document.querySelector(".postMore");
const post = document.querySelector(".postCon");

if(post.clientHeight >= 580) {
    postMore.style.display = "block";

    postMore.onclick = function() {
        post.classList.toggle("more");
        if(this.innerHTML == "더보기") {
            this.innerHTML = "접기";
        } else {
            this.innerHTML = "더보기";
        }
    }
} else {
    postMore.style.display = "none";
}




// ---------------- 숫자 컨트롤러 -----------------------------
var cntShow = document.querySelector(".number");
var plus = document.querySelector(".plus");
var minus = document.querySelector(".minus");
var onePrice = document.querySelector(".onePrice");
var priceName = document.querySelector("#priceName");


var on = false;
var breaker = false;
cntShow.innerHTML = cntNum;

var priceTot = ${prodDetail.price};
plus.onclick = function () {
    if (!on) {
        if (cntNum < 10) {
            cntNum++;
            priceName.innerText = cntNum + "인 예약금"; // 인원 늘렸을 때
            cntShow.innerHTML = cntNum; // 숫자 증가
            
            updateTotalPrice() // 가격 계산
        }
    }
};


minus.onclick = function () {
	
	if (!on) {
        if (cntNum > 1) {
            cntNum--;
            priceName.innerText = cntNum + "인 예약금"; // 인원 늘렸을 때
            cntShow.innerHTML = cntNum; // 숫자 증가

            updateTotalPrice() // 가격 계산
        } else {
            cntNum = 1;
        }
    }
};



//현재 날짜 가져오기
var today = new Date();

// 내일의 날짜 계산
var tomorrow = new Date(today);
tomorrow.setDate(today.getDate() + 1);
//요일 정보 가져오기
var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
var tomorrowDayOfWeek = daysOfWeek[tomorrow.getDay()];
if (dcdayVal.includes(tomorrowDayOfWeek)) {
console.log(tomorrowDayOfWeek)
	var totalPrice123 = price - (price*priceVal);
	$(".onePrice").text(totalPrice123.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
	$("#totPay").text(totalPrice123.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	$("#onePriceVal").val(totalPrice123);
}else{
	onePrice.innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
	$("#totPay").text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	$("#onePriceVal").val(price);
}



// 가격 계산 로직
var totalPrice = 0;
function updateTotalPrice() {
    totalPrice = price * cntNum;
    if (dcdayVal.includes(dayName)) {
    	totalPrice = totalPrice - (totalPrice*priceVal);
    }
    
    onePrice.innerHTML = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
    $("#totPay").text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
    $("#onePriceVal").val(totalPrice);
    
    

}
//----------- 결제 페이지 이동 ------
$(".goPay").click(function(){
	
	if(setUserAuth == "user"){
		
		var url = "Store_Pay?";
		url = url + "&userid=" + setUserId;
		url = url + "&prodtitle=" + encodeURIComponent("${prodDetail.prodtitle}");
		url = url + "&totDate="+totDate;
		url = url + "&cntNum="+cntNum;
		url = url + "&dayweek="+tomorrowDayOfWeek;
		url = url + "&prodkey=${prodDetail.prodkey}";
		url = url + "&totprice=" + $("#onePriceVal").val();
		url = url + "&titleimage=${prodDetail.titleimage}";
		location.href = url;
		
	}
	if(setUserAuth == "admin"){
		alert("관리자는 구매 불가능")
	}
	if(setUserAuth == ""){
		alert("로그인후 이용해주세요")
		location.href = "login"
	}
})




// ------------- 좋아요 버튼 -------------
const wishBtn = document.querySelector(".wishBtn");
wishBtn.onclick = function() {
    this.classList.toggle("active");
}
	
	
})

//이전 버튼
function fn_prev(currPageNo, range, pageSize) {

	var currPageNo = (range - 1) * pageSize;
	var range = range -1;

	var url = "Store_Detail?prodkey=${prodDetail.prodkey}";
	url = url + "&currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	location.href = url;

}

//페이지 번호 클릭
function fn_pagination(currPageNo, range) {
	//$(this).addClass("highlight");
	var url = "Store_Detail?prodkey=${prodDetail.prodkey}";
	url = url + "&currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	location.href = url;	

}
//다음 버튼 이벤트
function fn_next(currPageNo, range, pageSize) {

	var currPageNo = (range * pageSize) + 1;
	var range = parseInt(range) + 1;	

	var url = "Store_Detail?prodkey=${prodDetail.prodkey}";
	url = url + "&currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	location.href = url;
}
document.addEventListener('DOMContentLoaded', function() {
    let postTextElement = document.querySelector('.postText');
    let content = postTextElement.innerHTML; // 현재 <p> 태그의 내용을 가져옵니다.
    content = content.replace(/\n/g, '<br>');
    postTextElement.innerHTML = content;
});


    </script>
</body>

</html>