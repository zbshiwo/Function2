<%--
  Created by IntelliJ IDEA.
  User: COREMAIL
  Date: 2018/4/21
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String message = (String) request.getAttribute("message");
    String url = (String)request.getAttribute("url");
%>
<html>
<head>
    <title>错误</title>
</head>
<body>
<h1><%=message%></h1>
<a href="<%=url%>">返回上一层</a>
</body>
</html>
