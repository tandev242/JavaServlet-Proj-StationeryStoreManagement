/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function addCart(id) {
    $.ajax({
        url: 'cart/add?id=' + id + '&quantity=1',
        type: 'GET'
    }).done(function (response) {
        result = $(response).find('#SL').text();
        $("#SL").html(result);
        $("#SL-sidebar").html(result);
    });
}
;

$(document).ready(function () {
    $('.add-cart').click(function (e) {
        e.preventDefault();
        var parent = $(this).parents('.thumbnail');
        var cart = $(document).find('#cart-shop');

        var id = parent.find('input').attr('value');

        var src = parent.find('img').attr('src');
        var parTop = parent.offset().top;
        var parleft = parent.offset().left;
        $('<img />',
                {
                    class: 'img-fly',
                    src: src
                }).appendTo('body').css(
                {
                    'top': parTop,
                    'left': parleft
                });
        setTimeout(function () {
            $(document).find('.img-fly').css({
                'top': cart.offset().top,
                'left': cart.offset().left
            });
            setTimeout(function () {
                $(document).find('.img-fly').remove();
            }, 1000);
        }, 500);
        addCart(id);
    });
});