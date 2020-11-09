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
            <a href="carMain.jsp"><img src="img/logo.png" alt="로고 이미지" height="65"></a>
        </td>
        <td align="center" width="200">
            <%=id%> 님
            <%
                if(id.equals("GUEST")){
            %>
            <button onclick="location.href='carMain.jsp?center=memberLogin.jsp'">로그인</button>
            <%
                }else {
            %>
            <button onclick="location.href='memberLogout.jsp'">로그아웃</button>
            <%
                }
            %>
        </td>
    </tr>
    <tr height="50">
        <td align="center" width="200" bgcolor="red">
            <a href="carMain.jsp?center=carReservationMain.jsp" style="text-decoration: none; color: azure;">예 약 하 기</a>
        </td>
        <td align="center" width="200" bgcolor="red">
            <a href="carMain.jsp?center=carLookup.jsp" style="text-decoration: none; color: azure">예 약 확 인</a>
        </td>
        <td align="center" width="200" bgcolor="red">
            <a href="#" style="text-decoration: none; color: azure">자유게시판</a>
        </td>
        <td align="center" width="200" bgcolor="red">
            <a href="#" style="text-decoration: none; color: azure">이  벤  트</a>
        </td>
        <td align="center" width="200" bgcolor="red">
            <a href="#" style="text-decoration: none; color: azure">고 객 센 터</a>
        </td>
    </tr>
</table>
</body>
</html>
