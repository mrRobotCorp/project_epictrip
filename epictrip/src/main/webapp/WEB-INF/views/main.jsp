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
    <link href="./css/main.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/slick.css" />
    <link rel="stylesheet" href="./css/slick_theme.css" />
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

    <section class="mainBanner">
        <div class="mainCon">
            <img src="./source/logo_white.png" class="mainBnLogo">
            <p>
                일상을 벗어나 <span class="boldTxt">특별한 여행</span>을 계획하고 싶은 이들을 위한 플랫폼<br>
                여행에 동행을 구하거나 일정을 공유할 수 있으며, 다양한 여행 상품을 경험해보세요.
            </p>
        </div>
        <div class="scrollDown">
            <span></span>Scroll
        </div>
    </section>

    <section class="mainSection">
        <div class="slider">
            <div class="bn01 bn">
			    <a href="/Store">
			        <div class="bContent01 bContent">
			            <p>한국 기획전 오픈</p>
			        </div>
			    </a>
            </div>
            <div class="bn02 bn">
            	<a href="/Store">
	                <div class="bContent02 bContent ">
	                    <p>대만 에어텔 보러가기</p>
	                </div>
                </a>
            </div>
            <div class="bn03 bn">
            	<a href="/Store">
	                <div class="bContent03 bContent ">
	                    <p>일본 1일 10만원부터 시작하는 에픽트립</p>
	                </div>
                </a>
            </div>
            <div class="bn04 bn">
     			<a href="/Store">
	                <div class="bContent04 bContent ">
	                    <p>베이징 시티투어 원데이</p>
	                </div>
                </a>
            </div>
        </div>

        <h3 class="titleTxt epicTxt">에픽트립 추천</h3>
        <div class="itemAll">
        <c:forEach var="slist" items="${storeInfo}">
        
            <a href="./Store_Detail?prodkey=${slist.prodkey}" class="itemOne item01">
                <div class="post">
                    <div class="postImg">
                        <img src="./source/storeImg/${slist.titleimage}" alt="">
                    </div>
                </div>
                <div class="postBottom">
                    <span id="infoText" class="infoText">${slist.prodtitle}</span>
                    <span id="locPay" class="locPay">
                        <p id="loc">${slist.country}</p>
                        <span id="price"><fmt:formatNumber value="${slist.price}"/>원</span>
                    </span>
                </div>
            </a>

        </c:forEach>
        </div>

        <h3 class="titleTxt"><span class="txtPple">동행</span>을 찾고 있어요</h3>
        <div class="groAll" id="contents">
			<a :href="'/Community_GroDetail?cpkey=' + company.cpkey" class="goDetail" v-for="company in companies.slice(0, 8)" :key="company.cpkey">
                <div class="schOne">
                    <div class="schTopInfo">
                        <div class="schUser">
                            <img :src="'./source/' + company.image + '.jpg'">
                            <div>
                                <p class="schNicK">{{ company.name }}</p>
								<p class="subTxt">{{ getAge(company.birth) }}대 • {{ company.gender }}</p>
                            </div>
                        </div>
                        <div class="schDays">
                            <p>여행기간&nbsp;&nbsp;<span class="days">{{ getTravelDays(company.startdate, company.enddate) }}일</span></p>
							<p class="subTxt">
							    {{ formatDate(company.startdate) }} ~ {{ formatDate(company.enddate) }}
							</p>
                        </div>
                    </div>
    
                    <div class="post post01">
    
                        <span class="postLoc" id="postLoc">{{ company.cploc }}</span>
                        <div class="postImg">
                             <img :src="'./source/groupImg/' + company.cpimage">
                            <div class="hiddenBox">
                                <p id="pCnt">{{ isRecruitmentEnded(company.enddate) ? '모집종료' : '모집중' }} | {{ company.cpnum }}명</p>
                                <div class="viewInner">
                                    <span class="viewCnt">{{ company.hits }}</span>
                                    <span class="chatCnt">{{ company.currentnum }}</span>
                                </div>
                            </div>
                        </div>
    
                    </div>
    
                    <div class="postBottom">
                        <h3 id="truncated">{{ company.cptitle }}</h3>
                        <p id="turncatedP">
							{{ company.cpcontent }}
                        </p>
                    </div>
                </div>
            </a>
        </div>

        <h3 class="titleTxt"><span class="txtPple">여행 일정</span>을 구경해보세요</h3>
        <div class="schAll">
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
						             <span class="day active" onclick="handleDayClick(this, ${sinfo.value[0].lat}, ${sinfo.value[0].lng}, ${loop.index})">Day${sinfo.key}</span>
						        </c:when>
						        <c:otherwise>
						             <span class="day" onclick="handleDayClick(this, ${sinfo.value[0].lat}, ${sinfo.value[0].lng}, ${loop.index})">Day${sinfo.key}</span>

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


        </div>

    </section>


    <footer>
        <div id="scrollTop">
            <span class="blind">맨 위로 가기</span>
            <div class="topTxt">Top</div>
        </div>
        <img src="./source/logo_white.png">
        <p><a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a></p>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUGU4a6_du1rtCwNDAGCRROJteWTuVS2E&callback=initMap"></script>
     <script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/axios@0.21.1/dist/axios.min.js"></script>
    <script src="./js/slick.min.js"></script>
    <script src="./js/header.js"></script>

    <script>
	new Vue({
	    el: '#contents',
	    data: {
	        companies: [],
	        companyPage: null,
	        cptitle: '',
	        orderType: '',
	        activeOrder: null,
	        pagination: {
	            currentPage: 1,
	            totalPages: 0
	        },
	        pageNumbers: []   // 새로운 데이터 속성 추가
	    },
	    created() {
	        this.fetchCompanyPage();
	    },
	    methods: {
	        fetchCompanyPage() {
	            axios.get('/companyPage', {
	                params: {
	                    cptitle: this.cptitle,
	                    orderType: this.orderType,
	                    currentPage: this.pagination.currentPage
	                }
	            })
	            .then(response => {
	                if (response.data.data && response.data.pagination) {
	                    this.companies = response.data.data;
	                    this.pagination = response.data.pagination;
	                    console.log("Pagination object:", this.pagination);
	                    this.pageNumbers = this.generatePageNumbers();  
	                    // 여기서 함수를 호출하여 pageNumbers 업데이트
	                } else {
	                    console.warn("Unexpected response structure:", response.data);
	                }
	            })
	            .catch(error => {
	                console.error("Error fetching company page:", error);
	            });
	        },
            search(event) {
                if (event) {
                    event.preventDefault();
                }
                this.fetchCompanyPage();
            },
            changeOrderType(order) {
                if (this.activeOrder === order) {
                    this.activeOrder = null;
                    this.orderType = '';
                } else {
                    this.activeOrder = order;
                    this.orderType = order;
                }
                this.fetchCompanyPage();
            },
	    	getAge(birthDateString) {
	            const today = new Date();
	            const birthDate = new Date(birthDateString);
	            let age = today.getFullYear() - birthDate.getFullYear();
	            const monthDifference = today.getMonth() - birthDate.getMonth();
	            if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
	                age--;
	            }
	            return Math.floor(age / 10) * 10; // 1의 자리를 내림
	    	},
	        getTravelDays(startDateString, endDateString) {
	            const startDate = new Date(startDateString);
	            const endDate = new Date(endDateString);
	            const oneDay = 24 * 60 * 60 * 1000; // 하루는 24시간, 1시간은 60분, 1분은 60초, 1초는 1000밀리초
	            const diffDays = Math.round(Math.abs((startDate - endDate) / oneDay));
	            return diffDays;
	        },
	        formatDate(dateTimeString) {
	            const date = new Date(dateTimeString);
	            const month = String(date.getMonth() + 1).padStart(2, '0');
	            const day = String(date.getDate()).padStart(2, '0');
	            return month + '-' + day;
	        },
	        isRecruitmentEnded(endDateString) {
	            const endDate = new Date(endDateString);
	            const today = new Date();
	            today.setHours(0, 0, 0, 0);  // 오늘 날짜의 시간, 분, 초, 밀리초를 0으로 설정
	            return endDate < today;
	        },
	        gotoPage(page) {
	            this.pagination.currentPage = page;
	            this.fetchCompanyPage();
	        },
	        generatePageNumbers() {
	            const totalPages = this.pagination.pageCnt;
	            const currentPage = this.pagination.currPageNo;  // 여기를 수정

	            if (!currentPage || !totalPages) {
	                console.warn("Current or total pages are not defined:", currentPage, totalPages);
	                return [];
	            }

	            const startPage = Math.floor((currentPage - 1) / 5) * 5 + 1;
	            const endPage = Math.min(startPage + 4, totalPages);

	            const pageNumbers = [];
	            for (let i = startPage; i <= endPage; i++) {
	                pageNumbers.push(i);
	            }

	            return pageNumbers;
	        },
	        gotoPrevGroup() {
	            let prevPage;
	            if (this.pagination.currPageNo % 5 === 0) {
	                prevPage = this.pagination.currPageNo - 5;
	            } else {
	                prevPage = Math.floor(this.pagination.currPageNo / 5) * 5;
	            }
	            this.gotoPage(prevPage);
	        },
	        gotoNextGroup() {
	            const nextPage = Math.ceil(this.pagination.currPageNo / 5) * 5 + 1;
	            this.gotoPage(nextPage);
	        }
	    },
	    computed: {
	        // 현재 페이지 그룹이 첫 번째 그룹인지 확인
	        isFirstGroup() {
	            return this.pagination.currentPage <= 5;
	        },
	        // 현재 페이지 그룹이 마지막 그룹인지 확인
	        isLastGroup() {
	            const totalPages = this.pagination.totalPages;
	            const lastGroupStart = Math.floor((totalPages - 1) / 5) * 5 + 1;
	            return this.pagination.currentPage >= lastGroupStart;
	        }
	    }
	});
        const down = document.querySelector('.scrollDown');

        down.onclick = function () {
            window.scrollTo({
                top: 820,
                behavior: 'smooth'
            });
        }

        document.getElementById("scrollTop").onclick = function () {
            window.scrollTo({
                top: 0,
                left: 0,
                behavior: 'smooth'
            });
        };

        $(document).ready(function () {
            const Height = $("#scrollTop").height();
            $("#scrollTop").hide();

            $(window).scroll(function () {
                var rolling = $(this).scrollTop() >= Height;
                if (rolling) {
                    $("#scrollTop").fadeIn(500).css({ "position": "fixed" });
                }
                else {
                    $("#scrollTop").fadeOut(300);
                }

            });

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
        
        
        
        
        
        
        
        
        
  // ----- slider ------
     $(document).ready(function(){
         $('.slider').slick({
             dots: true, 
             arrow: true,
             infinite: true, 
             autoplay: true,
             autoplaySpeed : 1800,
             slidesToShow: 1,
             slidesToScroll: 1, 
         });
         
     });
        
        
    </script>
</body>

</html>