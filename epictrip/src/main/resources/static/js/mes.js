let infouser = [];

// JavaScript 코드 예시
//const memChatButton = document.getElementById('memChat');
//const adminChatButton = document.getElementById('adminChat');

// URL에서 현재 페이지의 파일명을 추출하는 함수
function getCurrentPageFileName() {
  const urlParts = window.location.href.split('/');
  return urlParts[urlParts.length - 1];
}

const currentPageFileName = getCurrentPageFileName();

/*
if (currentPageFileName === 'message') {
  memChatButton.classList.add('selected');
}

if (currentPageFileName === 'message_userAdChat') {
  adminChatButton.classList.add('selected');
}
*/
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

// 동행 확정 모달 열기, 닫기
function openSelm(){
  var selmModal = document.querySelector(".selmModal");
  selmModal.style.display = "block";
}

function closeSelm(){
  var selmModal = document.querySelector(".selmModal");
  selmModal.style.display = "none";
}





var ysmId = $("#logUserId").val();
	

// =============== 모달 js ==================
// ms모달 열기,닫기
function memMpclose(){
  var memMpModal = document.querySelector(".memMpModal");
  memMpModal.style.display = "none";
}

function memMpopen(id){
    var memMpModal = document.querySelector(".memMpModal");
    memMpModal.style.display = "flex";
  
    var senderId = document.body.getAttribute('data-userid')
  
    levelCheck(id,senderId)//불러오기
    
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
    
	// 사용자 정보를 모달에 설정
	var user = infouser.find(u => u.userid === id);
	if(user) {
	    document.querySelector(".memMp .profile").src = "./source/" + user.image + ".jpg";
	    document.querySelector(".memMp .memMoname span").textContent = user.name;
	    document.querySelector(".memMp .memMoid span").textContent = '@' + user.userid;
	    document.querySelector(".memMp .myintroin span").textContent = user.userIntroduce;
	    document.querySelector(".memMp .mybirth span").textContent = (new Date().getFullYear() - new Date(user.birth).getFullYear())-((new Date().getFullYear() - new Date(user.birth).getFullYear())%10) + "대";
	    document.querySelector(".memMp .mygen span").textContent = user.gender;
	}
	  
  	var momdalId = $('#momdalId').val();
    var goodButton = $(".goodMem");
    var badButton = $(".badMem");

	goodButton.click(function () { //추천 눌럿을 때
        var goodInt = parseInt(goodButton.val());
        var badInt = parseInt(badButton.val());

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
} // 모달 끝
// 부르고 나서
$(document).ready(function() {

});

// 부르고 나서


//모달 버튼
function levelCheck(id,senderId){
	$.ajax({
		      type: "post",
		      url: "levelCheck",
		      data: {
		          userid: id,
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
	


//-----------
// 채팅 스크롤 하단 이동
function scrollToBottom() {
    let chatInner = document.querySelector(".chatInner");
    chatInner.scrollTop = chatInner.scrollHeight;
}



//----------------------------------------------------------------------------------
// 채팅 기능
// WebSocket 및 STOMP 클라이언트 설정
let socket = new SockJS('/ws');
let stompClient = Stomp.over(socket);
stompClient.connect({}, function(frame) {
    console.log('Connected: ' + frame);
    
    // 로컬 스토리지에서 'joinedChat' 항목을 확인
    let hasJoined = localStorage.getItem('joinedChat');

    // cpkey가 공백이거나 null이 아닐 때만 입장 로직 실행
    if (cpkey && cpkey.trim() !== '' && !hasJoined && fromChatButton === 'chatButton') {
        let chatNotification = {
            type: 'JOIN',
            senderId: document.body.getAttribute('data-userid'),
            senderName: document.body.getAttribute('data-name')
        };
        stompClient.send("/app/notify", {}, JSON.stringify(chatNotification));
        localStorage.setItem('joinedChat', 'true');
        let loggedInUserId = document.body.getAttribute('data-userid');
    	localStorage.setItem(`status-${loggedInUserId}`, 'joined');
    }

stompClient.subscribe('/topic/messages', function(message) {
    let receivedMessage = JSON.parse(message.body);
    
    if (receivedMessage.type) {
        if (receivedMessage.type === 'JOIN' || receivedMessage.type === 'LEAVE') {
            displayNotification(receivedMessage.content);
        }
        if (receivedMessage.type === 'LEAVE') {
            removeUser(receivedMessage.senderId);
        }
    } else {
        saveMessageToLocalStorage(receivedMessage.chatRoomId, receivedMessage);  // 채팅방 별로 메시지 저장
        
        // 현재 채팅방의 cpkey와 수신된 메시지의 chatRoomId가 동일한 경우에만 메시지를 화면에 표시합니다.
        if (receivedMessage.chatRoomId === cpkey) {
            displayMessage(receivedMessage.senderId, receivedMessage.senderName, 
            receivedMessage.content, receivedMessage.senderImage, receivedMessage.formattedTimestamp);
        }
    }
});



	stompClient.subscribe('/topic/users', function(users) {
	    let uniqueUsers = removeDuplicates(JSON.parse(users.body));
	    // 새로운 유저 입장 시 유저 정보 출력
	    displayUsers(uniqueUsers);
	    infouser =  uniqueUsers;
	});


   function displayNotification(message) {
       let messageArea = document.getElementById('messageArea');
       messageArea.innerHTML += `<li class="ment"><p class="mentp">${message}</p></li>`;
      scrollToBottom();
   }
// 나가기 버튼 클릭
document.getElementById('exitButton').addEventListener('click', function() {
    let isConfirmed = window.confirm("채팅방을 나가시겠습니까?");
    let loggedInUserId = document.body.getAttribute('data-userid');
    if (isConfirmed) {
        let chatRooms = JSON.parse(localStorage.getItem('chatRooms')) || [];
        let loggedInUserId = document.body.getAttribute('data-userid');

        // 해당 사용자가 참여 중인 특정 채팅방을 로컬 스토리지에서 삭제합니다.
        chatRooms = chatRooms.filter(room => room.key !== cpkey);

        // 해당 채팅방의 채팅 내용을 로컬 스토리지에서 삭제합니다.
        localStorage.removeItem(`chatMessages_${cpkey}`);

        localStorage.setItem('chatRooms', JSON.stringify(chatRooms));
        
        // 채팅방을 나간 유저의 접속정보 삭제
	    let userElement = document.getElementById('user-' + loggedInUserId);
	    if (userElement) {
	        userElement.remove();
	    }
	    
	    let selmModalUserElement = document.querySelector('.selecmems button[data-userid="' + loggedInUserId + '"]');
	    if (selmModalUserElement) {
	        selmModalUserElement.closest('.selecmems').remove();
	    }
        let chatNotification = {
            type: 'LEAVE',
            senderId: loggedInUserId,
            senderName: document.body.getAttribute('data-name'),
            chatRoomId: cpkey 
        };
        
        stompClient.send("/app/notify", {}, JSON.stringify(chatNotification));
	    stompClient.send("/app/leave", {}, loggedInUserId);
		localStorage.setItem(`status-${loggedInUserId}`, 'left');
        localStorage.removeItem('joinedChat');
	    let newURL = window.location.protocol + "//" + window.location.host + window.location.pathname
	    window.history.pushState({}, '', newURL);
        window.location.reload();
    }
});

    stompClient.send("/app/getUsers", {});

}, function(error) {
    console.error('WebSocket Connection Error:', error);
});
// 데이터 중복제거
function removeDuplicates(users) {
    const uniqueUsers = Array.from(new Set(users.map(user => user.userid)))
        .map(userid => {
            return users.find(user => user.userid === userid);
        });
    return uniqueUsers;
}

function removeUser(userId) {
    let userElement = document.getElementById('user-' + userId);
    if (userElement) {
        userElement.remove();
    }
}

let fromChatButton = new URL(window.location.href).searchParams.get('from');
let cpkey = new URL(window.location.href).searchParams.get('cpkey');
function sendMessage() {
    let messageInput = document.getElementById('messageTextarea');
    let message = messageInput.value;
    if (message.trim() !== '') {
        let chatMessage = {
            content: message,
            senderId: document.body.getAttribute('data-userid'),
            senderName: document.body.getAttribute('data-name'),
            cpkey: cpkey
        };
        stompClient.send("/app/send", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
}
// 사용자 목록을 화면에 표시하는 함수
function displayUsers(users) {
    // 쿼리 스트링이 없는 경우 함수 종료
    if (!window.location.search) {
        return;
    }
    let memberArea = document.getElementById('memberArea');
    let selmModal = document.getElementById('selmModal');
    let loggedInUserId = document.body.getAttribute('data-userid');
    users.forEach(user => {
        if (user.status === 'left') return;
        if (user.userid === loggedInUserId) return;
        if (document.getElementById('user-' + user.userid)) return;  
        if (document.getElementById('user2-' + user.userid)) return;  
        let image = user.image || 'defaultImage.jpg';
        let name = user.name || 'Unknown';
        memberArea.innerHTML += `
            <div class="member" id="user-${user.userid}">
                <div class="memberModalBtn" onclick="memMpopen('${user.userid}')">
                    <img src="./source/${image}.jpg" alt="">
                </div>
                <span>${name}</span>
                <p class="groupon" id="groupon-${user.userid}"></p>
            </div>`;
        selmModal.innerHTML += `
            <div class="selecmems" id="user2-${user.userid}">
                <div class="memsimgname">
                    <img src="./source/${image}.jpg" alt="">
                    <span>${name}</span>
                </div>
                <button type="button" class="groupToggle" data-userid="${user.userid}" 
                onclick="toggleGroupStatus(this)">확정</button>
            </div>`;
    });
    applySavedStatus();
}


function applySavedStatus() {
    let allToggleButtons = document.querySelectorAll('.groupToggle');
    
    allToggleButtons.forEach(buttonElement => {
        let userId = buttonElement.getAttribute('data-userid');
        let statusData = localStorage.getItem('groupon-' + userId);
        
        if (statusData) {  // 로컬 스토리지에 데이터가 있을 경우만 처리
            let parsedStatus = JSON.parse(statusData);  // 저장된 문자열을 객체로 변환
            if (parsedStatus && parsedStatus.cpkey) {  // cpkey 속성이 존재하는지 확인
                let statusElement = document.getElementById('groupon-' + userId);
                statusElement.textContent = '동행확정';
                buttonElement.textContent = '취소';
                buttonElement.classList.add('cancel');
            }
        }
    });
}

function displayMessage(senderId, senderName, message, senderImage, time) {
    let loggedInUserId = document.body.getAttribute('data-userid'); 
    let messageArea = document.getElementById('messageArea');
    let shouldScroll = messageArea.scrollTop + messageArea.clientHeight === messageArea.scrollHeight;
    
    if (senderId === loggedInUserId) {
        // 로그인한 사용자의 메시지
        messageArea.innerHTML += `
            <li class="mychat" id="mychatHeight">
                <div class="mychatBlank"></div>
                <div class="mychatTime">
                    <p class="sendDate">${time.split(' ')[1].slice(0,5)}</p>  <!-- 시간만 추출 -->
                </div>
                <div class="chatCom">
                    <p class="mychatInner">
                        <span>${message}</span>
                    </p>
                </div>
            </li>`;
    } else {
        // 다른 사용자의 메시지
        messageArea.innerHTML += `
            <li class="ansarea">
                <div class="ansprof">
                    <img src="./source/${senderImage}.jpg" alt="">
                </div>
                <div class="chatCom">
                    <p>${senderName}</p>
                    <p class="ansInner">${message}</p>
                </div>
                <p class="sendDate">${time.split(' ')[1].slice(0,5)}</p>  <!-- 시간만 추출 -->
            </li>`;
    }
    if (shouldScroll) {
        scrollToBottom();
    }
}

// 채팅방 입장 시 시간 표시
function checkAndDisplayConnectionTime() {
    let currentDate = new Date();
    let storedDateStr = localStorage.getItem('lastConnectionDate');
    
    // 현재 날짜를 "2023-08-09" 형식으로 변환
    let formattedCurrentDate = `${currentDate.getFullYear()}-${String(currentDate.getMonth() + 1).padStart(2, '0')}-${String(currentDate.getDate()).padStart(2, '0')}`;

        // 마지막 접속 날짜가 오늘과 다르면 시간 표시
        displayConnectionTime(currentDate);
        
        // 마지막 접속 날짜를 오늘로 업데이트
        localStorage.setItem('lastConnectionDate', formattedCurrentDate);
    if (storedDateStr !== formattedCurrentDate) {
    }
}

function displayConnectionTime(date) {
    let hours = String(date.getHours()).padStart(2, '0');
    let minutes = String(date.getMinutes()).padStart(2, '0');
    let message = `${date.getFullYear()}년 ${date.getMonth() + 1}월 ${date.getDate()}일 ${hours}시 ${minutes}분`;
    
    messageArea.innerHTML += `<li class="ment"><p class="mentp">${message}</p></li>`;
    console.log(message);
}

// 채팅방에 접속할 때마다 함수 실행
checkAndDisplayConnectionTime();



// localStorage 저장 로직
// 채팅방 추가
function addChatRoom(room) {
    let chatRooms = JSON.parse(localStorage.getItem('chatRooms')) || [];
    chatRooms.push(room);
    localStorage.setItem('chatRooms', JSON.stringify(chatRooms));
}

// 메시지 저장 로직 (채팅방 별로)
function saveMessageToLocalStorage(key, receivedMessage) {
    let messages = JSON.parse(localStorage.getItem(`chatMessages_${key}`)) || [];
    messages.push(receivedMessage);
    localStorage.setItem(`chatMessages_${key}`, JSON.stringify(messages));
}

// 메시지 불러오는 로직 (채팅방 별로)
function loadMessagesFromLocalStorage(key) {
    let messages = JSON.parse(localStorage.getItem(`chatMessages_${key}`)) || [];
    messages.forEach(message => {
        displayMessage(message.senderId, message.senderName, message.content, message.senderImage, message.formattedTimestamp);
    });
}

// 로컬스토리지의 채팅방 정보
function loadChatRooms() {
    return JSON.parse(localStorage.getItem('chatRooms')) || [];
}
// 웹소켓 연결 예외 처리
function onConnected() {
    console.log("Connected to WebSocket server.");
}
function onError(error) {
    console.error('WebSocket Connection Error:', error);
}

// 채팅방 목록을 화면에 표시하는 함수
function displayChatRooms() {
    let chatRooms = loadChatRooms();
    let chatRoomListArea = document.getElementById('chatRoomListArea');

    // 채팅방 목록을 비웁니다. (새로운 데이터로 업데이트하기 위해)
    chatRoomListArea.innerHTML = '';

    chatRooms.forEach(room => {	
		console.log("room:"+room.participants.length)
        chatRoomListArea.innerHTML += `
        <div class="chatroom" data-roomkey="${room.key}" data-userid="${room.participants[0]}" onclick="handleRoomClick(event)">
            <img src="./source/groupImg/${room.image}" alt="">
            <div class="roominfo">
                <div class="roomtitle">
                    <p >${room.title}</p>
                </div>
                <div class="listmsgtime">
                    <div></div>
                </div>
            </div>
        </div>`;
    });
}
function handleRoomClick(event) {
    let roomKey = event.currentTarget.getAttribute("data-roomkey");
    let userid = event.currentTarget.getAttribute("data-userid");
    console.log("Selected Room Key:", roomKey);

    // 현재 URL에서 쿼리스트링을 제거하고 새로운 roomKey로 쿼리스트링을 추가
    let newURL = window.location.protocol + "//" + window.location.host + 
    	window.location.pathname + '?cpkey=' + roomKey + '&userid=' + userid;

    // 새로운 URL로 히스토리를 변경
    window.history.pushState({}, '', newURL);

    // URL 변경 후 cpkey 값을 직접 갱신
    cpkey = roomKey;
    
    // 채팅방 이동 시 채팅 초기화
    let messageArea = document.getElementById('messageArea');
    messageArea.innerHTML="";

    // 채팅방 클릭 시 채팅 내용 로딩
    loadMessagesFromLocalStorage(cpkey);
	chatRoomTitle()
	checkDisplayStatus()
}
function chatRoomTitle(){
	    // 선택된 채팅방의 제목을 찾습니다.
    let chatRooms = loadChatRooms();
    let selectedChatRoom = chatRooms.find(room => room.key === cpkey);
    if (selectedChatRoom) {
		let titleSpan = document.querySelector("#chatTitle");  // id="chatTitle" 인 <span> 태그를 선택합니다.
        titleSpan.textContent = selectedChatRoom.title;  // 선택된 채팅방의 제목을 <span> 태그에 표시합니다.
    }
}



function checkDisplayStatus() {
    const currentUserId = document.body.getAttribute('data-userid');
    const cpkey = new URLSearchParams(window.location.search).get('cpkey');

    let chatRooms = localStorage.getItem('chatRooms');
    const selgroupMemDiv = document.querySelector('.selgroupMem');

    if (chatRooms) {
        chatRooms = JSON.parse(chatRooms);
        const currentRoom = chatRooms.find(room => room.key === cpkey);
        if (currentRoom) {
            const postAuthorId = currentRoom.participants[0];
            if (postAuthorId === currentUserId) {
                selgroupMemDiv.style.display = 'block';
            } else {
                selgroupMemDiv.style.display = 'none';
            }
        } else {
            selgroupMemDiv.style.display = 'none';
        }
    } else {
        selgroupMemDiv.style.display = 'none';
    }
}

document.getElementById('messageTextarea').addEventListener('keydown', function(event) {
    if (event.keyCode === 13 && !event.shiftKey) {
        event.preventDefault();
        sendMessage();
    }
});

function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    let regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

let cpkeyGroup = getParameterByName('cpkey');

function toggleGroupStatus(buttonElement) {
    let userId = buttonElement.getAttribute('data-userid');
    let statusElement = document.getElementById('groupon-' + userId);
    let user = infouser.find(u => u.userid === userId);  // 사용자 정보 가져오기

    if (!user) {
        console.error("User not found for ID:", userId);
        return;
    }

    if (statusElement.textContent === '동행확정') {
        statusElement.textContent = '';
        buttonElement.textContent = '확정';
        buttonElement.classList.remove('cancel');
        localStorage.removeItem('groupon-' + userId);
    } else {
        statusElement.textContent = '동행확정';
        buttonElement.textContent = '취소';
        buttonElement.classList.add('cancel');
        
        // 사용자 정보와 cpkey를 객체에 저장
        const userData = {
            cpkey: cpkeyGroup,
            name: user.name,
            birth: user.birth,
            image: user.image,
            gender: user.gender
        };

        localStorage.setItem('groupon-' + userId, JSON.stringify(userData));
    }
}

// 페이지 로딩 시 여러 정보를 불러옵니다.
document.addEventListener("DOMContentLoaded", function() {
    displayChatRooms();
    chatRoomTitle()
    stompClient.send("/app/getUsers", {});
    
    const currentURL = window.location.href;
    const targetURL = "http://localhost:4040/message";

    // 현재 URL이 targetURL과 동일한지 검사
    if (currentURL === targetURL) {
        displayChatRooms(); // 채팅방 목록 출력 함수 호출
    }
});
