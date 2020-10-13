<%@ page import="db.RentCarDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.RentCarDTO" %><%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-13
  Time: 오후 6:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>차 예약하기</title>
</head>
<body>
<!--데이터베이스에 연결하여 최신순 자동차 3대만 불러옴-->
<%
    RentCarDAO rentCarDAO = new RentCarDAO();
    ArrayList<RentCarDTO> rentCarDTOS = rentCarDAO.getSelectCar();
%>

<table width="1000">
    <tr height="240">
        <td width="333" align="center">
            <img src="">
        </td>
    </tr>
</table>
</body>
</html>
