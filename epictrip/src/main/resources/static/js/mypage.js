function openProImg() {
    var changeImg = document.querySelector(".changeImg");
    changeImg.style.display = "flex";
}

function climbox() {
    var changeImg = document.querySelector(".changeImg");
    changeImg.style.display = "none";
}

function openchpwdmodal() {
    var modalWrap = document.querySelector(".modalWrap");
    modalWrap.style.display = "block";
}


function colsechpwd() {
	document.getElementById('pwd').value = '';
	document.getElementById('newPwd').value = '';
    document.getElementById('pwdCk').value = '';
    var modalWrap = document.querySelector(".modalWrap");
    modalWrap.style.display = "none";
}
function okchanpwd() {
    var currentPwdInput = document.getElementById("newPwd");
    var errNopwd = document.getElementById("errNopwd");

    if (currentPwdInput.value.trim() === "") {
        errNopwd.style.display = "block";
        return false; // 입력이 없으면 false 반환하고 종료
    }
    // 정규식 패턴
    const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;
    
    const newPwd = document.getElementById('newPwd').value;
    const pwdCk = document.getElementById('pwdCk').value;
    
    // 비밀번호 형식 검사
    if (!passwordPattern.test(newPwd)) {
        alert('비밀번호 형식이 올바르지 않습니다.');
        return;
    }

    // 비밀번호 일치 검사
    if (newPwd !== pwdCk) {
        alert('입력하신 비밀번호가 일치하지 않습니다.');
        return;
    }
    changePassword(); // 비밀번호 변경 함수 호출
    closechpwd();
    return true;
}


function openchpnummodal() {
    var phoneWrap = document.querySelector(".phoneWrap");
    phoneWrap.style.display = "block";
}


function changePhoneNumber() {
    var phoneInput = document.getElementById("idPnum");
    var codeInput = document.getElementById("idCode");
    var phoneErr = document.getElementById("phoneErr");
    var modalWrap = document.querySelector(".phoneWrap");

    if (phoneInput.value.trim() === "" || codeInput.value.trim() === "") {
        phoneErr.style.display = "block";
        return;
    }

    // 인증번호 확인 로직 수행
    // ...

    // 변경 완료 후 모달 닫기
    modalWrap.style.display = "none";
}

function closePhoneModal() {
    var phoneWrap = document.querySelector(".phoneWrap");
    phoneWrap.style.display = "none";
}

function msgCk() {
    var phoneInput = document.getElementById("idPnum");
    var nonepnum = document.getElementById("nonepnum");

    if (phoneInput.value.trim() === "") {
        nonepnum.textContent = "휴대전화 번호를 입력해주세요.";
        return;
    }

    // 인증 발송 로직 수행
    // ...

    // 인증 발송 텍스트 변경
    var sendButton = phoneInput.nextElementSibling;
    sendButton.textContent = "재발송";

    // 기존 경고 텍스트 초기화
    nonepnum.textContent = "";
}

function openquitmodal() {
    var quitWrap = document.querySelector(".quitWrap");
    quitWrap.style.display = "block";
}
function closequitModal() {
    var quitWrap = document.querySelector(".quitWrap");
    quitWrap.style.display = "none";
}


// ==============================
// URL에서 현재 페이지의 파일명을 추출하는 함수
/*
function getCurrentPageFileName() {
    const urlParts = window.location.href.split('/');
    return urlParts[urlParts.length - 1];
}

const currentPageFileName = getCurrentPageFileName();

if (currentPageFileName === 'Mypage_mysetting') {
    mysetting.classList.add('myselect');
}
if (currentPageFileName === 'Mypage_mybill') {
    mybill.classList.add('myselect');
}
if (currentPageFileName === 'Mypage_myreview') {
    myreview.classList.add('myselect');
}
if (currentPageFileName === 'Mypage_mygroup') {
    mygroup.classList.add('myselect');
}
if (currentPageFileName === 'Mypage_mycal') {
    mycal.classList.add('myselect');
}
if (currentPageFileName === 'Mypage_mywish') {
    mywish.classList.add('myselect');
}

const mmName = document.querySelector(".mproname");

if (currentPageFileName === 'Mypage_mymain') {
    mmName.classList.add('mainsel');
}
*/

