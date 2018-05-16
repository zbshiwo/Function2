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
    <script src="/learnC/js/index.js" type="text/javascript"></script>
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

            <h2>普通的局部变量</h2>
            <p>普通的局部变量定义的时候直接定义或者在前面加上auto</p>
            <pre>
void func1(void)
{
    /*直接定义的局部变量*/
    int i = 1;

    i++;

    printf("i = %d.\n", i);
}</pre>
            <p>局部变量i的解析：</p>
            <p></p>在连续三次调用func1中，每次调用时，在进入函数func1后都会创造一个新的变量i，</p>
            <p>并且给它赋初值1，然后i++时加到2，</p>
            <p>然后printf输出时输出2.然后func1本次调用结束，</p>
            <p>结束时同时杀死本次创造的这个i。这就是局部变量i的整个生命周期。</p>
            <p>下次再调用该函数func1时，又会重新创造一个i，经历整个程序运算，</p>
            <p>最终在函数运行完退出时再次被杀死。</p>

            <h2>静态局部变量(static)</h2>
            <p>静态局部变量(static) 静态局部变量定义时前面加static关键字。</p>
            <p>静态局部变量和普通局部变量不同。静态局部变量也是定义在函数内部的，静态局部变量定义时前面要加static关键字来标识.</p>
            <p>静态局部变量所在的函数在多调用多次时，只有第一次才经历变量定义和初始化，以后多次在调用时不再定义和初始化，而是维持之前上一次调用时执行后这个变量的值。本次接着来使用。</p>
            <p>静态局部变量在第一次函数被调用时创造并初始化，但在函数退出时它不死亡，而是保持其值等待函数下一次被调用。</p>
            <p>下次调用时不再重新创造和初始化该变量，而是直接用上一次留下的值为基础来进行操作。</p>
            <p>静态局部变量的这种特性，和全局变量非常类似。它们的相同点是都创造和初始化一次，以后调用时值保持上次的不变。不同点在于作用域不同</p>
            <pre>
#include &lt;stdio.h&gt;

void func1(void);
void func_static(void);

int main(void)
{
    //a = 4;            // 编译报错，未定义

    func1();        <font color="red">// i = 2</font>
    func1();        <font color="red">// i = 2</font>
    func1();        <font color="red">// i = 2</font>

    func_static();    <font color="red">// i = 2</font>
    func_static();    <font color="red">// i = 3</font>
    func_static();    <font color="red">// i = 4</font>

    /* 因为i是定义在函数func中的局部变量，所以i的作用域为代码块作用域，所以i只在func1 */
    /* 函数内部有效，在func1外面是不能访问i的。所以这里i会无定义。*/
    /* error: ‘i’ undeclared (first use in this function) */
    <font color="red">// i = 5;</font>

    return 0;
}

void func1(void)
{
    int i = 1;                /* 普通的局部变量，auto可以省略的*/
    /* auto int i = 0;           自动局部变量，其实就是普通局部变量*/

    i++;

    printf("i = %d.\n", i);
}

void func_static(void)
{
    static int a = 1;        /* 静态的局部变量 */

    a++;

    printf("a = %d.\n", a);
}
            </pre>
            <h2>全局变量</h2>
            <p>定义在函数外面的变量，就叫全局变量。</p>
            <p>普通全局变量就是平时使用的，定义前不加任何修饰词。普通全局变量可以在各个文件中使用，可以在项目内别的.c文件中被看到，所以要确保不能重名。</p>
            <p>静态全局变量，静态全局变量就是用来解决重名问题的。静态全局变量定义时在定义前加static关键字， 告诉编译器这个变量只在当前本文件内使用，在别的文件中绝对不会使用。这样就不用担心重名问题。</p>
            <p>所以静态的全局变量就用在我定义这个全局变量并不是为了给别的文件使用，本来就是给我这个文件自己使用的。</p>
            <p>跨文件引用全局变量(extern) 就是说，你在一个程序的多个.c源文件中，可以在一个.c文件中定义全局变量g_a,并且可以在别的另一个.c文件中引用该变量g_a（引用前要声明）</p>
            <p>函数和全局变量在C语言中可以跨文件引用，也就是说他们的连接范围是全局的，具有文件连接属性，总之意思就是全局变量和函数是可以跨文件看到的（直接影响就是，我在a.c和b.c中各自定义了一个函数func，名字相同但是内容不同，编译报错。）。</p>
            <p>局部变量和全局变量的对比：</p>
            <ul style="list-style-type: none">
                <li><p>1、定义同时没有初始化，则局部变量的值是随机的，而全局变量的值是默认为0。</p></li>
                <li><p>2、使用范围上：全局变量具有文件作用域，而局部变量只有代码块作用域。</p></li>
                <li><p>3、生命周期上：全局变量是在程序开始运行之前的初始化阶段就诞生，到整个程序结束退出的时候才死亡；而局部变量在进入局部变量所在的代码块时诞生，在该代码块退出的时候死亡。</p></li>
                <li><p>4、变量分配位置：全局变量分配在数据段上，而局部变量分配在栈上。</p></li>
            </ul>
            <pre>
#include &lt;stdio.h&gt;

void func_in_a(void);

/* 声明了一个int变量g_a */
extern int g_a;
extern int g_b;

void func_in_b(void)
{
    printf("I am func in b.c.\n");
}

int main(void)
{
    printf("I am main in a.c.\n");
    printf("I am main in a.c, g_a = %d.\n", g_a);
    printf("I am main in a.c, g_a = %d.\n", g_b);

    //func_in_b();        // 直接调用

    func_in_a();        // 间接调用

    return 0;
}
            </pre>
            <pre>
#include &lt;stdio.h&gt;

void func_in_b(void);

int g_a = 12;
int g_b = 111;

void func_in_a(void)
{
    g_a = 24;

    printf("I am in func_in_a of a.c, g_a = %d.\n", g_a);
    func_in_b();
}
            </pre>
        </div>
    </div>
</div>
</body>
</html>