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
            yearSuffix: '년'
        });
    });


// ------------- 업로드 이미지 노출 ----------------
window.onload = function() {
    // ----------- 설명 이미지
    const fileInput = document.querySelector('#fileInput');
    const fileDisplayArea = document.querySelectorAll('.imgArea');
    const uploadedBtn = document.querySelectorAll('.uploadedBtn');

    fileInput.addEventListener('change', function(e) {
        var file = fileInput.files[0];
        var imageType = /image.*/;

        if (file.type.match(imageType)) {
            var reader = new FileReader();

            reader.onload = function(e) {
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

    bgInput.addEventListener('change', function(e) {
        var file = bgInput.files[0];
        var imageType = /image.*/;

        if (file.type.match(imageType)) {
            var reader = new FileReader();

            reader.onload = function(e) {
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

}