// ------------- 주소 별 gnb 활성화 -----------
	var loc = window.location.href;
    const mybill = document.querySelector("#mybill");
    const mycal = document.querySelector("#mycal");
    const mygroup = document.querySelector("#mygroup");
    const mymain = document.querySelector(".mproname");
    const myreview = document.querySelector("#myreview");
    const mysetting = document.querySelector("#mysetting");
    const mywish = document.querySelector("#mywish");

    if (loc.includes("mybill")) {
        mybill.classList.add("myselect");
    }
    if (loc.includes("mycal")) {
        mycal.classList.add("myselect");
    }
    if (loc.includes("mygroup")) {
        mygroup.classList.add("myselect");
    }
    if (loc.includes("mymain")) {
        mymain.classList.add("mainsel");
    }
    if (loc.includes("myreview")) {
        myreview.classList.add("myselect");
    }
    if (loc.includes("mysetting")) {
        mysetting.classList.add("myselect");
    }
    if (loc.includes("mywish")) {
        mywish.classList.add("myselect");
    }











// 자기소개 수정
function chIntorduce() {
    var textarea = document.getElementById("introTextarea");
    var button = document.querySelector(".cmmtBtn");

    if (textarea.readOnly) {
        textarea.readOnly = false;
        button.textContent = "저장";
        button.style.backgroundColor = "rgba(145, 205, 255, 0.772)";
    } else {
        updateIntroduce();
        textarea.readOnly = true;
        button.textContent = "수정";
        button.style.backgroundColor = "#ffd027a3";
    }
}



// ----- slider ------
$(document).ready(function() {
	    if ($('.slider').length === 0) {
        return;
    }
    var maxDots = 5;

    $('.slider').slick({
        dots: true,
        arrow: true,
        infinite: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        dotsClass: 'slick-dots customDots',
        nextArrow: '<button type="button" class="slick-next">Next</button>',
        prevArrow: '<button type="button" class="slick-prev">Previous</button>',  // 뒤로 가기 버튼 요소 생성
        beforeChange: function(event, slick, currentSlide, nextSlide) {
            var dots = $('.customDots li');

            var targetDot = nextSlide % maxDots;
            dots.removeClass('slick-active');
            dots.eq(targetDot).addClass('slick-active');
        }
    });
    function updateDotsVisibility() {
        var slickInstance = $('.slider').slick('getSlick');
        var currentSlide = slickInstance.currentSlide;
        var totalSlides = slickInstance.$slides.length;

        var remainingGroups = Math.ceil(totalSlides / maxDots);
        var currentGroup = Math.ceil((currentSlide + 1) / maxDots);
        var dotsToShow = maxDots;

        if (currentGroup === remainingGroups) {
            var lastGroupSlides = totalSlides % maxDots;
            dotsToShow = (lastGroupSlides === 0) ? maxDots : lastGroupSlides;
        }

        $('.customDots li').hide();
        for (var i = 0; i < dotsToShow; i++) {
            $('.customDots li').eq(i).show();
        }
    }
    function updateArrows() {
        var slickInstance = $('.slider').slick('getSlick');
        var currentSlide = slickInstance.currentSlide;
        var totalSlides = slickInstance.$slides.length;
        
        if (currentSlide === 0) {
            $('.slick-prev').hide();
        } else {
            $('.slick-prev').show();
        }
        
        if (currentSlide === totalSlides - 1) {
            $('.slick-next').hide();
        } else {
            $('.slick-next').show();
        }
    }

    $('.slider').on('afterChange', function() {
        updateArrows();
        updateDotsVisibility();
    });

    updateArrows();
    updateDotsVisibility();
    
    // next 버튼 클릭 시 동작
    $('.slick-next').on('click', function() {
        var slickInstance = $('.slider').slick('getSlick');
        var nextSlide = slickInstance.currentSlide;
        var dots = $('.customDots li');

        var targetDot = nextSlide % maxDots;
        dots.removeClass('slick-active');
        dots.eq(targetDot).addClass('slick-active');
    });

    // prev 버튼 클릭 시 동작
    $('.slick-prev').on('click', function() {
        var slickInstance = $('.slider').slick('getSlick');
        var prevSlide = slickInstance.currentSlide;
        var dots = $('.customDots li');

        var targetDot = prevSlide % maxDots;
        dots.removeClass('slick-active');
        dots.eq(targetDot).addClass('slick-active');
    });

    // 초기 상태 설정
    $('.customDots li').hide();
    for (var i = 0; i < maxDots; i++) {
        $('.customDots li').eq(i).show();
    }
    $('.customDots li').first().addClass('slick-active');
});

