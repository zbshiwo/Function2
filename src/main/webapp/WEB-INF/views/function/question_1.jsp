<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <!-- Bootstrap core CSS -->
    <link href="/learnC/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/learnC/css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="/learnC/css/build.css">

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
                <form>
                    <p>1、下列叙述中正确的是(&nbsp;)</p>
                    <ul style="list-style-type: none">
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question1Radio1" value="option2" name="function_question_1">
                                <label for="question1Radio1">A.c语言程序将从源程序中第一个函数开始执行</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question1Radio2" value="option2" name="function_question_1" >
                                <label for="question1Radio2">B.可以在程序中由用户指定任意一个函数作为主函数，程序将从此开始执行</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question1Radio3" value="option2" name="function_question_1" >
                                <label for="question1Radio3">C.c语言规定必须用main作为主函数名，程序将从此开始执行，在此结束</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question1Radio4" value="option2" name="function_question_1" >
                                <label for="question1Radio4">D.main可作为用户标识符，用以命名任意一个函数作为主函数。</label>
                            </div>
                        </li>
                    </ul>
                </form>
                <form>
                    <p>2、 以下叙述正确的是(&nbsp;)</p>
                    <ul style="list-style-type: none">
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question2Radio1" value="option2" name="function_question_2" >
                                <label for="question2Radio1">A.c语言程序是由过程和函数组成的</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question2Radio2" value="option2" name="function_question_2" >
                                <label for="question2Radio2">B.c语言函数可以嵌套调用，例如：fun(fun(x))</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question2Radio3" value="option2" name="function_question_2" >
                                <label for="question2Radio3">C.c语言函数不可以单独编译</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question2Radio4" value="option2" name="function_question_2" >
                                <label for="question2Radio4">D.c语言中除了main函数，其他函数不可以作为单独文件形式存在。</label>
                            </div>
                        </li>
                    </ul>
                </form>
                <form>
                    <p>3、 以下叙述正确的是(&nbsp;)</p>
                    <ul style="list-style-type: none">
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question3Radio1" value="option2" name="function_question_3" >
                                <label for="question3Radio1">A.每个c程序文件中都必须要有一个main()函数</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question3Radio2" value="option2" name="function_question_3" >
                                <label for="question3Radio2">B.在c程序中main ()函数的位置是固定的</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question3Radio3" value="option2" name="function_question_3" >
                                <label for="question3Radio3">C.c程序中所有函数之间都可以是固定的</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question3Radio4" value="option2" name="function_question_3" >
                                <label for="question3Radio4">D.在c程序的函数中不能定义另一个函数</label>
                            </div>
                        </li>
                    </ul>
                </form>
                <form>
                    <p>4、 以下正确的函数定义形式是：（&nbsp;）</p>
                    <ul style="list-style-type: none">
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question4Radio1" value="option2" name="function_question_4" >
                                <label for="question4Radio1">A. double  fun(int x,int y);{}	</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question4Radio2" value="option2" name="function_question_4" >
                                <label for="question4Radio2">B.	double  fun(int x ;int y){}</label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question4Radio3" value="option2" name="function_question_4" >
                                <label for="question4Radio3">C. double  fun(int x,int y){} </label>
                            </div>
                        </li>
                        <li>
                            <div class="radio radio-success">
                                <input type="radio" id="question4Radio4" value="option2" name="function_question_4" >
                                <label for="question4Radio4">D.     double  fun(int x, y);{}</label>
                            </div>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
</body>
</html>