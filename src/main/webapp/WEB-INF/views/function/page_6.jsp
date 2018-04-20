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

            <h3>内部函数</h3>
            <p>如果一个函数只能被本文件中其他函数所调用，它称为内部函数。在定义内部函数时，在函数名和函数类型的前面加 static，即</p>
            <pre>
static 类型名 函数名 （形参表）
</pre>
            <p>例如，函数的首行：</p>
            <pre>
static int max(int a,int b)
</pre>
            <p>内部函数又称静态函数。使用内部函数，可以使函数的作用域只局限于所在文件。即使在不同的文件中有同名的内部函数，也互不干扰。提高了程序的可靠性。</p>
            <h3>外部函数</h3>
            <p>如果在定义函数时，在函数的首部的最左端加关键字 extern，则此函数是外部函数，可供其它文件调用。</p>
            <p>如函数首部可以为</p>
            <pre>
extern int max (int a,int b)
</pre>
            <p>C 语言规定，如果在定义函数时省略 extern，则默认为外部函数。</p>
            <p>在需要调用此函数的其他文件中，需要对此函数作声明（不要忘记，即使在本文件中调用一个函数，也要用函数原型来声明）。在对此函数作声明时，要加关键字 extern，表示该函数是在其他文件中定义的外部函数。</p>
            <h3>实例</h3>
            <p>以下实例通过多个文件的函数实现输入一串字符串，然后删除指定的字符：</p>
            <p>file1.c(文件1)</p>
            <pre>
#include &lt;stdio.h&gt;

static void delete_string(char str[],char ch);
int main()
{
&nbsp;&nbsp;&nbsp;&nbsp;extern void enter(char str[]); // 对函数的声明
&nbsp;&nbsp;&nbsp;&nbsp;extern void print(char str[]); // 对函数的声明
&nbsp;&nbsp;&nbsp;&nbsp;char c,str[100];
&nbsp;&nbsp;&nbsp;&nbsp;enter(str);
&nbsp;&nbsp;&nbsp;&nbsp;scanf("%c",&amp;c);
&nbsp;&nbsp;&nbsp;&nbsp;delete_string(str,c);
&nbsp;&nbsp;&nbsp;&nbsp;print(str);
&nbsp;&nbsp;&nbsp;&nbsp;return 0;
}

static void delete_string(char str[],char ch)//内部函数
{
&nbsp;&nbsp;&nbsp;&nbsp;int i,j;
&nbsp;&nbsp;&nbsp;&nbsp;for(i=j=0;str[i]!='\0';i++)
&nbsp;&nbsp;&nbsp;&nbsp;if(str[i]!=ch)
&nbsp;&nbsp;&nbsp;&nbsp;str[j++]=str[i];
&nbsp;&nbsp;&nbsp;&nbsp;str[j]='\0';
}
</pre>
            <p>file2.c(文件2)</p>
            <pre>
#include &lt;stdio.h&gt;

void enter(char str[100]) // 定义外部函数 enter
{
    fgets(str, 100, stdin); // 向字符数组输入字符串
}
</pre>
            <p>file3.c(文件3)</p>
            <pre>
#include &lt;stdio.h&gt;

void print(char str[]) // 定义外部函数 print
{
&nbsp;&nbsp;&nbsp;&nbsp;printf("%s\n",str);
}
</pre>
            <p>输入字符串"abcdef"，给字符数组 str，在输入要删去的字符'd'。 运行结果:</p>
            <pre>
$ gcc file1.c file2.c file3.c
$ ./a.out
abcdef                   # 输入的字符串
d                        # 要删除的字符
abcef                    # 删除后的字符串
</pre>
            <button href="#" type="button" class="btn btn-success" style="display: block; margin: 0 auto;">阶段检测</button>
        </div>
    </div>
</div>
</body>
</html>