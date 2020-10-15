<%@ page import="org.apache.axis.session.Session" %>
<%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-15
  Time: 오후 7:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rDTO" class="db.RentCarReservationDTO">
    <jsp:setProperty name="rDTO" property="*"/>
</jsp:useBean>

<%
    String id = (String)session.getAttribute("id");
    if(id==null){
%>
<script>
    alert("로그인 후 이용하세요");
</script>
<%
        response.sendRedirect("carMain.jsp?center=carLogin.jsp");
    }
%>
</body>
</html>
