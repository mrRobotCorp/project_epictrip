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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <link href="./css/headFoot.css" rel="stylesheet">
    <link href="./css/sList.css" rel="stylesheet">
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
        <div class="sListThumb" >
            <img src="" alt="" >
            <h1></h1>
        </div>
        <div class="line"></div>
        <div class="frmLine">
            <div>
                <div class="strFrm">
                    <input type="text" name="schBox" placeholder="여행지를 검색해보세요" value="${paraMap.keyword}">
                    <button type="button" id="titleBtn"></button>
                </div>
                <input type="checkbox" class="sortBtn" id="sort">
                <label for="sort">조회순</label>
            </div>
            <a href="Store_Posting" class="postBtn">상품 작성하기</a>
        </div>

        <div class="itemAll">

        

 			<c:choose>
		        <c:when test="${empty product_List}">
		            <div class="noneResult">
			            <img src="./source/nosearch.png">
			            <p>검색 결과가 존재하지 않습니다</p>
			        </div>	
		        </c:when>
		        <c:otherwise>
	                <c:forEach var="prod" items="${product_List}">
				        <a href="./Store_Detail?prodkey=${prod.prodkey}" class="itemOne item01">
			                <div class="post">
			                    <div class="postImg">
			                        <img src="./source/storeImg/${prod.titleimage}" alt="">
			                    </div>
			                </div>
			                <div class="postBottom">
			                    <span id="infoText" class="infoText">${prod.prodtitle}</span>
			                    <span id="locPay" class="locPay">
			                        <p id="loc">${prod.prodloc}</p>
			                        <span id="price">
			                        	<fmt:formatNumber value="${prod.price}"/> 원
			                        </span>
			                    </span>
			                </div>
			                <input type="hidden" value="${prod.prodkey}" id="prodkey">
			                <input type="hidden" value="${prod.country}" id="country">
			                <input type="hidden" value="${prod.hits}" id="hits">
			                <input type="hidden" value="${prod.updtdate}" id="updtdate">
			                <input type="hidden" value="${prod.startdate}" id="startdate">
			                <input type="hidden" value="${prod.enddate}" id="enddate">
			            </a>     
			        </c:forEach>
	            </c:otherwise>
			    </c:choose>
            
            
        </div>
        
		<div class="pagination">
			<c:if test="${pagination.prev}">
           		<button type="button" class="prevBtn arrow"
           		onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">
           		</button>
    		</c:if>
           
           <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
	           		<button type="button" value="${idx}" class="pageNum" <c:out value="${pagination.currPageNo == idx ? 'active' : ''}"/> 
	           		onClick="fn_pagination('${idx}', '${pagination.range}')">${idx}</button>
	        </c:forEach>
	        
	        <c:if test="${pagination.next}">
           		<button type="button" class="nextBtn arrow"
           		onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')" >
           		</button>
          	</c:if>
       </div> 
	
    </section>
    <footer>
    	<input type="hidden" value="${paraMap.searchType}" id="chbox">
        <img src="./source/logo_white.png">
        <p><a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a></p>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>


    <script src="./js/header.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</body>
<script type="text/javascript">
var searchType = ""; 
var country1 = "${pagination.country}";
var setUserAuth = "${userInfo.auth}"
$(document).ready(function() {
	
	if(setUserAuth != "admin"){
		$(".postBtn").addClass("hide");
		
	}
		
	console.log(typeof($("#startdate").val()))
	// 페이지 이미지 + 이름 변경
    console.log(country1)
     $(".sListThumb img").attr("src", "./source/countryImg/"+country1+".jpg");
     $(".sListThumb h1").text(country1);
    
    
	// 페이지 컬러
    var color = ${pagination.currPageNo};
    $(".pagination .pageNum").each(function() {
        if ($(this).val() === color.toString()) {
            $(this).addClass("active");
        }
    });

	  
	// 제목 검색 
	$("#titleBtn").click(function(currPageNo, range, pageSize){

		var url = "Store_List?country="+country1;
		url = url + "&currPageNo=" + 1;
		url = url + "&range=" + 1;
		url = url + "&searchType=" + $("#chbox").val();
		url = url + "&keyword=" + $("[name=schBox]").val();
		location.href = url;
	})
	
	// 메인 이미지누러서 초기화
	$(".sListThumb").click(function (){
		location.href = "Store_List?country="+country1;
	})
	
	

	if($("#chbox").val()!=""){
		$("#sort").prop("checked", true);
	} 
	
	// 조회수 버튼 여부
	$("#sort").change(function() {
	    if ($(this).prop("checked")) {
    		var url = "Store_List?country="+country1;
			url = url + "&currPageNo=" + 1;
			url = url + "&range=" + 1;
			url = url + "&searchType=" + "checkOn";
			url = url + "&keyword=" + $("[name=schBox]").val();
			location.href = url;
			
	    } else {
    		var url = "Store_List?country="+country1;
			url = url + "&currPageNo=" + 1;
			url = url + "&range=" + 1;
			url = url + "&searchType=" + "";
			url = url + "&keyword=" + $("[name=schBox]").val();
			location.href = url;
	    }
	  });
	
})

