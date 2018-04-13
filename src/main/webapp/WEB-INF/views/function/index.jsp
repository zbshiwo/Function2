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

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="css/dashboard.css?v=<%=Math.random()%>" rel="stylesheet">
    <%--<link href="css/zb.css" rel="stylesheet">--%>

    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/index.js?v=<%=Math.random()%>" type="text/javascript"></script>
    <script src="js/md5.js" type="text/javascript"></script>
    <script src="js/login_logout.js" type="text/javascript"></script>

</head>
<body>
    <%@include file="../layout/layout.jsp"%>
    <div class="container-fluid" id="center">
        <div class="row">
            <%@include file="../layout/nav.jsp"%>

            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">C 函数</h1>

                <div >
                    <p>函数是一组一起执行一个任务的语句。每个 C 程序都至少有一个函数，即主函数 <b>main()</b> ，所有简单的程序都可以定义其他额外的函数。</p>
                    <p>您可以把代码划分到不同的函数中。如何划分代码到不同的函数中是由您来决定的，但在逻辑上，划分通常是根据每个函数执行一个特定的任务来进行的。</p>
                    <p>函数<b>声明</b>告诉编译器函数的名称、返回类型和参数。函数<b>定义</b>提供了函数的实际主体。</p>
                    <p>C 标准库提供了大量的程序可以调用的内置函数。例如，函数 <b>strcat()</b> 用来连接两个字符串，函数 <b>memcpy()</b> 用来复制内存到另一个位置。</p>
                    <p>函数还有很多叫法，比如方法、子例程或程序，等等。</p>
                </div>

                <h2 >定义函数</h2>
                <p>C 语言中的函数定义的一般形式如下：</p>
                <pre>return_type function_name(Parameter list)
{
    body of the function;
}</pre>

                <p>在 C 语言中，函数由一个函数头和一个函数主体组成。下面列出一个函数的所有组成部分：</p>
                <ul class="list">
                    <li><strong>返回类型：</strong>一个函数可以返回一个值。<b>return_type</b> 是函数返回的值的数据类型。有些函数执行所需的操作而不返回值，在这种情况下，return_type 是关键字 <b>void</b>。</li>
                    <li><strong>函数名称：</strong>这是函数的实际名称。函数名和参数列表一起构成了函数签名。</li>
                    <li><strong>参数：</strong>参数就像是占位符。当函数被调用时，您向参数传递一个值，这个值被称为实际参数。参数列表包括函数参数的类型、顺序、数量。参数是可选的，也就是说，函数可能不包含参数。</li>
                    <li><strong>函数主体：</strong>函数主体包含一组定义函数执行任务的语句。</li>
                </ul>

                <h2>实例</h2>
                <p>以下是 <b>max()</b> 函数的源代码。该函数有两个参数 num1 和 num2，会返回这两个数中较大的那个数：</p>
                <pre id="pre">/* 函数返回两个数中较大的那个数 */
int max(int num1, int num2)
{
   /* 局部变量声明 */
   int result;

   if (num1 &gt; num2)
      result = num1;
   else
      result = num2;

   return result;
}
</pre>

                <h2>函数声明</h2>
                <p>函数<b>声明</b>会告诉编译器函数名称及如何调用函数。函数的实际主体可以单独定义。</p>
                <p>函数声明包括以下几个部分：</p>
                <pre>
return_type function_name( parameter list );
</pre>
                <p>针对上面定义的函数 max()，以下是函数声明：</p>
                <pre>
int max(int num1, int num2);
</pre>
                <p>在函数声明中，参数的名称并不重要，只有参数的类型是必需的，因此下面也是有效的声明：</p>
                <pre>
int max(int, int);
</pre>
                <p>当您在一个源文件中定义函数且在另一个文件中调用函数时，函数声明是必需的。在这种情况下，您应该在调用函数的文件顶部声明函数。</p>

                <h2 class="tutheader">调用函数</h2>
                <p>创建 C 函数时，会定义函数做什么，然后通过调用函数来完成已定义的任务。</p>
                <p>当程序调用函数时，程序控制权会转移给被调用的函数。被调用的函数执行已定义的任务，当函数的返回语句被执行时，或到达函数的结束括号时，会把程序控制权交还给主程序。</p>
                <p>调用函数时，传递所需参数，如果函数返回一个值，则可以存储返回值。例如：</p>
                <pre>
#include &lt;stdio.h&gt;

/* 函数声明 */
int max(int num1, int num2);

int main ()
{
   /* 局部变量定义 */
   int a = 100;
   int b = 200;
   int ret;

   /* 调用函数来获取最大值 */
   ret = max(a, b);

   printf( "Max value is : %d\n", ret );

   return 0;
}

/* 函数返回两个数中较大的那个数 */
int max(int num1, int num2)
{
   /* 局部变量声明 */
   int result;

   if (num1 &gt; num2)
      result = num1;
   else
      result = num2;

   return result;
}
</pre>
                <p>把 max() 函数和 main() 函数放一块，编译源代码。当运行最后的可执行文件时，会产生下列结果：</p>
                <pre>
Max value is : 200
</pre>

<button href="#" type="button" class="btn btn-success" style="display: block; margin: 0 auto;">阶段检测</button>
            </div>
        </div>
    </div>
</body>
</html>
