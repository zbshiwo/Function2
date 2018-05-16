<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <!--设置字符编码为utf-8-->
    <meta charset="utf-8">
    <!--
        Bootstrap 不支持 IE 古老的兼容模式,为了让 IE 浏览器运行最新的渲染模式下,
        建议将此 <meta> 标签加入到你的页面中
    -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--为了确保适当的绘制和触屏缩放-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <meta name="description" content="">
    <meta name="author" content="">
    <%--<link rel="icon" href="../../favicon.ico">--%>

    <title>C语言函数学习</title>
    <%--在script和link标签中的地址应为本页面的地址--%>
    <%--或者直接用根目录也可以--%>
    <!-- Bootstrap core CSS -->
    <link href="/learnC/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="/learnC/css/dashboard.css?v=<%=Math.random()%>" rel="stylesheet">

    <script src="/learnC/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="/learnC/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/learnC/js/index.js?v=<%=Math.random()%>" type="text/javascript"></script>
    <script src="/learnC/js/md5.js" type="text/javascript"></script>
    <script src="/learnC/js/login_logout.js" type="text/javascript"></script>

</head>
<body>
<%@include file="../layout/layout.jsp"%>
<div class="container-fluid" id="center">
    <div class="row">
        <%@include file="../layout/nav.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">C 函数</h1>
            <h3>C语言的标准函数库</h3>
            <p>C 标准库是一组 C 内置函数、常量和头文件，比如 &lt;stdio.h&gt;、&lt;stdlib.h&gt;、&lt;math.h&gt;，等等。这个标准库可以作为 C 程序员的参考手册。</p>
            <p>C标准函数库（C Standard library）是所有符合标准的头文件（head file）的集合，以及常用的函数库实现程序，例如I/O 输入输出和字符串控制。</p>
            <p>不像 COBOL、Fortran 和 PL/I等编程语言，在 C 语言的工作任务里不会包含嵌入的关键字，所以几乎所有的 C 语言程序都是由标准函数库的函数来创建的。</p>
            <h4>C 标准库 - <span style="color: #7fff00">&lt;math.h&gt;</span></h4>
            <p>math.h 头文件定义了各种数学函数和一个宏。在这个库中所有可用的功能都带有一个 double 类型的参数，且都返回 double 类型的结果。</p>
        </div>
    </div>
</div>
</body>
</html>