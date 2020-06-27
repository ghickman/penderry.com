$(document).ready(function () {
    const nav_element = $('nav');
    const scrolled_class = 'scrolled';
    const header_height = $('header').height();

    $(window).scroll(() => {
        if ($(this).scrollTop() > header_height) {
            nav_element.addClass(scrolled_class);
        } else {
            nav_element.removeClass(scrolled_class);
        }
    });

    $('nav > a').click(() => {
        nav_element.addClass('open');
        return false;
    });

    $('nav ul li:last-child').click(() => {
        nav_element.removeClass('open');
        return false;
    });

    // TODO: rebuild menu js menu following for mobile AND desktop
    // desktop: follow after header
    // mobile: always follow (css only maybe?)

    // $('.main-carousel').flickity({
    //     // imagesLoaded: true,
    //     // pageDots: false,
    //     // lazyLoad: true,
    //     wrapAround: true,
    // });
});
