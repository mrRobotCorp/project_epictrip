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
        minDate: 0, // 오늘 날짜부터 선택 가능
        onSelect: function(dateText, inst) {
            const selectedDate = new Date(dateText);
            const currentDate = new Date();
            currentDate.setHours(0, 0, 0, 0); // 시간, 분, 초, 밀리초를 0으로 설정하여 날짜만 비교

            if (selectedDate < currentDate) {
                alert("이미 지난 날짜입니다.");
                $(this).datepicker("setDate", currentDate); // 선택한 값을 오늘 날짜로 설정
            }

            const startDayInput = document.getElementById('startDay');
            const endDayInput = document.getElementById('endDay');

            const startDate = new Date(startDayInput.value);
            const endDate = new Date(endDayInput.value);

            // 두 날짜 간의 밀리초 차이를 구함
            const dateDifferenceInMillis = endDate - startDate;
            // 밀리초 차이를 연(년) 단위로 변환
            const dateDifferenceInYears = dateDifferenceInMillis / (365.25 * 24 * 60 * 60 * 1000);

            if (dateDifferenceInYears > 50) {
                alert('정상적인 여행일자를 선택해주세요.');
                endDayInput.value = ''; // 선택한 끝 날짜를 초기화
                return; // 이후의 로직을 중단합니다.
            }

            if (startDate > endDate) {
                alert('잘못된 날짜 선택입니다');
                endDayInput.value = ''; // 선택한 끝 날짜를 초기화
            }
        }
    });
});


// --------------  모집인원 ------------------------
function ShowSliderValue(sVal) {
    var obValueView = document.querySelector(".rangeValue");
    obValueView.innerHTML = sVal
}

var RangeSlider = function () {
    var range = $('.teamNum');

    range.on('input', function () {
        ShowSliderValue(this.value);
    });
};

RangeSlider();



// ------------- 업로드 이미지 노출 ----------------
window.onload = function() {

    const fileInput = document.querySelector('#fileInput');
    const fileDisplayArea = document.querySelector('.imgArea');
    const uploadedBtn = document.querySelector('.uploadedBtn');

    fileInput.addEventListener('change', function(e) {
        var file = fileInput.files[0];
        var imageType = /image.*/;

        if (file.type.match(imageType)) {
            var reader = new FileReader();

            reader.onload = function(e) {
                fileDisplayArea.innerHTML = "";

                var img = new Image();
                img.src = reader.result;

                fileDisplayArea.appendChild(img);
                
                // 이미지가 업로드되면 "재업로드" 버튼 활성화
               uploadedBtn.style.display = 'inline-block';
            }

            reader.readAsDataURL(file);	
        } else {
            fileDisplayArea.innerHTML = "<p class='wrongTxt'>&#128473; 잘못된 이미지 형식입니다 &#128473;</p>"
           uploadedBtn.style.display = 'inline-block';
        }

        uploadedBtn.classList.add("uploaded");
    });

}


// 동행 글 작성 및 수정 로직
$(document).ready(function() {
    $('.submitBtn').on('click', function() {
	    var titleInput = document.querySelector("input[name='title']");
	    var contextTextarea = document.querySelector("textarea[name='context']");
		// 필수 입력 항목 체크
	    if(!titleInput.value.trim()) {
	        alert('제목을 입력해주세요.');
	        titleInput.focus();
	        return;
	    }
	
	    if(!contextTextarea.value.trim()) {
	        alert('본문을 입력해주세요.');
	        contextTextarea.focus();
	        return;
	    }
        submitCompany();
    });
});

function getQueryStringValue(key) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(key);
}

// 게시글 작성 & 수정
function submitCompany() {
    const cpkey = getQueryStringValue('cpkey');
    const isEdit = cpkey !== null;
    const defaultCpImage = document.getElementById('defaultCpImage').value;
    const fileInput = document.querySelector('#fileInput');
    if (fileInput.files.length === 0 && isEdit) {
        // 이미지를 선택하지 않았고, 수정 중인 경우 기존 이미지를 사용합니다.
        sendCompanyData(defaultCpImage, isEdit, cpkey);
    } else {
        const formData = new FormData();
        formData.append('imgFile', fileInput.files[0]);
        $.ajax({
            url: '/upload',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                const cpimage = response; 
                sendCompanyData(cpimage, isEdit, cpkey);
            },
            error: function(xhr, status, error) {
                alert('이미지 업로드 중 문제가 발생했습니다. 다시 시도해주세요.');
            }
        });
    }
}

// 게시글 작성 & 수정
function sendCompanyData(cpimage, isEdit, cpkey) {
    const url = isEdit ? '/updateCompany' : '/insertCompany';
    let data = {
        'userid': $('#sessionUserId').val(),
        'cpimage': cpimage,
        'cptitle': $('input[name="title"]').val(),
        'cpcontent': $('textarea[name="context"]').val(),
        'cploc': $('input[name="loc"]:checked').val(),
        'cpnum': $('.teamNum').val(),
        'startdate': $('input[name="startDay"]').val(),
        'enddate': $('input[name="endDay"]').val()
    };
    if (isEdit) {
        data.cpkey = cpkey;
    }
    $.ajax({
        url: url,
        type: 'POST',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function(response) {
            const message = isEdit ? '게시글 수정 완료' : '게시글 작성 완료';
            alert(message);
            window.location.href = '/Community_Group';
        },
        error: function(xhr, status, error) {
            alert('게시글 저장 중 문제가 발생했습니다. 다시 시도해주세요.');
        }
    });
}




