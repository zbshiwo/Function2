$(function () {
    $('#button').on('click', function () {
        var num = 0;
        for (var i = 1; i <= $('form').length; i++) {
            var names = "function_question_" + i;
            var radio = document.getElementsByName(names);

            for (var j = 0; j < radio.length; j++) {
                if (radio[j].checked) {
                    num++;
                }
            }
        }
        if (num < $('form').length ) {
            alert("你还有未完成的题目！");
            return;
        }
    })
})