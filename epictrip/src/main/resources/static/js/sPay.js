document.addEventListener("DOMContentLoaded", function() {
    const cardPay = document.getElementById("cardPay");
    const nobankBook = document.getElementById("nobankBook");

    cardPay.addEventListener("click", function() {
        cardPay.classList.add("selected");
        nobankBook.classList.remove("selected");
        console.log("card")
    });

    nobankBook.addEventListener("click", function() {
        nobankBook.classList.add("selected");
        cardPay.classList.remove("selected");
        console.log("num")
    });
});

const phoneNum = document.getElementById('phoneNum');

phoneNum.addEventListener('input', () => {
  const maxLength = 11;
  const value = phoneNum.value;

  if (value.length > maxLength) {
    phoneNum.value = value.slice(0, maxLength);
  }
});

// 다국어 처리
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('input[name="lang"]').forEach(input => {
        input.addEventListener('change', function() {
            const selectedLang = this.value === 'langKor' ? 'ko' : 'en';
            $.ajax({
                url: `/changeLanguage?lang=${selectedLang}`,
                type: 'GET',
                success: function(data) {
                    changeLanguage(data);
                }
            });
        });
    });
});

function changeLanguage(messages) {
    document.querySelector('.buyerInfo h1').textContent = messages['reserve'];
    document.querySelector('.buyerInfo h2').textContent = messages['reserve_info'];
    document.querySelector('.nameGen span p:first-child').textContent = messages['reserve_name'];
    document.querySelector('.nameGen span p:last-child').textContent = messages['reserve_gender'];
    document.querySelector('.birth p').textContent = messages['reserve_birth'];
    document.querySelector('.phoneNum p').textContent = messages['reserve_phone'];
    document.querySelector('.email p').textContent = messages['reserve_email'];
    document.querySelector('.itemInfoInner .infoTop h1').textContent = messages['payment'];
    document.querySelector('.itemInfoInner .ment').textContent = messages['please_check'];
    document.querySelector('.selectItem span').textContent = messages['selected_product'];
    document.querySelector('.psptIn:nth-child(1) p:first-child').textContent = messages['total_payment'];
    document.querySelector('.psptIn:nth-child(2) p:first-child').textContent = messages['use_point'];
    document.querySelector('.psptIn.tot .totment').textContent = messages['total_price'];
    document.querySelector('.psptIn.pspBlue p:first-child').textContent = messages['accumulate'];
    document.querySelector('.howPay h3').textContent = messages['payment_method'];
    document.querySelector('#cardPay').textContent = messages['card_payment'];
    document.querySelector('#nobankBook').textContent = messages['nobank_payment'];
}

