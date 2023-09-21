document.addEventListener("DOMContentLoaded", function() {
    const findIdButton = document.getElementById("findIdButton");
    const findPasswordButton = document.getElementById("findPasswordButton");
    const idSection = document.querySelector(".testInner.id");
    const pwdSection = document.querySelector(".testInner.pwd");

    findIdButton.addEventListener("click", function() {
        findIdButton.classList.add("active");
        findPasswordButton.classList.remove("active");
        idSection.classList.add("active");
        pwdSection.classList.remove("active");
        idSection.style.display='block'
        pwdSection.style.display='none'
    });

    findPasswordButton.addEventListener("click", function() {
        findPasswordButton.classList.add("active");
        findIdButton.classList.remove("active");
        pwdSection.classList.add("active");
        idSection.classList.remove("active");
        idSection.style.display='none'
        pwdSection.style.display='block'
    });
});

const idPnum = document.getElementById('idPnum');

idPnum.addEventListener('input', () => {
  const maxLength = 11;
  const value = idPnum.value;

  if (value.length > maxLength) {
    idPnum.value = value.slice(0, maxLength);
  }
});

const pwdPnum = document.getElementById('pwdPnum');

pwdPnum.addEventListener('input', () => {
  const maxLength = 11;
  const value = pwdPnum.value;

  if (value.length > maxLength) {
    pwdPnum.value = value.slice(0, maxLength);
  }
});

const code = document.getElementById('idCode');

code.addEventListener('input', () => {
  const maxLength = 6;
  const value = code.value;

  if (value.length > maxLength) {
    code.value = value.slice(0, maxLength);
  }
});
const pwdCode = document.getElementById('pwdCode');

pwdCode.addEventListener('input', () => {
  const maxLength = 6;
  const value = pwdCode.value;

  if (value.length > maxLength) {
    pwdCode.value = value.slice(0, maxLength);
  }
});

// 휴대폰 번호 입력 안하고 인증 발송 버튼 눌렀을 때 경고창
function checkPhoneNumber() {
  var phoneNumberInput = document.getElementById('idPnum');
  if (phoneNumberInput.value === '') {
      alert('휴대폰 번호를 입력하세요.');
      return false; // 폼 제출 방지
  }
  return true; // 폼 제출 허용
}

// 인증 요청 버튼 클릭 시 함수를 호출합니다.
document.getElementById('idFindBtn').addEventListener('click', function(event) {
  if (!checkPhoneNumber()) {
      event.preventDefault(); // 폼 제출 방지
  }
});

document.getElementById('pwdFindBtn').addEventListener('click', function(event) {
  if (!checkPhoneNumber()) {
      event.preventDefault(); // 폼 제출 방지
  }
});

// 인증번호 발송/ 재발송
function codeCk(phoneNumId) {
  var phoneInput = document.getElementById(phoneNumId);
  if (phoneInput.value.trim() === "") {
      var modalWrap = document.querySelector(".modalWrap");
      modalWrap.style.display = "block";
  } else {
      $.ajax({
           type:"post",
           url:"http://localhost:4040/mesgo",
           data:{ "phonenumber": $("#" + phoneNumId).val() },
           success:function(ch){
               alert("잠시 후 메시지가 도착합니다!");
           },
           error:function(err){
               console.log(err);
           }
      });
  }
}
// 페이지 로드 시 버튼을 비활성화 상태로 설정
window.onload = function() {
    document.getElementById('idFindBtn').disabled = true;
    document.getElementById('pwdFindBtn').disabled = true;
}

function allInputsFilled(formType) {
    if (formType === "id") {
        return document.getElementById('idName').value.trim() !== "" &&
               document.getElementById('idPnum').value.trim() !== "" &&
               document.getElementById('idCode').value.trim() !== "";
    } else if (formType === "pwd") {
        return document.getElementById('pwdId').value.trim() !== "" &&
               document.getElementById('pwdPnum').value.trim() !== "" &&
               document.getElementById('pwdCode').value.trim() !== "";
    }
    return false;
}

// 인증번호 확인 함수
function checkMsg(codeInputId) {
    var codeInput = document.getElementById(codeInputId);
    $.ajax({
        type: "post",
        url: "http://localhost:4040/checkMes",
        data: { "numberC": $("#" + codeInputId).val() },
        dataType:"text",
        success: function(ch){
            if(ch=="Y"){
                alert("인증되었습니다.")
                // 인증 성공 후 버튼 활성화
                if (codeInputId === 'idCode' && allInputsFilled('id')) {
                    document.getElementById('idFindBtn').disabled = false;
                } else if (codeInputId !== 'idCode' && allInputsFilled('pwd')) {
                    document.getElementById('pwdFindBtn').disabled = false;
                }
            }else{
                alert("인증에 실패하였습니다.")
                // 인증 실패 시 버튼 비활성화
                if (codeInputId === 'idCode') {
                    document.getElementById('idFindBtn').disabled = true;
                } else {
                    document.getElementById('pwdFindBtn').disabled = true;
                }
            }
        },
        error: function(err){
            console.log(err);
        }
    });
}
