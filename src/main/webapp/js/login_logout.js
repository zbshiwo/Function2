$(function () {
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
                    window.location.href = '/learnC';
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