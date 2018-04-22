$(function () {
    var $loginBox = $('#loginBox');
    var $logoutBox = $('#logoutBox');
    var $registerBox = $('#registerBox');
    var $repassword = $('#repassword');
    var $trueName = $('#trueName');

    $loginBox.on('click', function () {
        if ($repassword.css("display") != 'none' || $trueName.css("display") != 'none') {
            $('#errorInfo').hide();
            $('#loginName').val("");
            $('#password').val("");
            $repassword.hide();
            $trueName.hide();
            return;
        }

        var hash = md5.create();
        hash.update($('#password').val());
        if ($('#password').val() == "" || $('#loginName').val() == ""){
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
                userInfo : $('#loginName').val() + ',' + $('#password').val()
            },
            success : function (result) {
                if (result.success == "true"){
                    setTimeout(function () {
                        window.location.reload();
                    },1000);
                }
                else {
                    $('#errorInfo').show().html("密码错误！");
                    $('#loginName').val("");
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

    $registerBox.on('click', function () {
        if ($repassword.css("display") == 'none' && $trueName.css("display") == 'none') {
            $('#errorInfo').hide();
            $('#loginName').val("");
            $('#password').val("");
            $trueName.val("");
            $repassword.val("");
            $repassword.show();
            $trueName.show();
            return;
        }
        var loginName = $('#loginName').val();
        var trueName = $('#trueName').val();
        var password = $('#password').val();
        var repassword = $('#repassword').val();
        if (loginName == "" || password == "" || repassword == "" || trueName == "") {
            alert("输入不能为空！");
            return;
        }

        if (password != repassword) {
            alert("两次输入的密码不一致！")
            return;
        }
        $.ajax({
            type :"post",
            url : "/learnC/registerAndLogin",
            dataType : "json",
            data : {
                loginName : $('#loginName').val(),
                trueName : $('#trueName').val(),
                password : $('#password').val(),
                repassword : $('#repassword').val()
            },
            success : function (result) {
                if (result.success == "true"){
                    setTimeout(function () {
                        window.location.reload();
                    },1000);
                }
                else {
                    $('#errorInfo').show().html(result.message);
                    $('#loginName').val("");
                    $('#trueName').val("");
                    $('#password').val("");
                    $('#repassword').val("");
                }
            }
        });
    });

})