//이전 버튼
function fn_prev(currPageNo, range, pageSize) {

	var currPageNo = (range - 1) * pageSize;
	var range = range -1;

	var url = "Store_List?country="+country1;
	url = url + "&currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + $("#chbox").val();
	url = url + "&keyword=" + $("[name=schBox]").val();
	location.href = url;

}

//페이지 번호 클릭
function fn_pagination(currPageNo, range) {
	//$(this).addClass("highlight");
	var url = "Store_List?country="+country1;
	url = url + "&currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + $("#chbox").val();
	url = url + "&keyword=" + $("[name=schBox]").val();
	location.href = url;	

}
//다음 버튼 이벤트
function fn_next(currPageNo, range, pageSize) {

	var currPageNo = (range * pageSize) + 1;
	var range = parseInt(range) + 1;	

	var url = "Store_List?country="+country1;
	url = url + "&currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + $("#chbox").val();
	url = url + "&keyword=" + $("[name=schBox]").val();
	location.href = url;
}




var dateString = $("#startdate").val();

// 문자열에서 날짜 정보 추출
var parts = dateString.split(" ");
var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var year = parseInt(parts[5]);
var month = monthNames.indexOf(parts[1]);
var day = parseInt(parts[2]);

// Date 객체 생성
var parsedDate = new Date(year, month, day);

// 현재 날짜 가져오기
var currentDate = new Date();

// 두 날짜 비교
if (currentDate > parsedDate) {
console.log("현재 날짜는 주어진 날짜보다 뒤에 있습니다.");
} else if (currentDate < parsedDate) {
console.log("현재 날짜는 주어진 날짜보다 앞에 있습니다.");
} else {
console.log("현재 날짜와 주어진 날짜는 같습니다.");
}





// 오늘보다 endDate가 작으면 솔드아웃 설정
const soItem = document.querySelectorAll(".itemOne");
soItem.forEach((e, i) => {
    const endDate = $(e).find("#enddate").val(); // 벨류로 받았기 때문에 문제가 생김 데이터 형식이여야 범위를 지정할 수 있음
    
    // 데이터 형식으로 저장
    var parts = endDate.split(" ");
    var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var year = parseInt(parts[5]);
    var month = monthNames.indexOf(parts[1]);
    var day = parseInt(parts[2]);

    // 포스트의 endDate 객체 생성
    var endDate02 = new Date(year, month, day);
 	
    // 현재 날짜 가져오기
    var currentDate = new Date();
    
    
    if (currentDate>endDate02) { // sold out 아이템 조건을 여기에 넣으세요.
        e.setAttribute("id", "soldOut");
    }
});


const soldOut = document.querySelectorAll("#soldOut");
// sold out 제품은 a 링크 이동 막기 
soldOut.forEach((e) => {
    e.onclick = function() {
        return false;
    }
})

const soldOutIn = document.querySelectorAll("#soldOut .postImg");
// sold out 제품에만 sold out 텍스트 추가
soldOutIn.forEach((e) => {
    e.insertAdjacentHTML("afterend", `
        <p class="soldOutTxt">Sold Out</p>
    `);
})


</script>

</html>