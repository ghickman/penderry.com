$(document).ready(function () {
    var nav_element = $('nav');
    var scrolled_class = 'scrolled';
    var header_height = $('header').height();

    $(window).scroll(function () {
        console.log($(this).scrollTop());
        console.log(header_height);
        if ($(this).scrollTop() > header_height) {
            nav_element.addClass(scrolled_class);
        } else {
            nav_element.removeClass(scrolled_class);
        }
    });
});
