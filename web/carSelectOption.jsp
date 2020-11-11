<%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-15
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    int cno = Integer.parseInt(request.getParameter("cno"));
    String img = request.getParameter("img"); //이미지 파일명
%>
<form action="carMain.jsp?center=carReservationResult.jsp" method="post">
    <table width="1000" align="center">
        <tr height="60">
            <td colspan="3">
                <span style="font-size: larger; color: red; font-weight: bold">■ 옵션 선택</span>
            </td>
        </tr>
        <tr height="">
            <td rowspan="7" width="500" align="center">
                <img src="img/<%=img%>" alt="차 이미지" width="450">
            </td>
        </tr>
        <tr>
            <td width="250" align="center">대여 날짜</td>
            <td width="250" align="center">
                <input type="date" name="rent_date">
            </td>
        </tr>
        <tr>
            <td width="250" align="center">반납 날짜</td>
            <td width="250" align="center">
                <input type="date" name="return_date">
            </td>
        </tr>
        <tr>
            <td width="250" align="center">보험 적용</td>
            <td width="250" align="center">
                <select name="ins">
                    <option value="1">적용 (1일 1만원)</option>
                    <option value="2" selected>비적용</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="250" align="center">와이파이</td>
            <td width="250" align="center">
                <select name="wifi">
                    <option value="1">적용 (1일 1만원)</option>
                    <option value="2" selected>비적용</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="250" align="center">네비게이션</td>
            <td width="250" align="center">
                <select name="nav">
                    <option value="1">적용 (무료)</option>
                    <option value="2" selected>비적용</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="250" align="center">베이비 시트</td>
            <td width="250" align="center">
                <select name="seat">
                    <option value="1">적용 (1일 1만원)</option>
                    <option value="2" selected>비적용</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <input type="hidden" name="cno" value="<%=cno%>">
                <input type="submit" value="차량 예약하기">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
