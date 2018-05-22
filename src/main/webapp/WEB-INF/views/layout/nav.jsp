<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function() {
        var authority = <%=(int)request.getAttribute("authority")%>;

        $('#ulr a').each(function (i, item) {
            if (i >= authority) {
                $(item).attr('disabled', 'disabled');
                return;
            }
            $(item).on('click', function () {
                window.location.href = '/learnC/function/page?pageId=' + (i + 1);
            });
        });
    })
</script>
<div class="col-sm-3 col-md-2 sidebar">
    <ul id="navbar" class="nav nav-pills nav-stacked ">
        <li>
            <a href="#">C 语言学习-基础模块<span class="sr-only">(current)</span></a>
            <ul style="list-style: none" class="folded">
                <li><a href="#">123</a></li>
                <li><a href="#">456</a></li>
                <li><a href="#">789</a></li>
            </ul>
        </li>
        <li>
            <a href="#">C 语言学习-流程模块</a>
            <ul style="list-style: none" class="folded">
                <li><a href="#">123</a></li>
                <li><a href="#">456</a></li>
                <li><a href="#">789</a></li>
            </ul>
        </li>
        <li>
            <a href="#">C 语言学习-数组模块</a>
            <ul style="list-style: none" class="folded">
                <li><a href="#">123</a></li>
                <li><a href="#">456</a></li>
                <li><a href="#">789</a></li>
            </ul>
        </li>
        <li class="active" style="">
            <a href="#">C 语言学习-函数模块</a>
            <ul style="list-style: none" id="ulr">
                <li><a href="javascript:void(0)">函数的定义声明调用</a></li>
                <li><a href="javascript:void(0)">函数参数的传值和引用</a></li>
                <li><a href="javascript:void(0)">函数的嵌套递归</a></li>
                <li><a href="javascript:void(0)">函数中的各种变量</a></li>
                <li><a href="javascript:void(0)">变量存储类别</a></li>
                <li><a href="javascript:void(0)">内部函数和外部函数</a></li>
                <li><a href="javascript:void(0)">C语言的标准库函数</a></li>
                <li><a href="javascript:void(0)">关于&nbsp;main&nbsp;函数的参数</a></li>
                <li><a href="javascript:void(0)">指针与函数</a></li>
            </ul>
        </li>
        <li>
            <a href="#">C 语言学习-结构模块</a>
            <ul style="list-style: none" class="folded">
                <li><a href="#">123</a></li>
                <li><a href="#">456</a></li>
                <li><a href="#">789</a></li>
            </ul>
        </li>
        <li>
            <a href="#">C 语言学习-指针模块</a>
            <ul style="list-style: none" class="folded">
                <li><a href="#">123</a></li>
                <li><a href="#">456</a></li>
                <li><a href="#">789</a></li>
            </ul>
        </li>
        <li>
            <a href="#">C 语言学习-文件模块</a>
            <ul style="list-style: none" class="folded">
                <li><a href="#">123</a></li>
                <li><a href="#">456</a></li>
                <li><a href="#">789</a></li>
            </ul>
        </li>
    </ul>

</div>