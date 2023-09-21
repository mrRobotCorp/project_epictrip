// ----- slider ------
$(document).ready(function(){
    $('.slider').slick({
        dots: true, 
        arrow: true,
        infinite: true, 
        autoplay: true,
        autoplaySpeed : 1800,
        slidesToShow: 1,
        slidesToScroll: 1, 
    });
});