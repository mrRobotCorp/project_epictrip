z	<%@ page language="java" contentType="text/html; charset=UTF-8"
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
    <link href="./css/cDetail.css" rel="stylesheet">

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

    <section class="sDetailSection">
        <div class="mapInfoAll">
            <div class="schMap"></div>
            
            <div class="schInfo">
                <div class="infoTitle">
                    <a href="./Schedule_List" class="backBtn btn"></a>
                    <span>${scheduleIns.name} 님의 여행 일정</span>
                    <div class="btns">
                        <button type="button" class="uptBtn btn"></button>
                        <button type="button" class="delBtn btn"></button>
                    </div>
                </div>
                <span class="schDays">${scheduleIns.startdate} ~ ${scheduleIns.enddate}</span><p style="color:red;">더블클릭시 지도가 보입니다!</p>
                <div class="schLoc">${scheduleIns.loc}
                	<input type="hidden" value="${scheduleIns.userid}"id="iuserd">
                	<input type="hidden" value="${scheduleIns.loc}"id="locInfo">
                	<input type="hidden" value="${scheduleIns.schedule_key}"id="schedule_key">
                </div>

	                <div class="daySch"> 
                <c:forEach items="${scheduleDetails}" var="day">
                    <div class="dayOne" >
                        <div class="dayTxt">
                            <span class="dNum">Day ${day.day_num}</span>
                            <span class="date">${day.sch[0].daydate}</span>
                        </div>
                        <c:forEach items="${day.sch}" var="dayInfo" varStatus="loop">
                            	<c:choose>
							        <c:when test="${dayInfo.place_name ne null}">
				                        <div class="schMemo">
				                            <span class="memoCnt">${loop.index +1}</span>
				                            <span class="memoTxt">${dayInfo.place_name}</span>
				                            <input type="hidden" value="${loop.index +1}" id="idx">
				                            <input type="hidden" value="${dayInfo.place_name}" id="name">
				                            <input type="hidden" value="${dayInfo.lat}" id="latInfo">
				                            <input type="hidden" value="${dayInfo.lng}" id="lngInfo">
				                        </div>
							        </c:when>
		     						<c:otherwise>
				                        <div class="schMemo">
				                            <span class="memoCnt">${loop.index +1}</span>
				                            <span class="memoTxt">저장된 일정이 없습니다.</span>
				                            <input type="hidden" value="${loop.index +1}" id="idx">
				                            <input type="hidden" value="${dayInfo.place_name}" id="name">
				                            <input type="hidden" value="${dayInfo.lat}" id="latInfo">
				                            <input type="hidden" value="${dayInfo.lng}" id="lngInfo">
				                        </div>
		     						</c:otherwise>
							    </c:choose>
                            
                 		</c:forEach>
                    </div>
                </c:forEach>
	                    
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


    <script src="./js/header.js"></script>
    <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUGU4a6_du1rtCwNDAGCRROJteWTuVS2E&callback=initMap"></script>
</body>
<script type="text/javascript">

// 서울,중국... 처음위치 표기하기



$(document).ready(function() {
	var userIdval = "${user.userid}"
    var memoData = [];

	if(userIdval != $("#iuserd").val()){
		$(".delBtn").hide()
		$(".uptBtn").hide()
	}
	
    $(".dayOne").dblclick(function() {
    	memoData = [];
        $(this).find(".schMemo").each(function() {
            var idx = $(this).find("#idx").val();
            var name = $(this).find("#name").val();
            var lat = parseInt($(this).find("#latInfo").val());
            var lng = parseInt($(this).find("#lngInfo").val());

            memoData.push({
            	label: idx,
            	name: name,
            	lat: lat,
            	lng: lng
            });
        });
        initMap(memoData)
        console.log(memoData);
    });

    // 삭제
    $(".delBtn").click(function(){
    	
    	if(confirm("삭제 하시겠습니까?")){
    		$.ajax({
    		    type: "get",
    		    url: "/schedule_del01", // 포트 번호를 생략하고 경로만 지정
    		    data: {
    		        userid: userIdval,
    		        schedule_key: $("#schedule_key").val()
    		    },
    		    dataType: "text",
    		    success: function (msg) {
    		        alert(msg);  // 삭제 성공 메시지를 알림으로 띄움
    		        if(msg=="삭제 성공"){
    		      		location.href = "Schedule_List";  // Schedule_List 페이지로 리다이렉트
    		        }
    		    },
    		    error: function (err) {
    		        console.log(err);
    		    }
    		    
    		    
    		});


    	}else{
    		
    	}
    	
    })
});


	function initMap(info) {
		var latLng = new google.maps.LatLng(info[0])
		
	
	    const map = new google.maps.Map(document.querySelector(".schMap"), {
	        center: latLng,
	        zoom: 8,
	        disableDefaultUI: true,
	    });
	
	    // ---------- marker 표시 ------------
	    info.forEach(({ label, name, lat, lng }) => {
	        const marker = new google.maps.Marker({
	            position: { lat, lng },
	            label,
	            map,
	        });
	    }) 
	    
	    // ---------- 선 표시 ------------
	  const flightPath = new google.maps.Polyline({
	    path: info,
	    geodesic: true,
	    strokeColor: "#FF0000",
	    strokeOpacity: 1.0,
	    strokeWeight: 2,
	  });

  	flightPath.setMap(map);
	window.initMap = initMap;
	};
	
	
	$(".uptBtn").click(function(){
		
		location.href = "Community_WriteUpt?schedule_key="+$("#schedule_key").val(); 
	})

</script>

</html>



