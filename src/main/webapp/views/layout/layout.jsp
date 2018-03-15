<%@ page import="com.zb.util.CookiesUtil" %>
<%@ page import="com.zb.dao.StudentDao" %>
<%@ page import="com.zb.dao.daoImpl.StudentDaoImpl" %>
<%@ page import="com.zb.util.StringUtil" %>
<%@ page import="com.zb.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    boolean result;
//    String username = null;
//    Cookie cookie = CookiesUtil.getCookieByName(request, "userInfo");
//    if (cookie != null) {
//        StudentDao studentDao = new StudentDaoImpl();
//        String formatRase64 = StringUtil.getFormatBase64(cookie.getValue());
//        username = formatRase64.split(":")[0];
//
//        Student student = studentDao.queryByName(formatRase64.split(":")[0]);
//        String str = StringUtil.getMD5Str(student.getLogin_name() + student.getPassword(), "UTF-8");
//        result = str.equals(formatRase64.split(":")[1]);
//    }
//    else result = false;
    Boolean result = false;
    String username = null;

    result = (Boolean)request.getAttribute("result");
    username = (String)request.getAttribute("username");
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <%
        if (!result){
    %>
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/learnC">学习C语言</a>
        </div>
        <div  class="navbar-collapse collapse">
            <div class="navbar-form navbar-right">
                <div class="form-group">
                    <input id="username" name="username" type="text" placeholder="Username" class="form-control">
                </div>
                <div class="form-group">
                    <input id="password" name="password" type="password" placeholder="Password" class="form-control">
                </div>
                <button id="loginBox" class="btn btn-success">Sign in</button>
                <%--<button id="registerBox" type="submit" class="btn btn-success">Sign up</button>--%>
            </div>
        </div><!--/.navbar-collapse -->
    </div>
    <%
    }
    else {
    %>

    <div class="container-fluid">
        <div id="navbar2" class="navbar-header">
            <a class="navbar-brand" href="/learnC">学习C语言</a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar3" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div id="navbar3" class="navbar-collapse collapse">
            <div class="navbar-form navbar-right">
                <div class="form-group">
                    <h5 style="color: #398439;">欢迎<%=username%></h5>
                </div>
                <button id="logoutBox" class="btn btn-success">退出</button>
                <%--<button id="registerBox" type="submit" class="btn btn-success">Sign up</button>--%>
            </div>
        </div><!--/.navbar-collapse -->
    </div>
    <%
        }
    %>
</nav>