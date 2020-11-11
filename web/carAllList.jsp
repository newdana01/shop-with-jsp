<%@ page import="db.RentCarDAO" %>
<%@ page import="db.RentCarDTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-15
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<table width="1000" align="center">
    <tr height="60">
        <td colspan="3">
            <span style="font-size: larger; color: red; font-weight: bold">■ 전체 모아보기</span>
        </td>
    </tr>
<%
    RentCarDAO rentCarDAO = new RentCarDAO();
    ArrayList<RentCarDTO> rentCarDTOS = rentCarDAO.getAllCar();
    int i=0;

    for(RentCarDTO rentCarDTO : rentCarDTOS){
        if(i%3 == 0){
%>
<tr height="220">
        <%
    }
%>
    <td width="333" align="center">
        <a href="carMain.jsp?center=carReservationInfo.jsp?cno=<%=rentCarDTO.getCno()%>">
            <img src="img/<%=rentCarDTO.getImg()%>" alt="차 이미지" width="300" height="200">
        </a><br>
        <span style="color: gray; font-size: small; font-weight: bold">차량명: <%=rentCarDTO.getCname()%></span>
    </td>
        <%
            i++; // i값을 증가하여 한줄에 3개의 차량만 보일 수 있게
    }
%>
    </table>

<br>
<form action="carMain.jsp?center=carCategoryList.jsp" method="post" align="center">
    <select name="category">
        <option value="1">소형</option>
        <option value="2">중형</option>
        <option value="3">대형</option>
    </select>&nbsp;&nbsp;
    <input type="submit" value="검색">
    <input type="button" onclick="location.href='carMain.jsp?center=carAllList.jsp'" value="전체 검색">
</form>
</body>
</html>
