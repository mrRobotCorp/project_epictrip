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
    <link href="./css/cSchedule.css" rel="stylesheet">
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
        <div class="gnbBottom">
            <a href="/Community_Group" class="together">
                <img src="./source/group.png">
                <span >동행</span>
            </a>
            <a href="/Schedule_List"  class="sche">
                <img src="./source/date.png">
                <span>일정</span>
            </a>
        </div>
    </header>

    <section class="cSchSection">
        <div class="frmLine">
            <div>
                <form class="schFrm">
                    <input type="text" name="schBox" placeholder="여행지를 검색해보세요" value="${param.keyword}">
                    <button type="button" id="titleBtn"></button>
                </form>
                <input type="checkbox" class="sortBtn" id="sort">
                <label for="sort">조회순</label>
            </div>

            <a href="./Community_WriteSch" class="postBtn" onclick="checkLoginStatus(event, '${user.userid}')">작성하기</a>

        </div>

        <div class="schAll">
         	<c:choose>
		        <c:when test="${empty schedule_List}">
		            <div class="noneResult">
			            <img src="./source/nosearch.png">
			            <p>검색 결과가 존재하지 않습니다</p>
			        </div>	
		        </c:when>
		        
		        

        
        
        <c:otherwise>
			<c:forEach var="slist" items="${schedule_List}" varStatus="loop">
            <div class="schOne">
            <input type="hidden" value="${slist.userid}">
            <input type="hidden" value="${slist.creatdate}">
                <div class="schTopInfo">
                    <div class="schUser">
                        <img src="./source/${slist.image}.jpg">
                        <div>
                            <p class="schNicK">${slist.name}</p>
                            <fmt:formatNumber value="${slist.age}" pattern="0" var="roundedValue" />
							<c:set var="truncatedValue" value="${ roundedValue - ( roundedValue % 10 )}" />
                            <p class="subTxt">${truncatedValue}대 • ${slist.gender}</p>
                        </div>
                    </div>
                    <div class="schDays">
                        <p>여행기간&nbsp;&nbsp;<span class="days">${slist.period}일</span></p>
                        <p class="subTxt">
                            ${slist.startdate} ~ ${slist.enddate}
                        </p>
                    </div>
                </div>
                <div class="schMap schMap0${loop.index}"></div>
                <div class="schBottom">
                    <div>
                        <img src="./source/loc.png" class="locIco">
                        <span class="schLoc">${slist.loc}</span>
                    </div>
                    <a href="./schedule_detail?schedule_key=${slist.schedule_key}" class="detailBtn">일정 상세보기</a>
                </div>

                <div class="dayLocAll">
                    <div class="dayAll">
                    <c:forEach var="sinfo" items="${slist.schedule_List_Info}" varStatus="sinfoStatus">
			            	<c:choose>
						        <c:when test="${sinfoStatus.index == 0}">
						             <span class="day active" 
						             onclick="handleDayClick(this, ${sinfo.value[0].lat}, ${sinfo.value[0].lng}, ${loop.index})">Day${sinfo.key}</span>
						        </c:when>
						        <c:otherwise>
						             <span class="day" 
						             onclick="handleDayClick(this, ${sinfo.value[0].lat}, ${sinfo.value[0].lng}, ${loop.index})">Day${sinfo.key}</span>

						        </c:otherwise>
						    </c:choose>
						    	
                    </c:forEach>
                    </div>
                    <div class="locList">
								
						<c:forEach var="sinfo" items="${slist.schedule_List_Info}" varStatus="sinfo02Status">
						    <c:choose>
						        <c:when test="${sinfo02Status.index == 0}">
						            <ul class="active">
						        </c:when>
						        <c:otherwise>
						            <ul class="">
						        </c:otherwise>
						    </c:choose>
					        <c:forEach var="sinfo02" items="${sinfo.value}">
					        
	     						<c:choose>
							        <c:when test="${sinfo02.name ne null}">
							        	<li onclick="liClick('${sinfo02.name}',${sinfo02.lat},${sinfo02.lng})">${sinfo02.name}</li>
										<input type="hidden" id="lat" value="${sinfo02.lat}">
										<input type="hidden" id="lng" value="${sinfo02.lng}">
										<input type="hidden" id="schedule_key" value="${sinfo02.schedule_key}">
										<input type="hidden" id="name" value="${sinfo02.name}">
							        	
							        </c:when>
		     						<c:otherwise>
										<li class='noLoc'>저장된 일정이 없습니다.</li>
										<input type="hidden" id="lat" value="${sinfo02.lat}">
										<input type="hidden" id="lng" value="${sinfo02.lng}">
		     						</c:otherwise>
							    </c:choose>
						    
							</c:forEach> 
				        </ul>
					</c:forEach> 
                    </div>
                    
                    
                </div>
                
            </div>
