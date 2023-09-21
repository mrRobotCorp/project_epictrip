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
    <link href="./css/adCalendar.css" rel="stylesheet">
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
					            <li><a href="/Admin">관리자 일정</a></li>
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
        <div id='calendar'></div>

        <div class="modalBg">
            <div class="saleModel">
                <h4 class="saleRate">일일 총 판매량</h4>
                <h3><span id="clickDate"></span> 판매 리스트</h3>
                
                <ul class="listHead listRow">
                    <li>구매시간</li>
                    <li>상품 이름</li>
                    <li>결제자 아이디</li>
                    <li>선택 날짜</li>
                    <li>인원</li>
                    <li>결제 가격</li>
                </ul>
                <div class="saleListAll">
                   <!-- 데이터 들어갈곳 --> 
                </div>

                <div class="cls">
                    <button type="button" class="clsBtn"></button>
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

    <script src="./js/index.global.js"></script>
    <script src="./js/header.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
        	if('${user.userid}'==''){
	        		alert("회원만 입장 가능합니다")
	        		location.href = "/EpicTrip"
        	}else if('${user.auth}'!='admin'){
        		alert("관리자만 입장 가능합니다")
        		location.href = "/EpicTrip"
        	}
        	var monthVal = []
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth',
                },
                datesSet: function (info) { // 현재 월 출력
                
                 var input = info.view.title;

                 // "년"과 "월"을 공백으로 분리하여 배열에 저장
                 var parts = input.split(" ");
                 var year = parts[0].slice(0, -1); // "년" 제거 후 연도만 저장
                 var month = parts[1].slice(0, -1); // "월" 제거 후 월만 저장

                 // 월을 두 자리 숫자로 포맷
                 month = month.padStart(2, '0');

                 // YYYY-MM 형식으로 조합
                 var monthDate = year + '-' + month;
                    
					$.ajax({
					    type: "post",
					    url: "Admin_Month",
					    data: {
					    	month: monthDate,
					    },
					    dataType: "json", // dataType을 "json"으로 변경
					    success: function (jsonData) {
					    	monthVal = [];
		                	jsonData.forEach(function(item) {
		                	    var title = '총 '+item.daily_sales.toLocaleString() + '원 : ' + item.tot_cnt + '인';
		                	    var start = item.sales_day;

		                	    monthVal.push({
		                	        title: title,
		                	        start: start
		                	    });
		                	    
		                	});
		                	calendar.setOption('events', monthVal);
					    },
					    error: function (err) {
					        console.log(err)
					    }

					})
			            console.log(monthVal);
                	
                },
                navLinks: false,
                selectable: true,
                selectMirror: true,

                height: 750,
                titleFormat: function (date) {
                    year = date.date.year;
                    month = date.date.month + 1;
                    return year + "년 " + month + "월";
                    console.log(month)
                },
                fixedWeekCount: false,
                buttonText: {
                    today: "오늘",
                    month: "월별",
                    week: "주별",
                },
                dayClick: function () {
                	showModal(); // 클릭시 모달 창
                },
                eventClick: function (event, jsEvent, view) {
                },
                select: function (arg) {
                	var startDate = arg.startStr; //시작날짜
                	
	                	// 시간이 24시라 다음날로 넘어감 1초를 빼서 오늘로 변환
	                	var inputDate = new Date(arg.end)
	                	inputDate.setHours(inputDate.getSeconds() - 1); // -1초
	                	var year = inputDate.getFullYear();
	                	var month = String(inputDate.getMonth() + 1).padStart(2, '0');
	                	var day = String(inputDate.getDate()).padStart(2, '0');
	                	var endDate = year + '-' + month + '-' + day; //마지막 날짜
                	
                	console.log(startDate); 
                	console.log(endDate);
					var adminlist = document.querySelector('.saleListAll');
					adminlist.innerHTML = ""
					$.ajax({
					    type: "post",
					    url: "Admin_List",
					    data: {
					        startDate: startDate,
					        endDate: endDate
					    },
					    dataType: "json", // dataType을 "json"으로 변경
					    success: function (jsonData) {
					        jsonData.forEach(function (data) {
					        	var paydate = data.paydate;
					        	// 정규 표현식을 사용하여 초(Seconds)를 제거합니다.
					        	var paydateStr = paydate.substring(0, paydate.length - 3);


					            var ul = document.createElement('ul');
					            ul.classList.add('listRow');

					            ul.innerHTML += `
					                <li>`+ paydateStr +`</li>
					                <li>`+ data.prodtitle +`</li>
					                <li>`+data.userid+`</li>
					                <li>`+data.choicedate +`</li>
					                <li>`+data.people +`</li>
					                <li>`+data.totprice.toString().replace(/^0+/, '').replace(/\B(?=(\d{3})+(?!\d))/g, ',') +`</li>
					            `;

					            adminlist.appendChild(ul);
					        })
					    },
					    error: function (err) {
					        console.log(err)
					    }
					})
                	
                    showModal();
                },

                editable: false, // 드래그 해서 수정 X
                dayMaxEvents: true, // allow "more" link when too many events
            });

      	  calendar.render();
        });

        // ------------------ modal ---------------------

        const modal = document.querySelector(".modalBg");
        const modalCon = document.querySelector(".saleModel");
        const clsBtn = document.querySelector(".cls");
        const locAdd = document.querySelectorAll(".locAdd");

        function showModal() {
            modal.classList.add("active")
        }

        function clsModal() {
            modal.classList.remove("active");
        }

        clsBtn.onclick = function () {
            clsModal();
        };

        document.addEventListener('mouseup', function (e) {
            if (!modalCon.contains(e.target)) {
                modal.classList.remove("active");
            }
        });
        // yyyy-MM 형식으로 포맷하는 함수
        function formatMonth(dateString) {
            var date = new Date(dateString);
            var year = date.getFullYear();
            var month = (date.getMonth() + 1).toString().padStart(2, '0');
            return year + '-' + month;
        }


    </script>
</body>

</html>