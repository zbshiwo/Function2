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
            <h3>关于&nbsp;main&nbsp;函数的参数</h3>
            <p>在有些很专业的书会看到如下代码</p>
            <pre>int main( int argc, char *argv[] )</pre>
            <p>上面的代码中 main 函数带了参数。</p>
            <p>但是有时又会看见main函数没有参数，如下：</p>
            <pre>int main()</pre>
            <p><strong>那么 main 函数到底有没有参数，有没有参数会不会有什么影响？</strong></p>
            <p>main 函数其实与我们写的函数没有什么区别，它也会有自己的参数。</p>
            <p>argc 和 argv 是 main 函数的形式参数。</p>
            <p>这两个形式参数的类型是系统规定的。如果 main 函数要带参数，就是这两个类型的参数；否则main函数就没有参数。</p>
            <p>变量名称argc和argv是常规的名称，当然也可以换成其他名称。在传入参数后main函数收到参数后就会做自己的事。那么，实际参数是如何传递给main函数的argc和argv的呢？</p>
            <p>我们知道，C程序在编译和链接后，都生成一个exe文件，执行该exe文件时，可以直接执行；也可以在命令行下带参数执行，命令行执行的形式为：可执行文件名称 参数1 参数2 ... ... 参数n。</p>
            <p>可执行文件名称和参数、参数之间均使用空格隔开。</p>
            <p>如果按照这种方法执行，命令行字符串将作为实际参数传递给main函数。具体为：</p>
            <ul>
                <li style="list-style-type: none">
                (1) 可执行文件名称和所有参数的个数之和传递给 argc；
                </li>
                <li style="list-style-type: none">
                (2) 可执行文件名称（包括路径名称）作为一个字符串，首地址被赋给 argv[0]，参数1也作为一个字符串，首地址被赋给 argv[1]，... ...依次类推。
                </li>
            </ul>
            <pre>
#include &lt;stdio.h&gt;

int main(int args, char *argv[])
{
    int i = 0;
    for(i = 0; i < args; i++)
    {
        printf("%s\n",argv[i]);
    }
    return 0;
}
</pre>
            <p>程序运行结果：</p>
            <pre>
gcc xxx.c
./xxx.out HelloWorld! Nice\ to\ meet\ you!
HelloWorld!
Nice to meet you!
</pre>
            <button href="#" type="button" class="btn btn-success" style="display: block; margin: 0 auto;">阶段检测</button>
        </div>
    </div>
</div>
</body>
</html>