</c:forEach>  
      	        </c:otherwise>
			    </c:choose>          
            </div>
        </div>
        

		 
		
<input type="hidden" value="${paraMap.searchType}" id="chbox">
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
        <img src="./source/logo_white.png">
        <p><a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a></p>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>

    <script src="./js/header.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUGU4a6_du1rtCwNDAGCRROJteWTuVS2E&callback=initMap"></script>

</body>
<script type="text/javascript">
$(document).ready(function () {
	// 페이지 컬러
    var color = ${pagination.currPageNo};
    $(".pagination .pageNum").each(function() {
        if ($(this).val() === color.toString()) {
            $(this).addClass("active");
        }
    });
    
    
    var useridVal = "${user.userid}";
    
    $(".postBtn").click(function(){
    	
	    if(!useridVal){
		
	    	alert("로그인 후 이용바랍니다.")
		    location.href = "/login"; 
	    
	    }else{
	    	location.href = "./Community_WriteSch";
	    }
	    
    })
    
})	
document.addEventListener("DOMContentLoaded", function() {
});

// 클래스 이름이 "counted-div"인 요소들을 선택
var divElements = document.querySelectorAll(".schOne");

// 요소의 개수 출력
console.log("Number of div elements:", divElements.length);

function initMap() {
//schOne

	var divElements = document.querySelectorAll(".schOne");

	divElements.forEach(function(element, idx) {
	    var locListDiv = element.querySelector('.locList');
	    var firstUl = locListDiv.querySelector('ul:first-child');

	    if (firstUl) {
	        var firstLi = firstUl.querySelector('li:first-child');
	        var latValue = firstLi.nextElementSibling.value;
	        var lngValue = firstLi.nextElementSibling.nextElementSibling.value;


	        var latLng = new google.maps.LatLng(parseFloat(latValue), parseFloat(lngValue));

	        var map = new google.maps.Map(element.querySelector(".schMap0" + idx), {
	            center: latLng,
	            zoom: 8,
	            disableDefaultUI: true,
	        });
	        
	        

	    }
	});
	

	function handleDayClick(dayElement, latValue, lngValue) {
	    var clickedLatLng = new google.maps.LatLng(latValue, lngValue);
	    map.panTo(clickedLatLng);
	    
	    console.log("lat value:", latValue);
	    console.log("lng value:", lngValue);
	}





	};





	// -------------- day 별 장소 리스트 보이기 ------------------
var markers = [];
function handleDayClick(dayElement, latValue, lngValue, index) {
    console.log("Creating map for index:", index);
    // 해당 날짜 요소의 인덱스에 해당하는 지도 컨테이너 요소를 찾습니다.
    var mapDiv = dayElement.closest('.schOne').querySelector(".schMap0" + index);

    if (mapDiv) {
        // 클릭한 위치의 좌표를 생성합니다.
        var clickedLatLng = new google.maps.LatLng(latValue, lngValue);
        // 지도를 생성하고 해당 위치를 중심으로 설정합니다.
        var map = new google.maps.Map(mapDiv, {
            center: clickedLatLng,
            zoom: 8,
            disableDefaultUI: true, // 지도 UI 비활성화
        });
        
        
        
        
        
        // 날짜 요소와 연결된 모든 요소들을 찾습니다.
        var dayAllDiv = dayElement.closest('.schOne').querySelector(".dayAll");
        var dayAllDiv01 = dayElement.closest('.schOne').querySelector(".dayLocAll");
        var allDayElements = dayAllDiv.querySelectorAll(".day"); // 모든 날짜 요소들
        const dayLoc = dayAllDiv01.querySelectorAll(".locList ul"); // 모든 위치 리스트 요소들
        
        // 배열에서 마커를 생성하여 추가합니다.
        var marker = new google.maps.Marker({
            position: clickedLatLng,
            map: map,
            title: "Clicked Location", // 마커에 표시할 타이틀 설정
        });
        
        
        
        
        // 클릭한 .day 요소의 인덱스를 찾습니다.
        var clickedIndex = Array.from(allDayElements).indexOf(dayElement);
        console.log("Clicked day index:", clickedIndex);

        // 클릭한 요소가 활성화되지 않은 경우
        if (!dayElement.classList.contains("active")) {
            // 모든 날짜 요소들의 활성 클래스를 제거합니다.
            allDayElements.forEach(function(otherDayElement) {
                otherDayElement.classList.remove("active");
            });
            
            // 모든 위치 리스트 요소들의 클래스를 초기화합니다.
            for(var i=0; i < dayLoc.length; i++){
                dayLoc[i].removeAttribute('class');
            }
            
            // 클릭한 날짜에 해당하는 위치 리스트 요소에 활성 클래스를 추가합니다.
            dayLoc[clickedIndex].setAttribute('class','active');
            
            // 클릭한 날짜 요소에 활성 클래스를 추가합니다.
            dayElement.classList.add("active");
            
            
        } else {
            // 클릭한 날짜 요소가 이미 활성화된 경우 활성 클래스를 제거합니다.
            //dayElement.classList.remove("active");
        }
        markers.push(marker);

    } else {
        console.log("Map div not found for index:", index);
    }
}


