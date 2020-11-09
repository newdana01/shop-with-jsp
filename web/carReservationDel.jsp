<%@ page import="db.RentCarDAO" %><%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-11-03
  Time: 오전 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String id = request.getParameter("id");
    String rdate = request.getParameter("rdate");

    RentCarDAO rentCarDAO = new RentCarDAO();
    rentCarDAO.delReservation(id, rdate);
    response.sendRedirect("carMain.jsp");
%>
</body>
</html>
