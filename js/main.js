$(document).ready(function () {
    var nav_element = $('nav');
    var scrolled_class = 'scrolled';
    var header_height = $('header').height();

    $(window).scroll(function () {
        if ($(this).scrollTop() > header_height) {
            nav_element.addClass(scrolled_class);
        } else {
            nav_element.removeClass(scrolled_class);
        }
    });

    $('.gallery').flickity({
        imagesLoaded: true,
        pageDots: false,
        // lazyLoad: true,
        wrapAround: true,
    });
});
