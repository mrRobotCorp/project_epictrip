
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
<link href="./css/cWriteSch.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.3/gsap.min.js"></script>

</head>

<body>
	<header>
		<nav>
			<a href="./EpicTrip"><img class="headLogo"
				src="./source/logo.png"></a>
			<div class="gnb">
				<ul class="gnbTab">
					<li><a href="/Store" class="store">여행상점</a></li>
					<li><a href="/Community_Group" class="community">커뮤니티</a></li>
				</ul>

				<%-- 로그인 되어 있을 경우 --%>
				<c:if test="${not empty user.userid}">
					<div class="userHead">
						<a href="/message"><img class="msgImg" src="./source/msg.png"></a>
						<a href="/Mypage_mymain?userid=${user.userid}"><img
							class="userImg" src="./source/${user.image}.jpg"></a>
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
						<a href="/login">로그인</a> <a href="/join">회원가입</a>
					</div>
				</c:if>

			</div>
		</nav>
		<div class="gnbBottom">
			<a href="/Community_Group" class="together"> <img
				src="./source/group.png"> <span>동행</span>
			</a> <a href="/Schedule_List" class="sche"> <img
				src="./source/date.png"> <span>일정</span>
			</a>
		</div>
	</header>

	<section class="cWriteSection">
		<form action="" class="schFrm">
			<div class="selecAll">
				<div class="opLine">
					<input type="hidden" value="한국" id="country"> <span>한국</span>
					<div class="options">
						<input id="loc01" type="radio" name="loc" value="서울"> <label
							for="loc01">서울</label> <input id="loc02" type="radio" name="loc"
							value="강원도"> <label for="loc02">강원도</label> <input
							id="loc03" type="radio" name="loc" value="제주"> <label
							for="loc03">제주</label> <input id="loc04" type="radio" name="loc"
							value="부산"> <label for="loc04">부산</label> <input
							id="loc05" type="radio" name="loc" value="경기도"> <label
							for="loc05">경기도</label> <input id="loc06" type="radio" name="loc"
							value="인천"> <label for="loc06">인천</label> <input
							id="loc07" type="radio" name="loc" value="충청도"> <label
							for="loc07">충청도</label> <input id="loc08" type="radio" name="loc"
							value="경상도"> <label for="loc08">경상도</label> <input
							id="loc09" type="radio" name="loc" value="전라도"> <label
							for="loc09">전라도</label> <input id="loc10" type="radio" name="loc"
							value="울릉도"> <label for="loc10">울릉도</label>
					</div>
				</div>
				<div class="opLine">
					<input type="hidden" value="일본" id="country"> <span>일본</span>
					<div class="options">
						<input id="loc11" type="radio" name="loc" value="도쿄"> <label
							for="loc11">도쿄</label> <input id="loc12" type="radio" name="loc"
							value="오사카"> <label for="loc12">오사카</label> <input
							id="loc13" type="radio" name="loc" value="후쿠오카"> <label
							for="loc13">후쿠오카</label> <input id="loc14" type="radio"
							name="loc" value="오키나와"> <label for="loc14">오키나와</label>
						<input id="loc15" type="radio" name="loc" value="나고야"> <label
							for="loc15">나고야</label> <input id="loc16" type="radio" name="loc"
							value="교토"> <label for="loc16">교토</label> <input
							id="loc17" type="radio" name="loc" value="훗카이도"> <label
							for="loc17">훗카이도</label> <input id="loc18" type="radio"
							name="loc" value="히로시마"> <label for="loc18">히로시마</label>
						<input id="loc19" type="radio" name="loc" value="나가노"> <label
							for="loc19">나가노</label>
					</div>
				</div>
				<div class="opLine">
					<input type="hidden" value="홍콩" id="country"> <span>홍콩</span>
					<div class="options">
						<input id="loc20" type="radio" name="loc" value="홍콩"> <label
							for="loc20">홍콩</label>
					</div>
				</div>
				<div class="opLine">
					<input type="hidden" value="마카오" id="country"> <span>마카오</span>
					<div class="options">
						<input id="loc21" type="radio" name="loc" value="마카오"> <label
							for="loc21">마카오</label>
					</div>
				</div>
				<div class="opLine">
					<input type="hidden" value="대만" id="country"> <span>대만</span>
					<div class="options">
						<input id="loc22" type="radio" name="loc" value="타이페이"> <label
							for="loc22">타이페이</label> <input id="loc23" type="radio"
							name="loc" value="타이중"> <label for="loc23">타이중</label> <input
							id="loc24" type="radio" name="loc" value="가오슝"> <label
							for="loc24">가오슝</label>
					</div>
				</div>
				<div class="opLine">
					<input type="hidden" value="중국" id="country"> <span>중국</span>
					<div class="options">
						<input id="loc25" type="radio" name="loc" value="상하이"> <label
							for="loc25">상하이</label> <input id="loc26" type="radio" name="loc"
							value="베이징"> <label for="loc26">베이징</label> <input
							id="loc27" type="radio" name="loc" value="칭다오"> <label
							for="loc27">칭다오</label> <input id="loc28" type="radio" name="loc"
							value="청두"> <label for="loc28">청두</label> <input
							id="loc29" type="radio" name="loc" value="광저우"> <label
							for="loc29">광저우</label> <input id="loc30" type="radio" name="loc"
							value="하이난"> <label for="loc30">하이난</label> <input
							id="loc31" type="radio" name="loc" value="장가계"> <label
							for="loc31">장가계</label> <input id="loc32" type="radio" name="loc"
							value="충칭"> <label for="loc32">충칭</label> <input
							id="loc33" type="radio" name="loc" value="서안"> <label
							for="loc33">서안</label>
					</div>
				</div>
				<div class="opLine">
					<input type="hidden" value="몽골" id="country"> <span>몽골</span>
					<div class="options">
						<input id="loc34" type="radio" name="loc" value="울란바토르"> <label
							for="loc34">울란바토르</label>
					</div>
				</div>

				<div class="dateSelec">
					<span id="dateClick">날짜 선택 버튼</span>
					<div class="dateInput">
						<div class="dpDiv">
							<input type="text" class="datePick startDay" placeholder="첫째날 선택"
								id="startdate">
						</div>
						<div class="dpDiv">
							<input type="text" class="datePick endDay" placeholder="마지막날 선택"
								id="enddate">
						</div>
					</div>
				</div>
			</div>

			<div class="detailWrite">
				<div class="mapInfoAll">
					<div class="schMap"></div>

					<div class="schInfo">
						<div class="infoTitle">
							<a href="./Community_Schedule.html" class="backBtn btn"></a> <span>${user.userid}
								님의 여행 일정</span> <span class="delBtn btn"></span>
						</div>
						<span class="schDays"></span><p style="color:red;">더블클릭시 지도가 보입니다!</p>
						<div class="schLoc">여행위치</div>

						<div class="daySch"></div>
					</div>

				</div>

				<button type="button" class="submitBtn">작성완료</button>
			</div>
		</form>

		<div class="modalBg">
			<div class="locModal">
				<h4>장소 추가하기</h4>
				<div class="schBox">
					<input type="text" placeholder="장소를 입력해주세요" class="addLocTxt"
						value="">
					<button type="button" class="locSchBtn"></button>
				</div>
				<form class="schLocBox">
					<div class='locAll'></div>
					<button type="button" class="addBtn">추가하기</button>
				</form>

				<div class="cls">
					<button type="button" class="clsBtn"></button>
				</div>
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
	<script defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUGU4a6_du1rtCwNDAGCRROJteWTuVS2E&callback=initMap"></script>
