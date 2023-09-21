!Templates.jsp20xhtmlxml.content!
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
    <link href="./css/sPosting.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
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

    <section class="cWriteSection">
        <div class="schFrm">
            <div class="selecAll">
                <div class="opLine">
                    <input type="hidden" value="한국" id="country">
                    <span>한국</span>
                    <div class="options">
                        <input id="loc01" type="radio" name="loc" value="서울">
                        <label for="loc01">서울</label>
                        <input id="loc02" type="radio" name="loc" value="강원도">
                        <label for="loc02">강원도</label>
                        <input id="loc03" type="radio" name="loc" value="제주">
                        <label for="loc03">제주</label>
                        <input id="loc04" type="radio" name="loc" value="부산">
                        <label for="loc04">부산</label>
                        <input id="loc05" type="radio" name="loc" value="경기도">
                        <label for="loc05">경기도</label>
                        <input id="loc06" type="radio" name="loc" value="인천">
                        <label for="loc06">인천</label>
                        <input id="loc07" type="radio" name="loc" value="충청도">
                        <label for="loc07">충청도</label>
                        <input id="loc08" type="radio" name="loc" value="경상도">
                        <label for="loc08">경상도</label>
                        <input id="loc09" type="radio" name="loc" value="전라도">
                        <label for="loc09">전라도</label>
                        <input id="loc10" type="radio" name="loc" value="울릉도">
                        <label for="loc10">울릉도</label>
                    </div>
                </div>
                <div class="opLine">
                    <input type="hidden" value="일본" id="country">
                    <span>일본</span>
                    <div class="options">
                        <input id="loc11" type="radio" name="loc" value="도쿄">
                        <label for="loc11">도쿄</label>
                        <input id="loc12" type="radio" name="loc" value="오사카">
                        <label for="loc12">오사카</label>
                        <input id="loc13" type="radio" name="loc" value="후쿠오카">
                        <label for="loc13">후쿠오카</label>
                        <input id="loc14" type="radio" name="loc" value="오키나와">
                        <label for="loc14">오키나와</label>
                        <input id="loc15" type="radio" name="loc" value="나고야">
                        <label for="loc15">나고야</label>
                        <input id="loc16" type="radio" name="loc" value="교토">
                        <label for="loc16">교토</label>
                        <input id="loc17" type="radio" name="loc" value="훗카이도">
                        <label for="loc17">훗카이도</label>
                        <input id="loc18" type="radio" name="loc" value="히로시마">
                        <label for="loc18">히로시마</label>
                        <input id="loc19" type="radio" name="loc" value="나가노">
                        <label for="loc19">나가노</label>
                    </div>
                </div>
                <div class="opLine">
                    <input type="hidden" value="홍콩" id="country">
                    <span>홍콩</span>
                    <div class="options">
                        <input id="loc20" type="radio" name="loc" value="홍콩">
                        <label for="loc20">홍콩</label>
                    </div>
                </div>
                <div class="opLine">
                    <input type="hidden" value="마카오" id="country">
                    <span>마카오</span>
                    <div class="options">
                        <input id="loc21" type="radio" name="loc" value="마카오">
                        <label for="loc21">마카오</label>
                    </div>
                </div>
                <div class="opLine">
                    <input type="hidden" value="대만" id="country">
                    <span>대만</span>
                    <div class="options">
                        <input id="loc22" type="radio" name="loc" value="타이페이">
                        <label for="loc22">타이페이</label>
                        <input id="loc23" type="radio" name="loc" value="타이중">
                        <label for="loc23">타이중</label>
                        <input id="loc24" type="radio" name="loc" value="가오슝">
                        <label for="loc24">가오슝</label>
                    </div>
                </div>
                <div class="opLine">
                    <input type="hidden" value="중국" id="country">
                    <span>중국</span>
                    <div class="options">
                        <input id="loc25" type="radio" name="loc" value="상하이">
                        <label for="loc25">상하이</label>
                        <input id="loc26" type="radio" name="loc" value="베이징">
                        <label for="loc26">베이징</label>
                        <input id="loc27" type="radio" name="loc" value="칭다오">
                        <label for="loc27">칭다오</label>
                        <input id="loc28" type="radio" name="loc" value="청두">
                        <label for="loc28">청두</label>
                        <input id="loc29" type="radio" name="loc" value="광저우">
                        <label for="loc29">광저우</label>
                        <input id="loc30" type="radio" name="loc" value="하이난">
                        <label for="loc30">하이난</label>
                        <input id="loc31" type="radio" name="loc" value="장가계">
                        <label for="loc31">장가계</label>
                        <input id="loc32" type="radio" name="loc" value="충칭">
                        <label for="loc32">충칭</label>
                        <input id="loc33" type="radio" name="loc" value="서안">
                        <label for="loc33">서안</label>
                    </div>
                </div>
                <div class="opLine">
                    <input type="hidden" value="몽골" id="country">
                    <span>몽골</span>
                    <div class="options">
                        <input id="loc34" type="radio" name="loc" value="울란바토르">
                        <label for="loc34">울란바토르</label>
                    </div>
                </div>

                <div class="dateSelec">
                    <span id="dateClick">날짜 선택 버튼</span>
                    <div class="dateInput">
                        <div class="dpDiv">
                            <input type="text" name="startDay" class="datePick" placeholder="첫째날 선택" id="startdate">
                        </div>
                        <div class="dpDiv">
                            <input type="text" name="endDay" class="datePick" placeholder="마지막날 선택" id="enddate">
                        </div>
                    </div>
                </div>

                <div class="saleSelec">
                    <span id="dcdayBtn">요일별 할인 선택 버튼</span>

                    <div class="daySelecAll">
                        <input type="checkbox" name="saleDay" id="day1" value="월">
                        <label for="day1">월</label>
                        <input type="checkbox" name="saleDay" id="day2" value="화">
                        <label for="day2">화</label>
                        <input type="checkbox" name="saleDay" id="day3" value="수">
                        <label for="day3">수</label>
                        <input type="checkbox" name="saleDay" id="day4" value="목">
                        <label for="day4">목</label>
                        <input type="checkbox" name="saleDay" id="day5" value="금">
                        <label for="day5">금</label>
                        <input type="checkbox" name="saleDay" id="day6" value="토">
                        <label for="day6">토</label>
                        <input type="checkbox" name="saleDay" id="day7" value="일">
                        <label for="day7">일</label>
                    </div>

                    <select name="salePercent" class="saleDrop">
                        <option disabled selected>할인율 선택</option>
                        <option value="5">5%</option>
                        <option value="10">10%</option>
                        <option value="15">15%</option>
                        <option value="20">20%</option>
                    </select>
                </div>
            </div>

            <form action="Store_Prod_Insert" method="post" enctype="multipart/form-data" id="Lasubmit">
                <input type="hidden" value="" id="prodloc" name="prodloc">
                <input type="hidden" value="" id="startdateS" name="startdateS">
                <input type="hidden" value="" id="enddateS" name="enddateS">
                <input type="hidden" value="" id="dcday" name="dcday">
                <input type="hidden" value="" id="dcprice" name="dcprice">
                <input type="hidden" value="" name="country">
                <!-- 상품 판매 작성자 정보 수정바람 -->
                <input type="hidden" value="heoyoun38" id="writer" name="writer">
                <div class="detailWrite">

                    <div class="titleBox">
                        <span>제목을 입력</span>
                        <input type="text" name="prodtitle" placeholder="제목을 입력해주세요">
                    </div>
                    <div class="imgUpAll">
                        <span>배경 이미지 선택</span>
                        <input type="file" name="imgFile" id="fileInput">
                        <label for="fileInput" class="uploadedBtn">재업로드</label>
                        <div class="imgArea infoImg">
                            <label for="fileInput" class="fileLabel">업로드</label>
                        </div>
                    </div>

                    <div class="contxtAll">
                        <span>상세글 입력<span id="charCount">0/1000</span></span>
                        <div class="contextBox">
                            <textarea name="prodcontent" placeholder="여행 상품에 대해 상세히 기재해주세요" ></textarea>
                        </div>
                    </div>

                    <div class="imgUpAll">
                        <span>설명 이미지 선택</span>
                        <input type="file" name="bgFile" id="bgInput">
                        <label for="bgInput" class="uploadedBtn">재업로드</label>
                        <div class="imgArea bgImg">
                            <label for="bgInput" class="fileLabel">업로드</label>
                        </div>
                    </div>

                    <div class="infoBottom">
                        <div>
                            <span>작성자 아이디</span>
                            <p class="writer1"></p>
                        </div>

                        <div>
                            <span>가격</span>
                            <input type="number" name="price" placeholder="가격을 입력해주세요" id="ysmprice">
                        </div>
                    </div>

                </div>
                <button type="button" class="submitBtn">작성완료</button>
            </form>
        </div>
    </section>


    <footer>
        <img src="./source/logo_white.png">
        <p><a href="mailto:depo89055@gmail.com">프로젝트 문의 dddd@gmail.com</a></p>
        <p>유선 상담 010-1234-1234</p>
        <p>Copyright© EpicTrip, Inc. 2023. All Rights Reserved.</p>
    </footer>


    <script src="./js/header.js"></script>
