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

    $('nav > a').click(function () {
        nav_element.addClass('open');
        return false;
    });

    $('nav ul li:last-child').click(function () {
        nav_element.removeClass('open');
        return false;
    });

    // TODO: rebuild menu js menu following for mobile AND desktop
    // desktop: follow after header
    // mobile: always follow (css only maybe?)

    $('.gallery').flickity({
        imagesLoaded: true,
        pageDots: false,
        // lazyLoad: true,
        wrapAround: true,
    });
});
