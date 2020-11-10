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
    int rno = Integer.parseInt(request.getParameter("rno"));
    RentCarDAO rentCarDAO = new RentCarDAO();
    rentCarDAO.delReservation(rno);

    String carLookup = "carLookup.jsp";
    response.sendRedirect("carMain.jsp?center="+carLookup);
%>
</body>
</html>
