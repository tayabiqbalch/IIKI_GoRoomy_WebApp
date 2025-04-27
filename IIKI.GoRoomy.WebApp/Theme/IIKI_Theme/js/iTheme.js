
$(document).ready(function () {
    // Function for small header
    $('.expand-collapse-header-action').click(function (event) {
        event.preventDefault();
        var breadcrumb = $(this).parent().find('#breadcrumb');
        breadcrumb.toggleClass('m-t-lg');

        var icon = $(this).find('i:first');
        icon.toggleClass('fa-arrow-up').toggleClass('fa-arrow-down');
        //$(this).closest('.ipage-header').toggleClass('large-header');
        $('.ipage-header').toggleClass('large-header');

        var icon = $('.expand-collapse-content-action').find('i:first');
        if (icon){
            icon.toggleClass('fa-arrow-up').toggleClass('fa-arrow-down');
        }
        $('.ipage-content').toggleClass('large-content');
    });
    $('.expand-collapse-content-action').click(function (event) {
        event.preventDefault();

        var icon = $(this).find('i:first');
        icon.toggleClass('fa-arrow-up').toggleClass('fa-arrow-down');
        //$(this).closest('.ipage-content').toggleClass('large-content');
        $('.ipage-content').toggleClass('large-content');

        var icon = $('.expand-collapse-header-action').find('i:first');
        if (icon) {
            icon.toggleClass('fa-arrow-up').toggleClass('fa-arrow-down');
        }
        $('.ipage-header').toggleClass('large-header');
    });
    $("input").attr("maxlength", function () {
        return $(this).attr("data-val-length-max");
    });
});
window.onload = function () {

   
}
