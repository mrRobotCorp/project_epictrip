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
    <link href="./css/cWriteGrp.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.3/gsap.min.js"></script>
  	<script>
	    var defaultCpImage = "${company.cpimage}";
	</script>
  
  
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
	<input type="hidden" id="sessionUserId" value="${loginUser.userid}"/>

    <section class="cWriteSection">
        <form action="" class="schFrm">
            <div class="selecAll">
				<div class="opLine">
				    <span>한국</span>
				    <div class="options">
				        <input id="loc01" type="radio" name="loc" value="서울" <c:if test="${company.cploc == '서울'}">checked</c:if>>
				        <label for="loc01">서울</label>
				        <input id="loc02" type="radio" name="loc" value="강원도" <c:if test="${company.cploc == '강원도'}">checked</c:if>>
				        <label for="loc02">강원도</label>
				        <input id="loc03" type="radio" name="loc" value="제주" <c:if test="${company.cploc == '제주'}">checked</c:if>>
				        <label for="loc03">제주</label>
				        <input id="loc04" type="radio" name="loc" value="부산" <c:if test="${company.cploc == '부산'}">checked</c:if>>
				        <label for="loc04">부산</label>
				        <input id="loc05" type="radio" name="loc" value="경기도" <c:if test="${company.cploc == '경기도'}">checked</c:if>>
				        <label for="loc05">경기도</label>
				        <input id="loc06" type="radio" name="loc" value="인천" <c:if test="${company.cploc == '인천'}">checked</c:if>>
				        <label for="loc06">인천</label>
				        <input id="loc07" type="radio" name="loc" value="충청도" <c:if test="${company.cploc == '충청도'}">checked</c:if>>
				        <label for="loc07">충청도</label>
				        <input id="loc08" type="radio" name="loc" value="경상도" <c:if test="${company.cploc == '경상도'}">checked</c:if>>
				        <label for="loc08">경상도</label>
				        <input id="loc09" type="radio" name="loc" value="전라도" <c:if test="${company.cploc == '전라도'}">checked</c:if>>
				        <label for="loc09">전라도</label>
				        <input id="loc10" type="radio" name="loc" value="울릉도" <c:if test="${company.cploc == '울릉도'}">checked</c:if>>
				        <label for="loc10">울릉도</label>
				    </div>
				</div>
                <div class="opLine">
                    <span>일본</span>
					<div class="options">
					    <input id="loc11" type="radio" name="loc" value="도쿄" <c:if test="${company.cploc == '도쿄'}">checked</c:if>>
					    <label for="loc11">도쿄</label>
					    <input id="loc12" type="radio" name="loc" value="오사카" <c:if test="${company.cploc == '오사카'}">checked</c:if>>
					    <label for="loc12">오사카</label>
					    <input id="loc13" type="radio" name="loc" value="후쿠오카" <c:if test="${company.cploc == '후쿠오카'}">checked</c:if>>
					    <label for="loc13">후쿠오카</label>
					    <input id="loc14" type="radio" name="loc" value="오키나와" <c:if test="${company.cploc == '오키나와'}">checked</c:if>>
					    <label for="loc14">오키나와</label>
					    <input id="loc15" type="radio" name="loc" value="나고야" <c:if test="${company.cploc == '나고야'}">checked</c:if>>
					    <label for="loc15">나고야</label>
					    <input id="loc16" type="radio" name="loc" value="교토" <c:if test="${company.cploc == '교토'}">checked</c:if>>
					    <label for="loc16">교토</label>
					    <input id="loc17" type="radio" name="loc" value="훗카이도" <c:if test="${company.cploc == '훗카이도'}">checked</c:if>>
					    <label for="loc17">훗카이도</label>
					    <input id="loc18" type="radio" name="loc" value="히로시마" <c:if test="${company.cploc == '히로시마'}">checked</c:if>>
					    <label for="loc18">히로시마</label>
					    <input id="loc19" type="radio" name="loc" value="나가노" <c:if test="${company.cploc == '나가노'}">checked</c:if>>
					    <label for="loc19">나가노</label>
					</div>
                </div>
                <div class="opLine">
                    <span>홍콩</span>
                    <div class="options">
                        <input id="loc20" type="radio" name="loc" value="홍콩" <c:if test="${company.cploc == '홍콩'}">checked</c:if>>
                        <label for="loc20">홍콩</label>
                    </div>
                </div>
                <div class="opLine">
                    <span>마카오</span>
                    <div class="options">
                        <input id="loc21" type="radio" name="loc" value="마카오" <c:if test="${company.cploc == '마카오'}">checked</c:if>>
                        <label for="loc21">마카오</label>
                    </div>
                </div>
                <div class="opLine">
                    <span>대만</span>
                    <div class="options">
                        <input id="loc22" type="radio" name="loc" value="타이페이" <c:if test="${company.cploc == '타이페이'}">checked</c:if>> 
                        <label for="loc22">타이페이</label>
                        <input id="loc23" type="radio" name="loc" value="타이중" <c:if test="${company.cploc == '타이중'}">checked</c:if>>
                        <label for="loc23">타이중</label>
                        <input id="loc24" type="radio" name="loc" value="가오슝" <c:if test="${company.cploc == '가오슝'}">checked</c:if>>
                        <label for="loc24">가오슝</label>
                    </div>
                </div>
                <div class="opLine">
                    <span>중국</span>
					<div class="options">
					    <input id="loc25" type="radio" name="loc" value="상하이" <c:if test="${company.cploc == '상하이'}">checked</c:if>>
					    <label for="loc25">상하이</label>
					    <input id="loc26" type="radio" name="loc" value="베이징" <c:if test="${company.cploc == '베이징'}">checked</c:if>>
					    <label for="loc26">베이징</label>
					    <input id="loc27" type="radio" name="loc" value="칭다오" <c:if test="${company.cploc == '칭다오'}">checked</c:if>>
					    <label for="loc27">칭다오</label>
					    <input id="loc28" type="radio" name="loc" value="청두" <c:if test="${company.cploc == '청두'}">checked</c:if>>
					    <label for="loc28">청두</label>
					    <input id="loc29" type="radio" name="loc" value="광저우" <c:if test="${company.cploc == '광저우'}">checked</c:if>>
					    <label for="loc29">광저우</label>
					    <input id="loc30" type="radio" name="loc" value="하이난" <c:if test="${company.cploc == '하이난'}">checked</c:if>>
					    <label for="loc30">하이난</label>
					    <input id="loc31" type="radio" name="loc" value="장가계" <c:if test="${company.cploc == '장가계'}">checked</c:if>>
					    <label for="loc31">장가계</label>
					    <input id="loc32" type="radio" name="loc" value="충칭" <c:if test="${company.cploc == '충칭'}">checked</c:if>>
					    <label for="loc32">충칭</label>
					    <input id="loc33" type="radio" name="loc" value="서안" <c:if test="${company.cploc == '서안'}">checked</c:if>>
					    <label for="loc33">서안</label>
					</div>
                </div>
                <div class="opLine">
                    <span>몽골</span>
                    <div class="options">
                        <input id="loc34" type="radio" name="loc" value="울란바토르" <c:if test="${company.cploc == '울란바토르'}">checked</c:if>>
                        <label for="loc34">울란바토르</label>
                    </div>
                </div>
				<div class="teamSelec">
				    <span class="teamTxt">모집 인원</span>
				    <div class="rangeAll">
				        <span class="rangeValue">
				            <c:choose>
				                <c:when test="${empty company.cpnum}">
				                    0
				                </c:when>
				                <c:otherwise>
				                    ${company.cpnum}
				                </c:otherwise>
				            </c:choose>
				        </span>명
				        <input type="range" name="teamNum" class="teamNum" value="<c:choose><c:when test='${empty company.cpnum}'>0</c:when><c:otherwise>${company.cpnum}</c:otherwise></c:choose>" min="0" max="20">
				    </div>
				</div>
                <div class="dateSelec">
                    <span>날짜 선택</span>
						<div class="dateInput">
						    <div class="dpDiv">
						        <input type="text" name="startDay" id="startDay" class="datePick" placeholder="첫째날 선택" value="<fmt:formatDate value='${company.startdate}' pattern='yyyy-MM-dd' />">
						    </div>
						    <div class="dpDiv">
						        <input type="text" name="endDay" id="endDay" class="datePick" placeholder="마지막날 선택" value="<fmt:formatDate value='${company.enddate}' pattern='yyyy-MM-dd' />">
						    </div>
						</div>
                </div> 
            </div>

            <div class="detailWrite">
			<input type="hidden" id="defaultCpImage" value="${company.cpimage}">

			<div class="imgUpAll">  
			    <span>배경 이미지를 선택해주세요</span>
			    <input ref="fileInput" type="file" name="imgFile" id="fileInput">
			
			    <c:choose>
			        <c:when test="${not empty company.cpkey}">
			            <label for="fileInput" class="uploadedBtn uploaded" style="display: inline-block;">재업로드</label> 
			            <div class="imgArea">
			                <img src="/source/groupImg/${company.cpimage}" alt="Uploaded Image"> 
			            </div>
			        </c:when>
			
			        <c:otherwise>
			            <label for="fileInput" class="uploadedBtn">재업로드</label> 
			            <div class="imgArea">
			                <label for="fileInput" class="fileLabel">업로드</label> 
			            </div>
			        </c:otherwise>
			    </c:choose>
			</div>
			
				<p class="txtTitle">제목을 입력해주세요</p>
	            <div class="titleBox">
	                <input type="text" name="title" placeholder="제목을 입력해주세요" value="${company.cptitle}">
	            </div>
	            
	            <p class="txtTitle">본문을 입력해주세요<span id="charCount">0/1000</span></p>
	            <div class="contextBox">
	                <textarea name="context" placeholder="1. 현재 동행이 있나요?&#13;&#10;ex) 혼자에요 / 동행 1명이 있어요&#13;&#10;&#13;&#10;2.어떤 동행을 찾고 있나요?&#13;&#10;ex) 맛집 탐방을 좋아하는 20대 여성 동행을 찾아요!&#13;&#10;&#13;&#10;3. 원하는 여행 코스가 있다면 알려주세요!&#13;&#10;(1000자 이내) ">${company.cpcontent}</textarea>
	            </div>
            </div> 
            <button id="insBtn" type="button" class="submitBtn">작성완료</button>
        </form>
    </section>


    <footer>
        <img src="./source/logo_white.png">
        <p><a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a></p>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>


    <script src="./js/header.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="./js/cWriteGrp.js"></script>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        const textarea = document.querySelector('textarea[name="context"]');
        const charCountSpan = document.getElementById('charCount');

        function updateCharCount() {
            const currentLength = textarea.value.length;
            console.log(currentLength);
            
            // 1000자를 초과하는 입력을 방지
            if (currentLength > 1000) {
                alert('입력 글자 수 제한을 초과했습니다.');
                textarea.value = textarea.value.substring(0, 1000); // 1000자를 초과한 부분을 잘라냅니다.
            }

            charCountSpan.textContent = currentLength + "/1000";
        }

        textarea.addEventListener('input', updateCharCount);
        textarea.addEventListener('keyup', updateCharCount);
        textarea.addEventListener('compositionend', updateCharCount); // 한글 조합이 끝난 후의 이벤트
    	updateCharCount();

    });
</script>
</body>

</html>