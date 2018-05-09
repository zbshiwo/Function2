$(function () {
    var pageId = $('#title').html().match(/[1-9]/)[0];

    $('#button').on('click', function () {
        var num = 0, result = "", array = new Array();
        for (var i = 1; i <= $('form').length; i++) {
            var names = "function_question_" + i;
            var radio = document.getElementsByName(names);

            for (var j = 0; j < radio.length; j++) {
                if (radio[j].checked) {
                    array.push(radio[j]);
                    result += radio[j].value;
                    num++;
                }
            }
        }
        if (num < $('form').length ) {
            alert("你还有未完成的题目！");
            return;
        }
        $.ajax({
            type : "post",
            url : "/learnC/function/answer?pageId=" + pageId,
            dataType : "json",
            data : {
                "result" : result
            },
            success : function (result) {
                if (result.success == "true") {
                    $('#score').show();
                    $('#scored').html(result.score);
                    $('input:radio').attr("disabled", "disabled");

                    for (var i = 0; i < result.info.length; i++) {
                        if (result.info[i] == '0') {
                            array[i].parentNode.className="radio radio-danger";
                        }
                    }
                    $('#button').hide();
                    if (parseInt(result.score) >= 60) {
                        $('#button2').show().css("display", "inline");
                    }
                    else $('#button1').show("display", "inline");
                }
            }
        })
        return;
    })
})