// URL에서 특정 파라미터 값을 가져오는 함수
function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
}
// 계정설정
// 소개글 변경
function updateIntroduce() {
    var userid = getUrlParameter('userid'); // URL에서 userid 값을 가져옵니다.
    var userintroduce = $('#introTextarea').val(); // textarea의 값을 가져옵니다.
	// 소개글 변경
    $.ajax({
        url: '/updateIntroduce', 
        type: 'POST',
        data: {
            userid: userid,
            userintroduce: userintroduce
        },
        success: function(response) {
            alert('소개글이 수정되었습니다.');
            location.reload();
        },
        error: function(error) {
            alert('소개글 수정에 실패했습니다.');
        }
    });
}
// 비밀번호 변경
function changePassword() {
    var userid = getUrlParameter('userid');
    var currentPass = $('.passwordField:eq(0)').val();
    var newPass = $('.passwordField:eq(1)').val();
	// 비밀번호 변경
    $.ajax({
        url: '/changePassword',
        type: 'POST',
        data: {
            userid: userid,
            oldPassword: currentPass,
            newPassword: newPass
        },
        success: function(response) {
            alert('비밀번호가 변경되었습니다. \n 재로그인 해주세요.');
            $.get("/user/logout", function() {
                location.href = '/login';
            });
        },
        error: function(error) {
            alert('비밀번호 변경에 실패했습니다.');
        }
    });
}
// 회원탈퇴
function withdrawAccount() {
    var userid = getUrlParameter('userid');
	// 회원탈퇴
    $.ajax({
        url: '/withdraw',
        type: 'POST',
        data: {
            userid: userid
        },
        success: function(response) {
            alert('회원 탈퇴가 완료되었습니다.');
            $.get("/user/logout", function() {
                location.href = '/EpicTrip'; 
            });
        },
        error: function(error) {
            alert('회원 탈퇴에 실패했습니다.');
        }
    });
}

// 이미지 변경
function saveAndCloseImageBox() {
    // 선택된 라디오 버튼을 확인합니다.
    var selectedRadio = document.querySelector('input[name="changeImg"]:checked');
    
    if (selectedRadio) {
        var imageName = 'profImg' + selectedRadio.id.charAt(selectedRadio.id.length - 1); // 선택된 라디오 버튼의 ID를 기반으로 이미지 이름을 생성합니다.

        // 선택한 이미지 이름을 서버에 전송합니다.
        var userid = getUrlParameter('userid'); // 이전에 제공한 getUrlParameter 함수를 사용하여 userid 값을 가져옵니다.
        // 이미지 변경
        $.ajax({
            url: '/updateImage',
            type: 'POST',
            data: {
                userid: userid,
                image: imageName
            },
            success: function(response) {
                alert(response);
                location.reload();
            },
            error: function(error) {
                alert('이미지 변경에 실패했습니다.');
            }
        });

        // 이미지 변경 박스를 숨깁니다.
        var changeImg = document.querySelector(".changeImg");
        changeImg.style.display = "none";

    } else {
        alert("이미지를 선택해주세요.");
    }
}







