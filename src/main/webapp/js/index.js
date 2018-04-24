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

        //匹配int,void,if,else,return使显示为绿色
        var replace = str.replace(/((int|void|if|else|return){1}[\s|\r]+)/g, '<font color="#7fff00">$1</font>');
        // replace = replace.replace(/([^\/]{1}[\*]+[^\/]{1})/g, '<font color="#7fff00">$1</font>');

        //匹配/* */，使显示为红色
        replace = replace.replace(/(\/\*[\s\S]*?\*\/)/g, '<font color="red">$1</font>');

        //匹配 /  /，是显示为红色
        //replace = replace.replace(/(\/\/[\s\S]*)/g, '<font color="red">$1</font>');

        //匹配#include <stdio.h>等等，防止被替换为<stdio.h></stdio.h>标签对
        //在HTML中，我们已将<>转义为&lt;&gt;，但是在上面的replace中，从页面中拿到的是<>，替换之后
        //还是将<>嵌入页面，所以还得拿出#include <stdio.h>，再替换为&lt;&gt;
        replace = replace.replace(/\#include([\s]+)[\<]{1}([a-zA-Z\.]+)[\>]{1}/g, '#include$1&lt;$2&gt;');
        pre.eq(i).html(replace);
    }

})