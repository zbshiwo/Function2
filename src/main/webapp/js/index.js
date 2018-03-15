$(function () {
    // var $registerBox = $('#registerBox');

    //增加点击事件,在屏幕分辨率小于768时,改变格式
    $('body').click(function () {
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



    //
    //var str = $('#pre').text();
    //console.log(str);
    //var replace = str.replace(/(\/\*[\s]*[\S]*[\s]*\*\/)/g, '<font color="red">$1</font>');
    //console.log(replace);
    //$('#pre').html(str.replace(/(\/\*[\S]*\*\/)/g, '<font color="red">$1</font>'));
    //$('#pre').html(replace);
    //console.log(str);



    var $loginBox = $('#loginBox');
    var $logoutBox = $('#logoutBox');

    $loginBox.on('click', function () {
        var hash = md5.create();
        hash.update($('#password').val());
        if ($('#password').val() == "" || $('#username').val() == ""){
            alert("账号密码不能为空!");
            return;
        }

        // console.log(hash.hex());
        $('#password').val(hash.hex());
        $.ajax({
            type :"post",
            url : "/learnC/login",
            dataType : "json",
            data : {
                userInfo : $('#username').val() + ',' + $('#password').val()
            },
            success : function (result) {
                // console.log("success!");
                if (result.success){
                    setTimeout(function () {
                        window.location.reload();
                    },1000);
                }
            }
        });
    });
    $logoutBox.on('click', function () {
        $.ajax({
            type :"post",
            url : "/learnC/logout",
            success : function (result) {
                setTimeout(function () {
                    window.location.reload();
                },1000);
            }
        });
    });
    // $registerBox.find('button').on('click', function () {
    //     $.ajax({
    //         type : "post",
    //         url : "/blog/login/register",
    //         dataType : "json",
    //         data : {
    //             username:$registerBox.find('[name = "username"]').val(),
    //             password:$registerBox.find('[name = "password"]').val(),
    //             repassword:$registerBox.find('[name = "repassword"]').val()
    //         },
    //         success : function (result) {
    //
    //             $("#error1").html(result.Message.message);
    //             if (result.Message.success){
    //                 setTimeout(function () {
    //                     $loginBox.show();
    //                     $registerBox.hide();
    //                 },1000);
    //             }
    //         }
    //     })
    // });

})