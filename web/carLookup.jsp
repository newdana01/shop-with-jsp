<%@ page import="db.RentCarDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.LookupDTO" %><%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-27
  Time: 오후 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>예약 확인</title>
</head>
<body>
<%
    String id = (String)session.getAttribute("id");
    if(id==null){
%>
<script type="text/javascript">
    alert("로그인 후 이용하세요");
    location.href="carMain.jsp?center=memberLogin.jsp";
    </script>
<%
    }
    RentCarDAO rentCarDAO = new RentCarDAO();
    ArrayList<LookupDTO> cDTO = rentCarDAO.getAllReservation(id);
%>
<table align="center" width="1000">
    <tr height="60">
        <td colspan="3">
            <span style="font-size: larger; color: red; font-weight: bold">■ 예약 확인</span>
        </td>
    </tr>
    <tr height="40">
        <td width="150" align="center">차량</td>
        <td width="150" align="center">차량명</td>
        <td width="150" align="center">대여일</td>
        <td width="70" align="center">대여기간</td>
        <td width="100" align="center">대여금액</td>
        <td width="50" align="center">수량</td>
        <td width="60" align="center">보험</td>
        <td width="60" align="center">WIFI</td>
        <td width="60" align="center">네비게이션</td>
        <td width="60" align="center">베이비시트</td>
        <td width="90" align="center">취소</td>
    </tr>
    <%
        for(int i=0; i < cDTO.size(); i++){ //확장 for 문 바꾸는것 고려***
            LookupDTO bean = cDTO.get(i);
    %>
    <tr height="70">
        <td width="150" align="center">
            <img src="img/<%=bean.getImg()%>" alt="차량이미지" width="120" height="70">
        </td>
        <td width="150" align="center"><%=bean.getCname()%></td>
        <td width="150" align="center"><%=bean.getRent_date()%></td>
        <td width="60" align="center"><%=bean.getRent_term()%></td>
        <td width="100" align="center"><%=bean.getPrice()%></td> //전제 금액 수정 ***
        <td width="60" align="center"><%=bean.getQty()%></td>
        <td width="60" align="center">보험</td>
        <td width="60" align="center">WIFI</td>
        <td width="60" align="center">네비게이션</td>
        <td width="60" align="center">베이비시트</td>
        <td width="90" align="center">
            <button onclick="location.href='carReservationDel.jsp?id=<%=id%>&rdate=<%=bean.getRent_date()%>'">삭제</button>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
