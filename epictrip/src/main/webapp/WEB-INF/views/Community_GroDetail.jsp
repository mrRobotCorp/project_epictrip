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
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios@0.21.4/dist/axios.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	

    <link rel="icon" href="./source/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="./source/apple-icon-180x180.png" sizes="180x180">
    <title>EpicTrip | 에픽트립</title>

    <link href="./css/headFoot.css" rel="stylesheet">
    <link href="./css/cGroDetail.css" rel="stylesheet">
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


    <section id="insSection" class="postingWrap">
        <div class="postingInner">
            <div class="postImgCon">
                <img src="./source/groupImg/${company.cpimage}" alt="">
            </div>
            <div class="postingBtn">
			<c:if test="${loginUser.userid == company.userid}">
			    <button id="upBtn" onclick="location.href='/Community_WriteGro?cpkey=${company.cpkey}'">수정</button>
			    <button @click="deleteCompany(company.cpkey)">삭제</button>
			</c:if>
            </div>
            <div class="postContent">
                <div class="pLeft">
                    <h1>${company.cptitle}</h1>
                    <div class="postInfo">
                        <div class="lmd">
                            <p>지역</p>
                            <span>${company.cploc}</span>
                            <p>모집인원</p>
                            <span>${company.cpnum}명</span>
                        </div>
                        <div class="dDetail">
                            <img src="./source/date.png" alt="">
                            <span> <fmt:formatDate value="${company.startdate}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${company.enddate}" pattern="yyyy-MM-dd" /></span>
                        </div>
                    </div>
                    <p class="postText" >
                        ${company.cpcontent}
                    </p>
                    <div class="postDV">
                        <span>작성일 · <fmt:formatDate value="${company.creatdate}" pattern="yyyy-MM-dd HH:mm" /></span><p>조회수 · </p> <span>${company.hits}</span>
                    </div>
                </div>
                <div class="pRight">
                    <div class="wUser">
                        <div class="wUserInner">
                            <div class="wUserInfo" onclick="memMpopen('${company.userid}')">
                                <img src="./source/${company.image}.jpg" alt="">
                                <div class="ngc">
                                    <p>${company.name}</p>
                                    <div class="ag">                                
                                        <p>{{ getAge(company.birth) }} · <span>${company.gender}</span></p>
                                    </div>
                                </div>	
                            </div>
							<c:choose>
							    <c:when test="${loginUser.userid == company.userid}">
							        <button @click="goToChatPage">채팅방 이동</button>
							    </c:when>
							    <c:otherwise>
							        <button @click="goToChatPage">동행 신청하기</button>
							    </c:otherwise>
							</c:choose>
                        </div>
                    </div>
                    <div class="joinMem">
                        <div class="jMemInner">

                        </div>
                    </div>
                </div>
            </div>
                <div class="memMpModal">
	                <div class="memMp">
	                    <div class="memMpclose">
	                        <div></div>
	                        <button onclick="memMpclose()"></button>
	                    </div>
	                    <div class="memMpInner">
	                        <div class="memIninfo">
	                            <div class="memimgLv">
	                                <img src="./source/${company.image}.jpg" class="profile">
	                                <img src="./source/Lv_0.png" class="level">
	                            </div>
		                        <div class="lvandN">
		                            <p>초보 여행자1</p>
		                            <div class="memMoidname">
		                                <div class="memMoname"><span>${company.name}</span></div>
		                                <div class="memMoid"><span>@${company.userid}</span></div>
		                            </div>
		                        </div>
	                            <div class="recoBtn">
	                                <button class="goodMem" onclick="recogood()"></button>
	                                <div class="reconBtnline"></div>
	                                <button class="badMem" onclick="recobad()"></button>
	                            </div>
	                        </div>
	                        <div class="myintroduce">
	                            <p>소개글</p>
	                            <div class="myintroin">
	                                <span>${company.userIntroduce}</span>
	                            </div>
	                        </div>
	                        <div class="subgb">
	                            <div class="ageGen">
	                                <div class="mybirth">
	                                    <p>나이</p>
	                                    <span><fmt:formatDate value="${company.birth}" pattern="yyyy-MM-dd" /></span>
	                                </div>
	                                <div class="mygen">
	                                    <p>성별</p>
	                                    <span>${company.gender}</span>
	                                </div>
	                            </div>
	
	                        </div>
	                    </div>
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
	<script  type="text/javascript">
	var userIdFromServer = '${user.userid}';
	    new Vue({
	        el: '#insSection',
	        data: {
	            company: {
	                birth: '${company.birth}' ,
	                cpkey: '${company.cpkey}',
	                cptitle: '${company.cptitle}',
	                image: '${company.cpimage}',
	                userid: '${company.userid}'
	            },
	            loginUser: {
	            	userid: '${loginUser.userid}'
	            },
	            userId: userIdFromServer
	        },
	        methods: {
	        	getAge(birthDateString) {
	        	    // 날짜 문자열 파싱
	        	    const parts = birthDateString.split(" ");
	        	    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	        	    const month = months.indexOf(parts[1]) + 1;
	        	    const day = parts[2];
	        	    const year = parts[5];

	        	    const birthDate = new Date(year, month - 1, day);  // 월은 0부터 시작하므로 month - 1을 사용
	        	    const today = new Date();

	        	    let age = today.getFullYear() - birthDate.getFullYear();
	        	    const monthDifference = today.getMonth() - birthDate.getMonth();
	        	    
	        	    if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
	        	        age--;
	        	    }
	        	    return Math.floor(age / 10) * 10 + "대";
	        	},
	        	deleteCompany(cpkey) {
	        	    if (confirm("게시글을 삭제하시겠습니까?")) { 
	        	        axios.post('/deleteCompany?cpkey=' + cpkey)
	        	            .then(response => {
	        	                if(response.status === 200) {
	        	                    alert('게시글이 성공적으로 삭제되었습니다.');
	        	                    window.location.href = './Community_Group';
	        	                } else {
	        	                    alert('게시글 삭제에 실패하였습니다. 다시 시도해주세요.');
	        	                }
	        	            })
	        	            .catch(error => {
	        	                console.error('Error deleting company:', error);
	        	                alert('게시글 삭제 중 오류가 발생했습니다. 다시 시도해주세요.');
	        	            });
	        	    } else {
	        	        console.log("게시글 삭제가 취소되었습니다.");
	        	    }
	        	},
	            increaseMes(cpkey) {
	                axios.get('/increaseMes', {
	                    params: {
	                        cpkey: cpkey
	                    }
	                }).then(response => {
	                    console.log("Number increased successfully.");
	                }).catch(error => {
	                    console.error("Error increasing the number:", error);
	                });
	            },
	        	goToChatPage() {
	                if (!this.userId) {
	                	alert("로그인 후 이용바랍니다.")
	                    window.location.href = '/login'; 
	                } else {
		        	    const chatRoom = {
		        	        title: this.company.cptitle,
		        	        key: this.company.cpkey,
		        	        image: this.company.image,
		        	        participants: [this.company.userid, this.loginUser.userid]
		        	    };
	                    this.increaseMes(chatRoom.key); // 메시지 횟수 증가
	
		        	    let chatRooms = localStorage.getItem('chatRooms');
		        	    if (chatRooms) {
		        	        chatRooms = JSON.parse(chatRooms);
		        	    } else {
		        	        chatRooms = [];
		        	    }
	
		        	    // 이미 해당 key를 가진 채팅방이 있는지 확인
		        	    const existingRoom = chatRooms.find(room => room.key === chatRoom.key);
		        	    
		        	    // 존재하는 경우
		        	    if (existingRoom) {
		        	        // 중복되지 않는 userid만 추가
		        	        [this.company.userid, this.loginUser.userid].forEach(userid => {
		        	            if (!existingRoom.participants.includes(userid)) {
		        	                existingRoom.participants.push(userid);
		        	            }
		        	        });
	
		        	        // 최대 참가자 수 제한 (예: 20명)
		        	        if (existingRoom.participants.length > 20) {
		        	            alert('채팅방에는 최대 20명만 참여할 수 있습니다.');
		        	            return;
		        	        }
		        	    } else {
		        	        chatRooms.push(chatRoom);
		        	        localStorage.setItem('chatRooms', JSON.stringify(chatRooms));
		        	    }
	
		        	    window.location.href = '/message?cpkey=' + this.company.cpkey + '&userid='+ this.company.userid +'&from=chatButton';
		        	}
	        	}




	        }
	    });
	 // =============== 모달 js ==================
		 
        // ms모달 열기,닫기
        var idValues = "";
        var memMpModal = document.querySelector(".memMpModal");
        
        function memMpclose() {
            memMpModal.classList.remove("active");
        }
        function memMpopen(id) {
   		 if($("user.userid") == id){
   			 $(".recoBtn").hide()
   		 }
        	
        	idValues = id;
        	console.log(id)
            memMpModal.classList.add("active");
            
            var senderId = '${user.userid}'
        	console.log(senderId)
          
        	
            levelCheck(senderId)//불러오기
            
            // AJAX 호출로 Level 정보 가져오기
            $.ajax({
                url: 'mesLevel',
                type: 'GET',
                data: { userid: senderId },
                dataType: 'json',
                success: function(levelInfo) {
                    // Level 정보 화면에 설정
                    document.querySelector(".memMp .level").src = "./source/" + levelInfo.grade_img;
                    document.querySelector(".memMp .lvandN p").textContent = levelInfo.grade_name;
                }
            });
            
        	  
          	var momdalId = $('#momdalId').val();
            var goodButton = $(".goodMem");
            var badButton = $(".badMem");

        	goodButton.click(function () { //추천 눌럿을 때
                var goodInt = parseInt(goodButton.val());
                var badInt = parseInt(badButton.val());
                console.log("누른거"+id)
                var senderId = '${user.userid}'

        		//인서트
                if (goodInt === 0 && badInt === 0) { // 아무것도 없을 때
                    goodButton.addClass('choice');
                    goodButton.val(1);
                    badButton.val(0);
                    levelCheckInsert(id,senderId,'levelCheckInsert',1)
                    
                // 딜리트    
                } else if (goodInt === 1 && badInt === 0) { // 추천에 추천 눌럿을때
                    goodButton.removeClass('choice');
                    goodButton.val(0);
                    badButton.val(0);
                    levelCheckInsert(id,senderId,'levelCheckDel',1)
                    
                // 업데이트    
                } else if (goodInt === 0 && badInt === 1) {// 추천에 비추천 눌럿을때
                    goodButton.addClass('choice');
                    badButton.removeClass('choiceB');
                    goodButton.val(1);
                    badButton.val(0);
                    levelCheckInsert(id,senderId,'levelCheckUpt',1)
                    
                }
            });

            badButton.click(function() { //비추천 눌럿을 때
                var goodInt = parseInt(goodButton.val());
                var badInt = parseInt(badButton.val());
                var senderId = '${user.userid}'
                
        		//인서트
                if (goodInt === 0 && badInt === 0) {// 비추천 눌럿을때
                    badButton.addClass('choiceB');
                    goodButton.val(0);
                    badButton.val(1);
                    levelCheckInsert(id,senderId,'levelCheckInsert',2)
                    
                // 업데이트 
                } else if (goodInt === 1 && badInt === 0) { // 추천에 비추천 눌럿을때
                    badButton.addClass('choiceB');
                    goodButton.removeClass('choice');
                    goodButton.val(0);
                    badButton.val(1);
                    levelCheckInsert(id,senderId,'levelCheckUpt',2)
                    
                // 딜리트
                } else if (goodInt === 0 && badInt === 1) { // 비추천에 비추천 눌럿을때
                    badButton.removeClass('choiceB');
                    goodButton.val(0);
                    badButton.val(0);
                    levelCheckInsert(id,senderId,'levelCheckDel',1)
                    
                }
            });

        }
        
        // .goodMem 버튼 클릭 시 토글 동작
        function recogood() {
            var goodButton = document.querySelector('.goodMem');
            goodButton.classList.toggle('choice');
        }

        // .badMem 버튼 클릭 시 토글 동작
        function recobad() {
            var badButton = document.querySelector('.badMem');
            badButton.classList.toggle('choiceB');
        }
        document.addEventListener('DOMContentLoaded', function() {
            let postTextElement = document.querySelector('.postText');
            let content = postTextElement.innerHTML; // 현재 <p> 태그의 내용을 가져옵니다.
            content = content.replace(/\n/g, '<br>');
            postTextElement.innerHTML = content;
        });

        let memInfoWrapDiv = document.querySelector('.jMemInner');
        let usersToDisplay = [];
        // 동행 확정
        function getParameterByName(name, url = window.location.href) {
            name = name.replace(/[\[\]]/g, '\\$&');
            let regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }
