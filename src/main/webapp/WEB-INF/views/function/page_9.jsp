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

            <h3>函数指针</h3>
            <p>函数指针是指向函数的指针变量。</p>
            <p>通常我们说的指针变量是指向一个整型、字符型或数组等变量，而函数指针是指向函数。</p>
            <p>函数指针可以像一般函数一样，用于调用函数、传递参数。</p>
            <p>函数指针变量的声明：</p>
            <pre>
typedef int (*fun_ptr)(int,int); // 声明一个指向同样参数、返回值的函数指针类型
</pre>
            <h3>实例</h3>
            <p>以下实例声明了函数指针变量 p，指向函数 max：</p>
            <pre>
#include &lt;stdio.h&gt;

int max(int x, int y)
{
    return x > y ? x : y;
}

int main(void)
{
    /* p 是函数指针 */
    int (* p)(int, int) = & max; // &可以省略
    //int (*p)(int x, int y) = max;
    //int (*p)() = max;   这样都可以
    int a, b, c, d;

    printf("请输入三个数字:");
    scanf("%d %d %d", & a, & b, & c);

    /* 与直接调用函数等价，d = max(max(a, b), c) */
    d = p(p(a, b), c);

    printf("最大的数字是: %d\n", d);

    return 0;
}
</pre>
            <p>编译执行，输出结果如下：</p>
            <pre>
请输入三个数字:1 2 3
最大的数字是: 3
</pre>
            <h3>回调函数</h3>
            <p><strong>函数指针作为某个函数的参数</strong></p>
            <p>函数指针变量可以作为某个函数的参数来使用的，回调函数就是一个通过函数指针调用的函数。</p>
            <p>简单讲：回调函数是由别人的函数执行时调用你实现的函数。</p>
            <h3>实例</h3>
            <p>实例中 populate_array 函数定义了三个参数，其中第三个参数是函数的指针，通过该函数来设置数组的值。</p>
            <p>实例中我们定义了回调函数 getNextRandomValue，它返回一个随机值，它作为一个函数指针传递给 populate_array 函数。</p>
            <p>populate_array 将调用 10 次回调函数，并将回调函数的返回值赋值给数组。</p>
            <pre>
#include &lt;stdlib.h&gt;
#include &lt;stdio.h&gt;

// 回调函数
void populate_array(int *array, size_t arraySize, int (*getNextValue)(void))
{
    for (size_t i=0; i &lt; arraySize; i++)
        array[i] = getNextValue();
}

// 获取随机值
int getNextRandomValue(void)
{
    return rand();
}

int main(void)
{
    int myarray[10];
    populate_array(myarray, 10, getNextRandomValue);
    for(int i = 0; i &lt; 10; i++) {
        printf("%d ", myarray[i]);
    }
    printf("\n");
    return 0;
}
</pre>
            <p>编译执行，输出结果如下：</p>
            <pre>
16807 282475249 1622650073 984943658 1144108930 470211272 101027544 1457850878 1458777923 2007237709
</pre>
            <button href="#" type="button" class="btn btn-success" style="display: block; margin: 0 auto;">阶段检测</button>
        </div>
    </div>
</div>
</body>
</html>