</body>
<script type="text/javascript">

    $(document).ready(function () {
    	
    	const ysmprice = $("#ysmprice");
    	ysmprice.on("input", function() {
    		const inputValue = parseInt(ysmprice.val());
    	    if(inputValue < 0){ // -1일시 불가
    	    	console.log("123")
    	    	ysmprice.val(''); 
    	    }

    	    if(inputValue == 00){ //00일시 초기화
    	    	console.log("123")
    	    	ysmprice.val('');
    	    }
    	    if(inputValue.length > 8){
    	    	console.log("123")
    	    	alert("최대 " + maxLength + "자리까지 입력할 수 있습니다.");
    	    	ysmprice.val('');
    	    }
    	    if(isNaN(inputValue)){ // - 입력 불가 or value가 Nan이거나 공백일때 
    	    	console.log("123")
    	    	ysmprice.val('');
    	    }
    	    
    	  });
    	
    	var dateClick01 = false;
    	var dcdayBtn02 = false;
    	
    	
        var proStartDate = ""; // 시작날짜
        var proEndDate = ""; // 마지막날짜
        var checkedValues = []; //할인 요일
        var selectedCountry = "";
        var sale = 0;
        var title = "";
        var context = "";
        var price = 0;
		// 작성자 정보 입려력
		$(".writer1").text('${user.userid}');

		
		// 상세글 입력시 \n 추가 name="prodcontent"
/* 		$("[name=prodcontent]").keydown(function(event) {
		    if (event.keyCode == 13) {
		        
		        let currentValue = $(this).val();
		        $(this).val(currentValue + "<br>");
		        console.log($(this).val());
		    }
		}); */

		
        // 지역 선택 로직
        $("[name=loc]").click(function () {
            console.log($(this).val());
            $("#prodloc").val($(this).val())

            // 나라 선택 로직
            selectedCountry = $(this).closest(".opLine").find("#country").val();
            $("[name=country]").val(selectedCountry)
            console.log(selectedCountry)
        });

        // 날짜선택 로직
        $("#dateClick").click(function () {
            var startDate = $("#startdate").val() // 시작날짜
            var endDate = $("#enddate").val() // 마지막 날짜
            var startDate01 = new Date($("#startdate").val()) // date형식으로 재설정
            var endDate01 = new Date($("#enddate").val()) // 위와 같음
			var newdate = new Date()
            var timeDiff = endDate01 - startDate01; // 마지막날짜 - 시작날짜

            // 시작날짜가 마지막날짜보다 크다면 이상하기 때문에
            if (startDate01 > endDate01) {
                alert("시작.끝 날짜가 올바르지 않습니다.");
            }else if (startDate01 < newdate) {
                alert("시작 날짜가 오늘 이전입니다.");
            }else {
                console.log(startDate);
                console.log(endDate);
                $("#startdateS").val(startDate)
                $("#enddateS").val(endDate)
             	// ---- 추가!!! ------ 선택 비활성화
	            if(startDate == "" || endDate == "") {
	                alert("날짜를 선택해주세요.");
	            } else {
	                $("#startdate").attr("disabled",true); 
	                $("#enddate").attr("disabled",true); 
	                $("#dateClick").addClass("clicked");
	                dateClick01 = true;
	            }
            }



        })

        $(".daySelecAll").click(function () {
            checkedValues = []; // 클릭할 때마다 배열 초기화

            $(this).find("[name=saleDay]:checked").each(function () {
                checkedValues.push($(this).val());
            });

            console.log(checkedValues);
        });

        $("#dcdayBtn").click(function () {
            var dcday = "";
            checkedValues.forEach(function (e) {
                dcday = dcday + e + " ";
            })
            $("#dcday").val(dcday)

            // ---- 추가!!! ------ 선택 비활성화
            if(dcday == "") {
                alert("할인 요일을 선택해주세요.");
            } else if($(".saleDrop").val() == null) {
                alert("할인율을 선택해주세요.");
            } else {
                $(".saleDrop").attr("disabled",true); 
                $("input[name='saleDay']").attr("disabled",true); 
                $("#dcdayBtn").addClass("clicked");
                dcdayBtn02 = true;
            }

            // 인클루드스는 내용중에 문자가 있는지 확인해줌
            if (dcday.includes("화")) {
                console.log(dcday);
                console.log("화요일이 선택되었습니다.");
            }
        })


        //할인 퍼센트
        $(".saleDrop").change(function () {
            sale = $(this).val();
            $("#dcprice").val(sale)
            console.log("선택한 할인율: " + sale + "%");
        });

        
        	// 제목, 텍스트 내용, 가격 출력
	        $(".submitBtn").click(function () {
		        if(dateClick01 == true && dcdayBtn02 == true){
			            price = $("[name=price]").val();
						
			            console.log(price)
			            $("#Lasubmit").submit()
			        	alert("페이지가 이동됩니다.")
		        }else{
		        	alert("날짜 선택 혹은 요일별 할인선택 버튼을 눌러주세요!")
		        }
	        })


        // saleDrop
        // 날짜 선택
        $(".datePick").datepicker({
            dateFormat: 'yy-mm-dd',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
            
        });

        // 업로드 이미지 노출
        const fileInput = document.querySelector('#fileInput');
        const fileDisplayArea = document.querySelectorAll('.imgArea');
        const uploadedBtn = document.querySelectorAll('.uploadedBtn');

        fileInput.addEventListener('change', function (e) {
            var file = fileInput.files[0];
            var imageType = /image.*/;

            if (file.type.match(imageType)) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    fileDisplayArea[0].innerHTML = "";

                    var img = new Image();
                    img.src = reader.result;

                    fileDisplayArea[0].appendChild(img);
                }

                reader.readAsDataURL(file);
            } else {
                fileDisplayArea[0].innerHTML = "<p class='wrongTxt'>&#128473; 잘못된 이미지 형식입니다 &#128473;</p>"
            }
            uploadedBtn[0].classList.add("uploaded");
        });


        // ------- 배경 이미지
        const bgInput = document.querySelector('#bgInput');

        bgInput.addEventListener('change', function (e) {
            var file = bgInput.files[0];
            var imageType = /image.*/;

            if (file.type.match(imageType)) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    fileDisplayArea[1].innerHTML = "";

                    var img = new Image();
                    img.src = reader.result;

                    fileDisplayArea[1].appendChild(img);
                }

                reader.readAsDataURL(file);
            } else {
                fileDisplayArea[1].innerHTML = "<p class='wrongTxt'>&#128473; 잘못된 이미지 형식입니다 &#128473;</p>"
            }
            uploadedBtn[1].classList.add("uploaded");
        });
    });
	
    document.addEventListener('DOMContentLoaded', function () {
   	 	const textarea = document.querySelector("textarea[name='prodcontent']");
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

</html>