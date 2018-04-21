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

                if (result.success == "true"){
                    setTimeout(function () {
                        window.location.reload();
                    },1000);
                }
                else {
                    $('#errorInfo').show().html("密码错误！");
                    $('#username').val("");
                    $('#password').val("");
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

})