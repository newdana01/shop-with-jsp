<%@ page import="db.RentCarDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.RentCarDTO" %><%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-14
  Time: 오후 6:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table width="1000" align="center"
<%
    int category = Integer.parseInt(request.getParameter("category"));

    RentCarDAO rentCarDAO = new RentCarDAO();
    ArrayList<RentCarDTO> rentCarDTOS = rentCarDAO.getCategoryList(category);
    int j=0;

    for(int i=0; i < rentCarDTOS.size(); i++){
        RentCarDTO rentCarDTO = rentCarDTOS.get(i);
        if(j%3 == 0){
%>
    <tr height="220">
<%
    }
%>
        <td width="333" align="center">
            <a href="index.jsp?center=carReservationInfo.jsp?cno=<%=rentCarDTO.getCno()%>">
                <img src="img/<%=rentCarDTO.getImg()%>" alt="차 이미지" width="300" height="200">
            </a><br>
            <span style="color: gray; font-size: small; font-weight: bold">차량명: <%=rentCarDTO.getCname()%></span>
        </td>
<%
            j++; // j값을 증가하여 한줄에 3개의 차량만 보일 수 있게
    }
%>
</table>
</body>
</html>
