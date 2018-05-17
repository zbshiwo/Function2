<%@ page import="com.sun.org.apache.bcel.internal.generic.ARRAYLENGTH" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title id="title">测试<%=(String)request.getAttribute("pageId")%></title>
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
    <script src="/learnC/js/answer.js"  type="text/javascript"></script>
</head>
<body>
    <%
        ArrayList<ArrayList> arrayLists = (ArrayList<ArrayList>)request.getAttribute("arrayList");
        String strs = "function_question_";
    %>
    <%@include file="../layout/layout.jsp"%>
    <div class="container-fluid" id="center">
        <div class="row">
            <%@include file="../layout/nav.jsp"%>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div style="display: none; margin:0 auto;" id="score">
                    <h2>你的成绩是<span style="color: #ff0000;" id="scored"></span></h2>
                    <button id="button1" type="button" class="btn btn-success" style="display: none;" onclick="location.href='/learnC/function/page?pageId=<%=(String)request.getAttribute("pageId")%>'">重新学习</button>
                    <button id="button2" type="button" class="btn btn-success" style="display: none;" onclick="location.href='/learnC/function/page?pageId=<%=Integer.parseInt((String)request.getAttribute("pageId")) + 1%>'">继续学习</button>
                </div>
                <%
                    for (int i = 0; i < arrayLists.size(); i++) {
                %>
                        <form>
                            <p><%=i+1%>、<%=arrayLists.get(i).get(0)%></p>
                            <ul style="list-style-type: none">
                                <%
                                    for (int j = 1; j < arrayLists.get(i).size(); j++) {
                                        String str = "";
                                        if (j == 1)
                                            str = "A";
                                        else if (j == 2)
                                            str = "B";
                                        else if (j == 3)
                                            str = "C";
                                        else str = "D";
                                %>
                                        <li>
                                            <div class="radio radio-success">
                                                <input type="radio" id="<%="question" + (i + 1) + "radio" + j%>" value="<%=str%>" name="<%=strs + (i + 1)%>">
                                                <label for="<%="question" + (i + 1) + "radio" + j%>"><%=arrayLists.get(i).get(j)%></label>
                                            </div>
                                        </li>
                                <%
                                    }
                                %>
                            </ul>
                        </form>
                <%
                    }
                %>
                <button id="button" type="button" class="btn btn-success" style="display: block; margin: 0 auto;">提交</button>
            </div>
        </div>
    </div>
</body>
</html>