const dayLoc = document.querySelectorAll(".locList ul");




function liClick(name, lat, lng, scheduleKey) {
    // 클릭한 위치의 좌표를 생성합니다.
    var clickedLatLng = new google.maps.LatLng(lat, lng);
    
    // 해당 게시물의 지도 컨테이너 요소를 찾습니다.
    var mapContainer = document.querySelector("#map_" + scheduleKey);

    if (mapContainer) {
        // 새로운 마커를 생성하여 추가합니다.
        var marker = new google.maps.Marker({
            position: clickedLatLng,
            map: mapContainer.map,
            title: name, // 위치 이름을 타이틀로 설정
        });

        // 배열에 마커를 추가합니다.
        mapContainer.markers.push(marker);

        // 지도를 클릭한 위치로 이동시킵니다.
        mapContainer.map.setCenter(clickedLatLng);
    }
}



window.initMap = initMap;



	//이전 버튼
	function fn_prev(currPageNo, range, pageSize) {

		var currPageNo = (range - 1) * pageSize;
		var range = range -1;

		var url = "Schedule_List";
		url = url + "?currPageNo=" + currPageNo;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $("#chbox").val();
		url = url + "&keyword=" + $("[name=schBox]").val();
		location.href = url;

	}

	//페이지 번호 클릭
	function fn_pagination(currPageNo, range) {
		var url = "Schedule_List";
		url = url + "?currPageNo=" + currPageNo;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $("#chbox").val();
		url = url + "&keyword=" + $("[name=schBox]").val();
		location.href = url;

	}
	//다음 버튼 이벤트
	function fn_next(currPageNo, range, pageSize) {

		var currPageNo = (range * pageSize) + 1;
		var range = parseInt(range) + 1;	

		var url = "Schedule_List";
		url = url + "?currPageNo=" + currPageNo;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $("#chbox").val();
		url = url + "&keyword=" + $("[name=schBox]").val();
		location.href = url;
	}

	if($("#chbox").val()!=""){
		$("#sort").prop("checked", true);
	} 
	
	// 조회수 버튼 여부
	$("#sort").change(function() {
	    if ($(this).prop("checked")) {
	    	
			var url = "Schedule_List";
			url = url + "?currPageNo=1";
			url = url + "&range=1";
			url = url + "&searchType=" + "checkOn";;
			url = url + "&keyword=" + $("[name=schBox]").val();
			location.href = url;
	    } else {
			var url = "Schedule_List";
			url = url + "?currPageNo=1";
			url = url + "&range=1";
			url = url + "&searchType=" + "";
			url = url + "&keyword=" + $("[name=schBox]").val();
			location.href = url;
	    }
	  });
	
	// 제목 검색 
	$("#titleBtn").click(function(currPageNo, range, pageSize){

		var url = "Schedule_List?";
		url = url + "&currPageNo=1";
		url = url + "&range=1";
		url = url + "&searchType=" + $("#chbox").val();
		url = url + "&keyword=" + $("[name=schBox]").val();
		location.href = url;
	})

	function checkLoginStatus(event, userid) {
	    if (!userid) {
	    	alert("로그인 후 이용바랍니다.")
	        event.preventDefault(); 
	        window.location.href = "/login"; 
	    }
	}
</script>

</html>

