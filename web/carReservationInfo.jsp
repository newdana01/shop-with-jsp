<%@ page import="db.RentCarDAO" %>
<%@ page import="db.RentCarDTO" %><%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-15
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    int cno = Integer.parseInt(request.getParameter("cno"));

    RentCarDAO rentCarDAO = new RentCarDAO();
    RentCarDTO rentCarDTO = rentCarDAO.getCarInfo(cno);

    int category = rentCarDTO.getCategory();
    String temp ="";
    if(category == 1) temp="소형";
    else if(category == 2) temp="중형";
    else temp="대형";
%>
<form action="carMain.jsp?center=carSelectOption.jsp" method="post">
    <table width="1000" align="center">
        <tr height="60">
            <td colspan="3">
                <span style="font-size: larger; color: red; font-weight: bold">■ <%=rentCarDTO.getCname()%></span>
            </td>
        </tr>
        <tr>
            <td rowspan="6" width="500" align="center">
                <img src="img/<%=rentCarDTO.getImg()%>" alt="차 이미지" width="450">
            </td>
            <td width="250" align="center">차량 이름</td>
            <td width="250" align="center"><%=rentCarDTO.getCname()%></td>
        </tr>
        <tr>
            <td width="250" align="center">차량 분류</td>
            <td width="250" align="center"><%=temp%></td>
        </tr>
        <tr>
            <td width="250" align="center">대여 가격</td>
            <td width="250" align="center"><%=rentCarDTO.getPrice()%> 원/1h</td>
        </tr>
        <tr>
            <td width="250" align="center">제조 회사</td>
            <td width="250" align="center"><%=rentCarDTO.getCompany()%></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <input type="hidden" name= "cno" value="<%=rentCarDTO.getCno()%>">
                <input type="hidden" name= "img" value="<%=rentCarDTO.getImg()%>">
                <input type="submit" value="옵션선택 및 예약하기">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
