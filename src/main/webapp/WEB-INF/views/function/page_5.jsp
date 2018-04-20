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

            <h3>C存储类</h3>
            <p>存储类定义 C 程序中变量/函数的范围（可见性）和生命周期。这些说明符放置在它们所修饰的类型之前。下面列出 C 程序中可用的存储类：</p>
            <ul class="list">
                <li><strong>auto</strong> 是局部变量的默认存储类, 限定变量只能在函数内部使用；</li>
                <li><strong>register</strong> 代表了寄存器变量，不在内存中使用；</li>
                <li><strong>static</strong> 是全局变量的默认存储类,表示变量在程序生命周期内可见；</li>
                <li><strong>extern</strong> 表示全局变量，即对程序内所有文件可见，类似于Java中的public关键字；</li>
            </ul>
            <h3>auto 存储类</h3>
            <p><b>auto</b> 存储类是所有局部变量默认的存储类。</p>
            <pre>
{
   int mount;
   auto int month;
}
</pre>
            <p>上面的实例定义了两个带有相同存储类的变量，auto 只能用在函数内，即 auto 只能修饰局部变量。</p>

            <h3>register 存储类</h3>
            <p><b>register</b> 存储类用于定义存储在寄存器中而不是 RAM 中的局部变量。这意味着变量的最大尺寸等于寄存器的大小（通常是一个词），且不能对它应用一元的 '&amp;' 运算符（因为它没有内存位置）。</p>
            <pre>
{
   register int  miles;
}
</pre>
            <p>寄存器只用于需要快速访问的变量，比如计数器。还应注意的是，定义 'register' 并不意味着变量将被存储在寄存器中，它意味着变量可能存储在寄存器中，这取决于硬件和实现的限制。</p>

            <h3>static 存储类</h3>
            <p><b>static</b> 存储类指示编译器在程序的生命周期内保持局部变量的存在，而不需要在每次它进入和离开作用域时进行创建和销毁。因此，使用 static 修饰局部变量可以在函数调用之间保持局部变量的值。</p>
            <p>static 修饰符也可以应用于全局变量。当 static 修饰全局变量时，会使变量的作用域限制在声明它的文件内。</p>
            <p>
                static 是全局变量的默认存储类，以下两个变量 (count 和 road) 都有一个 static 存储类。</p>
            <pre>
static int Count;
int Road;

main()
{
    printf("%d\n", Count);
    printf("%d\n", Road);
 }
</pre>
            <p>以下实例演示了 static 修饰全局变量和局部变量的应用：</p>
            <pre>
#include &lt;stdio.h&gt;

/* 函数声明 */
void func1(void);

static int count=10;        /* 全局变量 - static 是默认的 */

int main()
{
  while (count--) {
      func1();
  }
  return 0;
}

void func1(void)
{
/* 'thingy' 是 'func1' 的局部变量 - 只初始化一次
 * 每次调用函数 'func1' 'thingy' 值不会被重置。
 */
  static int thingy=5;
  thingy++;
  printf(" thingy 为 %d ， count 为 %d\n", thingy, count);
}
</pre>
            <p>实例中 count 作为全局变量可以在函数内使用，thingy 使用 static 修饰后，不会再每次调用时重置。</p>
            <p>可能您现在还无法理解这个实例，因为我已经使用了函数和全局变量，这两个概念目前为止还没进行讲解。即使您现在不能完全理解，也没有关系，后续的章节我们会详细讲解。当上面的代码被编译和执行时，它会产生下列结果：</p>
            <pre>
 thingy 为 6 ， count 为 9
 thingy 为 7 ， count 为 8
 thingy 为 8 ， count 为 7
 thingy 为 9 ， count 为 6
 thingy 为 10 ， count 为 5
 thingy 为 11 ， count 为 4
 thingy 为 12 ， count 为 3
 thingy 为 13 ， count 为 2
 thingy 为 14 ， count 为 1
 thingy 为 15 ， count 为 0
</pre>

            <h2 class="tutheader">extern 存储类</h2>
            <p><b>extern</b> 存储类用于提供一个全局变量的引用，全局变量对所有的程序文件都是可见的。当您使用 'extern' 时，对于无法初始化的变量，会把变量名指向一个之前定义过的存储位置。</p>
            <p>当您有多个文件且定义了一个可以在其他文件中使用的全局变量或函数时，可以在其他文件中使用 <i>extern</i> 来得到已定义的变量或函数的引用。可以这么理解，<i>extern</i> 是用来在另一个文件中声明一个全局变量或函数。</p>
            <p>extern 修饰符通常用于当有两个或多个文件共享相同的全局变量或函数的时候，如下所示：</p>
            <p><b>第一个文件：main.c</b></p>
            <pre>
#include &lt;stdio.h&gt;

int count ;
extern void write_extern();

int main()
{
   count = 5;
   write_extern();
}
</pre>
            <p><b>第二个文件：support.c</b></p>
            <pre>
#include &lt;stdio.h&gt;

extern int count;

void write_extern(void)
{
   printf("count is %d\n", count);
}
</pre>
            <p>在这里，第二个文件中的 <i>extern</i> 关键字用于声明已经在第一个文件 main.c 中定义的 <i>count</i>。现在 ，编译这两个文件，如下所示：</p>
            <pre>
 $ gcc main.c support.c
</pre>
            <p>这会产生 <b>a.out</b> 可执行程序，当程序被执行时，它会产生下列结果：</p>
            <pre>
count is 5
</pre>
        </div>
    </div>
</div>
</body>
</html>