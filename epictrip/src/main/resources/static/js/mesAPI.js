// JavaScript 코드 예시
const memChatButton = document.getElementById('memChat');
const adminChatButton = document.getElementById('adminChat');

// URL에서 현재 페이지의 파일명을 추출하는 함수
function getCurrentPageFileName() {
  const urlParts = window.location.href.split('/');
  return urlParts[urlParts.length - 1];
}

const currentPageFileName = getCurrentPageFileName();

if (currentPageFileName === 'message') {
  memChatButton.classList.add('selected');
}

if (currentPageFileName === 'message_userAdChat') {
  adminChatButton.classList.add('selected');
}

const messageTextarea = document.getElementById('messageTextarea');
const sendButton = document.getElementById('sendButton');

messageTextarea.addEventListener('input', function() {
    if (messageTextarea.value.trim() !== '') {
        sendButton.classList.add('send');
    } else {
        sendButton.classList.remove('send');
    }
});

document.addEventListener("DOMContentLoaded", function() {
  var roomTitles = document.querySelectorAll(".roomtitle p");

  roomTitles.forEach(function(roomTitle) {
      if (roomTitle.textContent.length > 18) {
          var originalText = roomTitle.textContent;
          roomTitle.textContent = originalText.slice(0, 18) + "···";
      }
  });
});

// 말 줄임...
document.addEventListener("DOMContentLoaded", function() {
  var chatroomName = document.querySelectorAll(".chatroomname p");

  chatroomName.forEach(function(chatroomName) {
      if (chatroomName.textContent.length > 50) {
          var originalText = chatroomName.textContent;
          chatroomName.textContent = originalText.slice(0, 50) + "···";
      }
  });
});

// 동행 확정, 취소 토글 버튼
const groupToggleButtons = document.querySelectorAll('.groupToggle');
const grouponTexts = document.querySelectorAll('.groupon');

groupToggleButtons.forEach((button, index) => {
  button.addEventListener('click', () => {
    if (button.classList.contains('cancel')) {
      button.textContent = '확정';
      button.classList.remove('cancel');
      grouponTexts[index].innerText = '';
    } else {
      button.textContent = '취소';
      button.classList.add('cancel');
      grouponTexts[index].innerText = '동행 확정';
    }
  });
});

// 동행 확정 모달 열기, 닫기
function openSelm(){
  var selmModal = document.querySelector(".selmModal");
  selmModal.style.display = "block";
}

function closeSelm(){
  var selmModal = document.querySelector(".selmModal");
  selmModal.style.display = "none";
}

// =============== 모달 js ==================
// ms모달 열기,닫기
function memMpclose(){
  var memMpModal = document.querySelector(".memMpModal");
  memMpModal.style.display = "none";
}
function memMpopen(){
  var memMpModal = document.querySelector(".memMpModal");
  memMpModal.style.display = "flex";
}
// 
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


// openAI api 인공지능 챗봇
document.getElementById('sendButton').addEventListener('click', function() {
    const question = document.getElementById('messageTextarea').value;

    fetch('/ask', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ question: question })
    })
    .then(response => response.text())
    .then(answer => {
        displayChat(question, answer);
    })
    .catch(error => {
        console.error('Error:', error);
    });
});


function getCurrentTime() {
    const now = new Date();
    const hours = now.getHours();
    const minutes = now.getMinutes();
    const ampm = hours >= 12 ? '오후' : '오전';
    return `${ampm} ${hours % 12}:${minutes < 10 ? '0' : ''}${minutes}`;
}
// GPT 응답 표시
function displayChat(question, answer) {
    const chatInner = document.querySelector('.chatInner ul');

    const userChatItem = document.createElement('li');
    userChatItem.className = 'mychat';
    userChatItem.innerHTML = `
        <div class="mychatBlank"></div>
        <div class="mychatTime">
            <p class="sendDate">${getCurrentTime()}</p>
        </div>
        <div class="chatCom">
            <p class="mychatInner">
                <span>${question}</span>
            </p>
        </div>
    `;
    chatInner.appendChild(userChatItem);

    const gptChatItem = document.createElement('li');
    gptChatItem.className = 'ansarea';
    gptChatItem.innerHTML = `
        <div class="ansprof">
            <img src="./source/cAdmin.png" alt="">
        </div>
        <div class="chatCom">
            <p>에픽트립</p>
            <p class="ansInner">
                <span>${answer}</span>
            </p>
        </div>
        <p class="sendDate">${getCurrentTime()}</p>
    `;
    chatInner.appendChild(gptChatItem);
}

