<%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-16
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<form action="memberLoginProc.jsp" method="post">
    <table width="300" align="center">
        <tr height="70">
            <td colspan="3" align="center">
                <span style="font-size: x-large; color: red; font-weight: bold">Log in</span>
            </td>
        </tr>
        <tr height="50">
            <td width="120" align="center">아이디</td>
            <td width="120" align="center">
                <input type="text" name="id" size="25">
            </td>
        </tr>
        <tr height="50">
            <td width="120" align="center">비밀번호</td>
            <td width="120" align="center">
                <input type="password" name="pw" size="25">
            </td>
        </tr>
        <tr height="60">
            <td width="120" align="center" colspan="2">
                <input type="submit" value="로그인">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
