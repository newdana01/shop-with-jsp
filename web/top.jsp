<%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-08
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<!--세션을 이용한 로그인 처리-->
<%
    String id = (String)session.getAttribute("id");

    //로그인이 되어있지 않다면
    if(id==null){
        id="GUEST";
    }
%>
<table width="1000" align="center">
    <tr height="80">
        <td colspan="4">
            <img src="img/logo.png" height="65">
        </td>
        <td align="center" width="200">
            <%=id%> 님 반갑습니다.
        </td>
    </tr>
    <tr height="50">
        <td align="center" width="200" bgcolor="red">
            <a href="carReservationMain.jsp" style="text-decoration: none; color: azure;">예 약 하 기</a>
        </td>
        <td align="center" width="200" bgcolor="red">
            <a href="#" style="text-decoration: none; color: azure">예 약 확 인</a></span>
        </td>
        <td align="center" width="200" bgcolor="red">
            <a href="#" style="text-decoration: none; color: azure">자유게시판</a></span>
        </td>
        <td align="center" width="200" bgcolor="red">
            <a href="#" style="text-decoration: none; color: azure">이  벤  트</a></span>
        </td>
        <td align="center" width="200" bgcolor="red">
            <a href="#" style="text-decoration: none; color: azure">고 객 센 터</a></span>
        </td>
    </tr>
</table>
</body>
</html>