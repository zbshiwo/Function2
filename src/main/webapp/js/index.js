$(function () {
    // var $registerBox = $('#registerBox');

    //增加点击事件,在屏幕分辨率小于768时,改变格式
    $('#center').click(function () {
        var width = $('body').width() + 15;
        if (width >= 768)
            return;
        var display = $('.sidebar').css('display');
        if (display == "block"){
            $('.sidebar').css('display', 'none');
        }
        else $('.sidebar').css('display', 'block');
    });

    //增加点击事件,当有点击事件发生时,折叠所有导航块,有点击事件发生的导航块取消折叠
    $('#navbar li').click(function () {

       if ($(this).children('ul').css('display') == 'none'){
           $('.folded').css('display', 'none');

           $(this).children('ul').css('display', 'block');
       }
       else {
           //$('.folded').css('display', 'none');
           $(this).children('ul').css('display', 'none');
       }

       return false;
    });

    var pre = $('pre');

    for (var i = 0; i < pre.length; i++) {
        var str = pre.eq(i).text();
        var replace = str.replace(/(\/\*[\s\S]*\*\/)/g, '<font color="red">$1</font>');
        pre.eq(i).html(replace);
    }

})