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
    <title>차량 예약</title>
</head>
<body>
<!--데이터베이스에 연결하여 최신순 자동차 3대만 불러옴-->
<%
    RentCarDAO rentCarDAO = new RentCarDAO();
    ArrayList<RentCarDTO> rentCarDTOS = rentCarDAO.getSelectCar();
%>

<table width="1000" align="center">
    <tr height="240">
        <%
            for(int i=0; i<rentCarDTOS.size(); i++){
                RentCarDTO rentCarDTO = rentCarDTOS.get(i);
        %>
        <td align="center">
            <a href="carReservationInfo.jsp?cbo=<%=rentCarDTO.getCno()%>"><img src="img/<%=rentCarDTO.getImg()%>" alt="" width="300" height="220"></a><br>
            <%=rentCarDTO.getCname()%>
        </td>
        <%
            }
        %>
    </tr>
</table>

<br>
<form action="index.jsp?center=carCategoryList.jsp" method="post" align="center">
    <select name="category">
        <option value="1">소형</option>
        <option value="2">중형</option>
        <option value="3">대형</option>
    </select>&nbsp;&nbsp;
    <input type="submit" value="검색">
    <input type="button" onclick="location.href='carAllList.jsp'" value="전체 검색">
</form>
</body>
</html>