let age = '';
        // 로컬스토리지에서 cpkey에 해당하는 유저 데이터를 가져와 화면에 출력하는 함수
        function displayStoredUsers() {
            let cpkey = getParameterByName('cpkey');
            let memInfoWrapDiv = document.querySelector('.jMemInner');
            let usersToDisplay = [];

            for (let i = 0; i < localStorage.length; i++) {
                let key = localStorage.key(i);

                if (key.startsWith('groupon-')) {
                    let userData = JSON.parse(localStorage.getItem(key));
                    if (userData.cpkey === cpkey) {
                        usersToDisplay.push(userData);
                    }
                }
            }
            memInfoWrapDiv.innerHTML += 
                '<div class="jMemCnt">' +
	                '<p>함께하는 동행</p>' +
	                '<span>' + usersToDisplay.length + '명</span>' +
	            '</div>';
	           
            usersToDisplay.forEach(storedUser => {
                let age = new Date().getFullYear() - new Date(storedUser.birth).getFullYear();
                let name = storedUser.name
                let image = storedUser.image
                let gender = storedUser.gender
                let userDiv = 
                    '<div class="memInfoWrap">' +
                        '<div class="memInfo">' +
                            '<img src="./source/' + image + '.jpg" alt="">' +
                            '<div class="memNg">' +
                                '<span>' + name + ' |</span>' +
                                '<span>' + (Math.floor(age / 10) * 10) + '대 |</span>' +
                                '<span>' + gender + '</span>' +
                            '</div>' +
                        '</div>' +
                    '</div>';
                memInfoWrapDiv.innerHTML += userDiv;
            });

        }

        // 페이지 로드 시 실행
        displayStoredUsers();

        
        document.addEventListener("DOMContentLoaded", function() {
            // 요소 선택
            var birthSpan = document.querySelector(".memMp .mybirth span");
            // 원하는 값을 계산
            var birthYear = new Date(birthSpan.textContent).getFullYear();
            var currentYear = new Date().getFullYear();
            var age = currentYear - birthYear;
            var ageRange = (age - (age % 10)) + "대";
            // 요소의 내용 수정
            birthSpan.textContent = ageRange;
	        var userId = "${company.userid}";
	
	        // AJAX 호출로 Level 정보 가져오기
	        $.ajax({
	            url: 'mesLevel',
	            type: 'GET',
	            data: { userid: userId },
	            dataType: 'json',
	            success: function(levelInfo) {
	                // Level 정보 화면에 설정
	                document.querySelector(".memMp .level").src = "./source/" + levelInfo.grade_img;
	                document.querySelector(".memMp .lvandN p").textContent = levelInfo.grade_name;
	            }
	        });
        });
        
        //모달 버튼
        function levelCheck(senderId){
      	  
          var senderId1 = '${user.userid}'
          
          console.log(idValues)
          console.log(senderId)
          
        	$.ajax({
        		      type: "post",
        		      url: "levelCheck",
        		      data: {
        		          userid: idValues,
        		          recommendid : senderId //세션 아이디
        		      },
        		      dataType: "text",
        		      success: function(data) {
        		          console.log("요청 성공:", data);
          				  if(data == 1){ // 추천
        					    $(".goodMem").addClass('choice');
        					    $(".goodMem").val(1);
        					    $(".badMem").val(0);
        				  }
        		          if(data == 2){ // 비추
        					   $(".badMem").addClass('choiceB');
        				   		$(".goodMem").val(0);
        					    $(".badMem").val(1);
        				  }
        				  if(data == 0){ // 없음
        				   		$(".goodMem").val(0);
        					    $(".badMem").val(0);				  
        				  }
        		          
        		      },
        		      error: function(error) {
        		          console.log("요청 실패:", error);
        		      }
        		  });
        }


        //부르고 나서 버튼
        function levelCheckInsert(id,momdalId,url,checklev){
        	var id1 = id
        	var momdalId1 = momdalId
        	var url1 = url
        	var checklev1 = checklev
        	
        	console.log(id1)
        	console.log(momdalId1)
        	console.log(url1)
        	console.log(checklev1)
        	$.ajax({
        		      type: "post",
        		      url: url,
        		      data: {
        		          userid: id,
        		          recommendid : momdalId, //세션 아이디
        		          checklev : checklev
        		      },
        		      dataType: "text",
        		      success: function(data) {
        		          console.log("요청 성공:", data);
        		          
        		      
        			  },
        		      error: function(error) {
        		          console.log("요청 실패:", error);
        		      }
        		  });
        }
      	

	</script>

</body>

</html>