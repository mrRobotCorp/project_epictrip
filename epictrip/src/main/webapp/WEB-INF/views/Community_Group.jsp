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
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios@0.21.4/dist/axios.min.js"></script>
	
    <link rel="icon" href="./source/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="./source/apple-icon-180x180.png" sizes="180x180">
    <title>EpicTrip | 에픽트립</title>

    <link href="./css/headFoot.css" rel="stylesheet">
    <link href="./css/cGroup.css" rel="stylesheet">
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

    <section class="cSchSection"  id="contents">
        <div class="frmLine">
            <div>
				<form class="schFrm" @submit.prevent="search">
				    <input type="text" v-model ="cptitle" placeholder="여행지를 검색해보세요" @keyup.enter="search">
				    <button type="button" @click="search"></button>
				</form>
				<button 
					    type="button" 
				    class="sortBtn" 
				    :class="{ 'active': activeOrder === 'hits' }" 
				    @click="changeOrderType('hits')">조회순
				</button>
            </div>
			<a href="/Community_WriteGro" class="postBtn" onclick="checkLoginStatus(event, '${user.userid}')">작성하기</a>
            
        </div>

        <div class="schAll">
       	    <template v-if="companies.length">
	     		 <a :href="'/Community_GroDetail?cpkey=' + company.cpkey" class="goDetail" v-for="company in companies" :key="company.cpkey"> 
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
            </template>
            
		    <div class="noneResult" v-else>
		        <img src="./source/nosearch.png">
		        <p>검색 결과가 존재하지 않습니다</p>
		    </div>

        </div>
		<div class="pagination">
		    <!-- 이전 페이지 그룹 버튼 -->
			<button 
			    type="button" 
			    class="prevBtn arrow" 
			    @click="gotoPrevGroup" 
			    v-if="pagination.currPageNo > 5">
			</button>
		    <!-- 각 페이지 번호 버튼 -->
			<button 
			    type="button" 
			    class="pageNum" 
			    v-for="page in pageNumbers" 
			    :key="page" 
			    :class="{ 'active': page === pagination.currPageNo }" 
			    @click="gotoPage(page)"
			>
			    {{ page }}
			</button>
		    <!-- 다음 페이지 그룹 버튼 -->
			<button 
			    type="button" 
			    class="nextBtn arrow" 
			    @click="gotoNextGroup" 
			    v-if="Math.ceil(pagination.currPageNo / 5) * 5 < pagination.pageCnt">
			</button>
		</div>
		

    </section>

    <footer>
        <img src="./source/logo_white.png">
        <p><a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a></p>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>


    <script src="./js/header.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
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
		        	// 공백 검색 방지
		            if (this.cptitle === " ") {
		                return;
		            }
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
		
		function checkLoginStatus(event, userid) {
		    if (!userid) {
		    	alert("로그인 후 이용바랍니다.")
		        event.preventDefault(); 
		        window.location.href = "/login"; 
		    }
		}


	</script>
</body>

</html>