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

                <p><b>形参</b>：全称为“形式参数”是在定义函数名和函数体的时候使用的参数，目的是用来接收调用该函数时传递的参数。</p>
                <p>形参的作用是实现主调函数与被调函数之间的联系，通常将函数所处理的数据，影响函数功能的因素或者函数处理的结果作为形参。</p>
                <p>没有形参的函数在形参表的位置应该写<b>void.main</b>函数也可以有形参,也称为命令行参数。</p>

                <p><b>实参</b>：可以是常量、变量、表达式、函数等， 无论实参是何种类型的量，在进行函数调用时，它们都必须具有确定的值， 以便把这</p>
                <p>些值传送给形参。 因此应预先用赋值，输入等办法使实参获得确定值。</p>

                <p>实参和形参的区别：</p>
                <p>空白或占位符</p>
                <p>1。函数的形参列于函数声明中，在函数定义的函数体内使用。当函数调用时，形参（任何种类的）是一类将被填充的空白或是占位符。</p>
                <p>2。实参是用来填充形参的。当函数被调用时，实参列在函数名后面的括号里。执行函数调用时，实参被传递给形参。</p>

                <h3>C <span>传值方式调用函数</span></h3>
                <p>向函数传递参数的<b>传值调用</b>方法，把参数的实际值复制给函数的形式参数。在这种情况下，修改函数内的形式参数不会影响实际参数。</p>
                <p>默认情况下，C 语言使用<i>传值调用</i>方法来传递参数。一般来说，这意味着函数内的代码不会改变用于调用函数的实际参数。函数 <b>swap()</b> 定义如下：</p>
                <pre>
/* 函数定义 */
void swap(int x, int y)
{
int temp;

temp = x; /* 保存 x 的值 */
x = y;    /* 把 y 赋值给 x */
y = temp; /* 把 temp 赋值给 y */

return;
}
</pre>
                <p>现在，让我们通过传递实际参数来调用函数 <b>swap()</b>：</p>
                <pre>
#include &lt;stdio.h&gt;

/* 函数声明 */
void swap(int x, int y);

int main ()
{
/* 局部变量定义 */
int a = 100;
int b = 200;

printf("交换前，a 的值： %d\n", a );
printf("交换前，b 的值： %d\n", b );

/* 调用函数来交换值 */
swap(a, b);

printf("交换后，a 的值： %d\n", a );
printf("交换后，b 的值： %d\n", b );

return 0;
}
</pre>
                <p>当上面的代码被编译和执行时，它会产生下列结果：</p>
                <pre>
交换前，a 的值： 100
交换前，b 的值： 200
交换后，a 的值： 100
交换后，b 的值： 200
</pre>
                <p>上面的实例表明了，虽然在函数内改变了 a 和 b 的值，但是实际上 a 和 b 的值没有发生变化。</p>


                <h3>C <span>引用方式调用函数</span></h3>
                <p>通过引用传递方式，形参为指向实参地址的指针，当对形参的指向操作时，就相当于对实参本身进行的操作。</p>
                <p>传递指针可以让多个函数访问指针所引用的对象，而不用把对象声明为全局可访问。</p>
                <pre>
/* 函数定义 */
void swap(int *x, int *y)
{
   int temp;
   temp = *x;    /* 保存地址 x 的值 */
   *x = *y;      /* 把 y 赋值给 x */
   *y = temp;    /* 把 temp 赋值给 y */

   return;
}
</pre>
                <p>如需了解 C 中指针的更多细节，请访问 <a href="#">C - 指针</a> 章节。</p>
                <p>现在，让我们通过引用传值来调用函数 <b>swap()</b>：</p>
                <pre>
#include &lt;stdio.h&gt;

/* 函数声明 */
void swap(int *x, int *y);

int main ()
{
   /* 局部变量定义 */
   int a = 100;
   int b = 200;

   printf("交换前，a 的值： %d\n", a );
   printf("交换前，b 的值： %d\n", b );

   /* 调用函数来交换值
    * &amp;a 表示指向 a 的指针，即变量 a 的地址
    * &amp;b 表示指向 b 的指针，即变量 b 的地址
   */
   swap(&amp;a, &amp;b);

   printf("交换后，a 的值： %d\n", a );
   printf("交换后，b 的值： %d\n", b );

   return 0;
}
</pre>
                <p>当上面的代码被编译和执行时，它会产生下列结果：</p>
                <pre>
交换前，a 的值： 100
交换前，b 的值： 200
交换后，a 的值： 200
交换后，b 的值： 100
</pre>
                <p>上面的实例表明了，与传值调用不同，引用调用在函数内改变了 a 和 b 的值，实际上也改变了函数外 a 和 b 的值。</p>
                <button href="#" type="button" class="btn btn-success" style="display: block; margin: 0 auto;">阶段检测</button>
            </div>
        </div>
    </div>
</body>
</html>
