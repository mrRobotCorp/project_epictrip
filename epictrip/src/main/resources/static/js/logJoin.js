// 인증번호 발송/ 재발송
	
function codeCk() {
  var phoneInput = document.getElementById("phoneNum");
  var codeCkDiv = document.querySelector(".phone.codeCk");
  var codeBtn = document.querySelector(".phoneNumCk");
  if (phoneInput.value.trim() === "") {
      var modalWrap = document.querySelector(".modalWrap");
      modalWrap.style.display = "block";
      
  } else {
      codeCkDiv.style.display = "block";
      codeBtn.value = "재발송";
         $.ajax({
	           type:"post",
	           url:"http://localhost:4040/mesgo",
	           data:{ "phonenumber": $("#phoneNum").val() },
	           success:function(ch){
	               alert("잠시 후 메시지가 도착합니다!");
	           },
	           error:function(err){
	               console.log(err);
	           }
	       });
  }
}
// 인증번호 확인
function checkMsg() {
  var codeInput = document.getElementById("code");
  var codeCheckMsg = document.getElementById("codeCheck");
  	       $.ajax({
	           type: "post",
	           url: "http://localhost:4040/checkMes",
	           data: { "numberC": $("#code").val() },
	           dataType:"text",
	           success: function(ch){
				   console.log(ch)
	               if(ch=="Y"){
					   	codeCheckMsg.textContent = "인증되었습니다.";
 					 	codeCheckMsg.classList.remove("errMsg");
 					 	allTrue = true
	                    
	               }else{
                     	codeCheckMsg.textContent = "인증에 실패하였습니다.";
      					codeCheckMsg.classList.add("errMsg");
      					allTrue = false
	               }
	           },
	           error: function(err){
	               console.log(err);
	           }
	       });
}
// 휴대폰 번호 입력 안하고 인증번호 발송 버튼 눌렀을 때 뜨는 에러모달창
function msgCk() {
  var modalWrap = document.querySelector(".modalWrap");
  modalWrap.style.display = "none";
}




// 회원가입 동의
const agreeChkAll = document.querySelector('input[name=check_all]');
agreeChkAll.addEventListener('change', (e) => {
let agreeChk = document.querySelectorAll('input[name=agree]');
for(let i = 0; i < agreeChk.length; i++){
    agreeChk[i].checked = e.target.checked;
}
});

const phoneNum = document.getElementById('phoneNum');

phoneNum.addEventListener('input', () => {
  const maxLength = 11;
  const value = phoneNum.value;

  if (value.length > maxLength) {
    phoneNum.value = value.slice(0, maxLength);
  }
});

const code = document.getElementById('code');

code.addEventListener('input', () => {
  const maxLength = 6;
  const value = code.value;

  if (value.length > maxLength) {
    code.value = value.slice(0, maxLength);
  }
});