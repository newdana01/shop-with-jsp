<%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-11-03
  Time: 오후 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    //id에 null을 부여하여 로그아웃
    session.setAttribute("id", null);
    session.invalidate();
    response.sendRedirect("carMain.jsp");
%>
</body>
</html>