</body>
<script type="text/javascript">
$(document).ready(function() {


	// 지도에 넣을 데이터
	var memoData = [];
	
	// 인서트 할때 받을 day 데이터
	var Schedule_insert02 = [];
	var locInsert = "";
	var startInsert = "";
	var endInsert = "";
	// 유저 ID 세션
	var userid = "${user.userid}";
	
	
	// 지역 데이터 
	var daynum = 0;
    var key = "";
    var name = "";
    var lat = "";
    var lng = "";
    
// 	날짜 선택 버튼으로 변환
	$("#dateClick").click(function(){
		var boxNumber = "";
		var startDate = $("#startdate").val() // 시작날짜
		var endDate = $("#enddate").val() // 마지막 날짜
		var startDate01 = new Date($("#startdate").val()) // date형식으로 재설정
		var endDate01 = new Date($("#enddate").val()) // 위와 같음
		var timeDiff = endDate01 - startDate01; // 마지막날짜 - 시작날짜
		var daysDiff = timeDiff / (1000 * 60 * 60 * 24)+1; // 숫자로
		
		// 시작날짜가 마지막날짜보다 크다면 이상하기 때문에
		if(startDate01>endDate01){
			alert("다시 선택해 주세요")
		}else{
		console.log(startDate)
		console.log(endDate)
		console.log(daysDiff) // 여행 날짜
		// 화면에 표시
		$(".schDays").text(startDate+" ~ "+endDate)
		// 시작날 - 마지막날 에맞게 for문으로 만들기
		var datsShow = "";
		var dayLocNum = 1;
			for(i=1; i<=daysDiff; i++){
				datsShow += '<div class="dayOne"><div class="dayTxt">'
				datsShow += '<span class="dNum">Day '+i+'</span>'
				datsShow += '<input type="hidden" id="daynum" value="'+i+'">'
				datsShow += '<button type="button" class="locAdd" >장소 추가하기</button></div>'
				datsShow += '</div>'

			}
			$(".daySch").html(datsShow); //추가
			
		
			
// ------------------ modal ---------------------
		    const modal = document.querySelector(".modalBg");
		    const clsBtn = document.querySelector(".cls");
		    const locAdd = document.querySelectorAll(".locAdd");

		    function showModal() {
		        modal.classList.add("active")
		    }

		    function clsModal() {
		        modal.classList.remove("active");
		    }

		    $(".locAdd").click(function() {
		    	$("[name='ds']").prop("checked", false);
		        showModal();
		        var locDatsShow = "";
		        var thisCall = $(this)
		        var dayOne = $(this).closest(".dayOne");
			
		        $(".addBtn").off("click").on("click", function() {
		            var memoTxtCount = dayOne.find(".schMemo #shName").length + 1;
		            daynum = dayOne.find("#daynum").val();
		        	
		            locDatsShow += '<div class="schMemo">';
		            locDatsShow += '<span class="memoCnt">' + memoTxtCount + '</span>';
		            locDatsShow += '<input type="text" class="memoTxt" value="'+name+'" id="shName" disabled>';
		            locDatsShow += '<input type="hidden" class="memoTxt" value="'+memoTxtCount+'" id="label">';
		            locDatsShow += '<input type="hidden" class="memoTxt" value="'+key+'" id="keyInfo">';
		            locDatsShow += '<input type="hidden" class="memoTxt" value="'+lat+'" id="latInfo">';
		            locDatsShow += '<input type="hidden" class="memoTxt" value="'+lng+'" id="lngInfo">';
		            locDatsShow += '<input type="hidden" class="memoTxt" value="'+daynum+'" id="daynumInfo">';
		            locDatsShow += '</div>';

                    console.log("memoTxtCount:", memoTxtCount);
                    console.log("Key:", key);
                    console.log("Name:", name);
                    console.log("Lat:", lat);
                    console.log("Lng:", lng);
                    console.log("daynum:", daynum);
                    

                    
		            dayOne.append(locDatsShow);
		            clsModal();
				

		        });
		    });


		    
		    clsBtn.onclick = function() {
		        clsModal();
		    }; 

		    $(".dayOne").dblclick(function (){
		        memoData = []; // 배열 초기화
		        $(this).find(".schMemo").each(function () {
		        	
		            var memoTxtCount = $(this).find(".memoCnt").text(); // 수정: .memoCnt 요소의 텍스트 추출
		            var name = $(this).find(".memoTxt#shName").val(); // 수정: .memoTxt#shName 요소의 값 추출
		            var lat = parseInt($(this).find(".memoTxt#latInfo").val()); // 수정: .memoTxt#latInfo 요소의 값 추출
		            var lng = parseInt($(this).find(".memoTxt#lngInfo").val()); // 수정: .memoTxt#lngInfo 요소의 값 추출
		            
		            memoData.push({
		                label: memoTxtCount,
		                name: name,
		                lat: lat,
		                lng: lng
		            });
		        });
		        
		        initMap(memoData);
		        console.log(memoData);
		    });
			

		    
		    $(".submitBtn").click(function(){
		    	
		    	// 스케쥴
		    	startInsert = startDate;
		    	endInsert = endDate;

				console.log(locInsert)		    	
				console.log(typeof(startInsert))		    	
				console.log(endInsert)		    	
				console.log(userid)		  
				console.log(locName)		  
				console.log(loc02)		  

				
		    	//스케쥴_플레이스 
				Schedule_insert02 = [];
				$(".dayOne").each(function (idx, i) {
				    var data = $(this).find(".schMemo");
				    if (data.length > 0) {
				        
				        data.each(function(){
				            var place_key = $(this).find("#keyInfo").val();
				            var daynum = parseInt($(this).find("#daynumInfo").val());
					        Schedule_insert02.push({
					            place_key: place_key,
					            daynum: daynum,
					        });
					        
				        });
				        
				    } else {
				        Schedule_insert02.push({
				            place_key: "setnull",
				            daynum: idx+1,
				        });
				    }
				});
				
				console.log(Schedule_insert02);

					$.ajax({
					    type: "post",
					    url: "${path}/Community_Insert",
					    data: JSON.stringify({
					        startdateS: startInsert, // 문자열 그대로 전달
					        enddateS: endInsert,     // 문자열 그대로 전달
					        userid: '${user.userid}',
					        loc: locName,
					        loc02: loc02,
					        Schedule_insert02: Schedule_insert02, // 직렬화하지 않음
					    }),
					    dataType: "json", // 응답 데이터 형식
					    contentType: "application/json",
					    success: function (msg) {
					        console.log(msg);
					    },
					    error: function (err) {
					        console.log(err);
					    }
					}); 
				
			        location.href = "/Schedule_List"
		    	})
		}

	})
	

		// 나라 선택
	var locName = "";
	var loc02 = "";
	var namedata = "";
       // 지역 선택 로직
        $("[name=loc]").click(function () {
            console.log($(this).val());
            $("#prodloc").val($(this).val())
            loc02 = $(this).val();
            // 나라 선택 로직
            selectedCountry = $(this).closest(".opLine").find("#country").val();
            $("[name=country]").val(selectedCountry)
            console.log(selectedCountry)
            locName = selectedCountry
            $(".schLoc").text(locName)
            ajaxSch()
            
        });
	
	
	

    
    // 추가하기

    
    
    // -------------장소 검색-----------------------
    $(".locSchBtn").click(function(){
    	console.log($(".addLocTxt").val())
    	namedata = $(".addLocTxt").val()
    	ajaxSch()
    })
    

    
    // ---------- 지역 데이터 불러오기 ------------
    function ajaxSch(){
    	console.log(namedata)
        $.ajax({
            type: "get",
            url: "${path}/placeInfo",
            data: {
                loc: locName,
                name: namedata,
            },
            dataType: "json",
            success: function(response) {
                console.log("요청 성공:", response);

                var show = "";

                response.forEach(function(item, idx) {
                    var name = item.name; // 예시: 응답 데이터에서 name 항목 사용

                    show += "<input type='radio' id='ds0"+idx+"' name='ds' value=''>";
                    show += "<label for='ds0"+idx+"'>";
                    show += "<input type='hidden' id='key"+idx+"' value='"+item.place_key+"'>";
                    show += "<input type='hidden' id='name"+idx+"' value='"+item.name+"'>";
                    show += "<input type='hidden' id='lat"+idx+"' value='"+item.lat+"'>";
                    show += "<input type='hidden' id='lng"+idx+"' value='"+item.lng+"'>";
                    show += "<span>" + name + "</span>";
                    show += "<div class='check'></div>";
                    show += "</label>";
                });

                $(".locAll").html(show);
                
                $("input[name='ds']").change(function() {
                    if ($(this).is(":checked")) {
                        index = $(this).index("input[name='ds']");
                        key = $("#key" + (index)).val();
                        name = $("#name" + (index)).val();
                        lat = $("#lat" + (index)).val();
                        lng = $("#lng" + (index)).val();
                        
                    }
                });
                
                
                
                
                
            },
            error: function(error) {
                // 요청이 실패했을 때 실행할 코드
                console.log("요청 실패:", status, error);
            }
        });
    }

});

// ----------- 날짜 선택 -----------------
$(function () {
    $(".datePick").datepicker({
        dateFormat: 'yy-mm-dd',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        onSelect: function(dateText, inst) {// 날짜 벨류 추출
            console.log("Selected date:", dateText);
        }
    });

	
	
	
	
	
	
});


//----------- 일정 map -----------------
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







</script>
</html>