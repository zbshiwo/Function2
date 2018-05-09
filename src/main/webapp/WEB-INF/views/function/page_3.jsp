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

                <h2>函数的嵌套调用</h2>
                <p>C语言中不允许作嵌套的函数定义。因此各函数之间是平行的，不存在上一级函数和下一级函数的问题。</p>
                <p>但是C语言允许在一个函数的定义中出现对另一个函数的调用。这样就出现了函数的嵌套调用。</p>
                <p>即在被调函数中又调用其它函数。这与其它语言的子程序嵌套的情形是类似的。</p>
                <p>计算s = 22! + 32!本题可编写两个函数，一个是用来计算平方值的函数f1，另一个是用来计算阶乘值的函数f2。</p>
                <p>主函数先调f1计算出平方值，再在f1中以平方值为实参，调用 f2计算其阶乘值，然后返回f1，再返回主函数，在循环程序中计算累加和。</p>
                <pre>
#include &lt;stdio.h&gt;
/*计算平方值*/
long f1(int p){
    int k;
    long r;
    long f2(int);

    k = p * p;
    r = f2(k);

    return r;
}
/*计算阶乘值*/
long f2(int q){
    long c = 1;
    int i;

    for (i = 1; i <= q; i++)
        c = c * i;

    return c;
}
/*主函数(用来计算s = 22! + 32!)*/
int main(void){
    int i;
    long s = 0;

    for (i = 2; i <= 3; i++)
        s = s + f1(i);
    printf("\n s= %ld \n",s);

    return 0;
}
                </pre>
                <p>其执行过程是：执行main函数中调用a函数的语句时，即转去执行a函数，在a函数中调用b 函数时，又转去执行b函数。</p>
                <p>b函数执行完毕返回a函数的断点继续执行，a函数执行完毕返回main函数的断点继续执行</p>
                <p>在程序中，函数f1和f2均为长整型，都在主函数之前定义，故不必再在主函数中对f1和f2加以说明。在主程序中，执行循环程序依次把i值作为实参调用函数f1求i2值。在f1中又发生对函数f2的调用，这时是把i2的值作为实参去调f2，在f2 中完成求i2!的计算。f2执行完毕把C值(即i2!)返回给f1，再由f1返回主函数实现累加。至此，由函数的嵌套调用实现了题目的要求。由于数值很大，所以函数和一些变量的类型都说明为长整型，否则会造成计算错误。</p>

                <h2>函数的递归调用</h2>
                <p>函数实现了代码的重用，大大简化缩短了程序员的工作量，更使得程序的可读性大大提高，函数的递归调用更是一种简化程序代码的方法。</p>
                <p>递归调用其实机是函数自己调用自己。</p>
                <p>下面的实例是一个求1+2+3.....+n的递归实例：</p>
                <pre>
#include &lt;stdio.h&gt;
/*声明函数*/
int sum(int n);

int main(){
    int a = sum(4);
    printf("%d",a);
  return 0;
}
/*求和函数实现*/
int sum(int n){
    /*如果n为1，无需求和，直接返回1*/
    if(n == 1){
        return 1;
    }
    /*如果n大于1，就返回n加上1+2+3.....+n-1的和*/
    return n + sum(n - 1);
}
                </pre>
                <p>可以发现，递归的代码很少，但是，递归也有缺点，递归占用的内存要比递推大，而且时间也要比递推长。</p>
            </div>
        </div>
    </div>
</body>
</html>