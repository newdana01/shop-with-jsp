<%@ page import="org.apache.axis.session.Session" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="db.RentCarDAO" %>
<%@ page import="db.RentCarDTO" %>
<%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-15
  Time: 오후 7:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rDTO" class="db.RentCarReservationDTO">
    <jsp:setProperty name="rDTO" property="*"/>
</jsp:useBean>

<%
    String id = (String)session.getAttribute("id");
    if(id==null){
%>
<script type="text/javascript">
    alert("로그인 후 이용하세요");
    location.href="carMain.jsp?center=memberLogin.jsp";
</script>
<%
    }else{

    //날짜 비교
    Date d1 = new Date();
    Date d2 = new Date();
    //날짜를 yyyy-MM-dd으로 포맷해주는 객체 생성
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    d1 = sdf.parse(rDTO.getRent_date()); //String 타입의 날짜를 Date 타입으로 변환
    d2 = sdf.parse(sdf.format(d2)); //yyyy-MM-dd으로 바꾼 후 Date 타입으로 변환

    int compare = d1.compareTo(d2);
    //예약하려는 날짜보다 현재날짜가 크다면 -1 같다면 0, 예약하려는 날짜가 더 크다면 1을 리턴

    if(compare < 0){ //오늘보다 이전 날짜 선택시
%>
<script>
    alert("현재 시스템 날짜보다 이전 날짜는 선택할 수 없음");
    history.back();
</script>
<%
    }
    //아이디 값을 가져옴
    String id1 = (String)session.getAttribute("id");
    rDTO.setId(id1);

    RentCarDAO rentCarDAO = new RentCarDAO();
    rentCarDAO.insertReservation(rDTO); //예약 정보 저장

    //차량 정보 얻어오기
    RentCarDTO rentCarDTO = rentCarDAO.getCarInfo(rDTO.getCno());
    //총 예약금액 계산
    int totalCost = rentCarDTO.getPrice() * rDTO.getQty() * rDTO.getRent_term();
    //옵션금액
    int insCost = 0;
    if(insCost == 1) insCost = 10000;
    //와이파이
    int wifiCost = 0;
    if(wifiCost == 1) wifiCost = 10000;
    //베이비시트
    int seatCost = 0;
    if(seatCost == 1) seatCost = 10000;
    int optionCost = rDTO.getQty() * rDTO.getRent_term() * (insCost + wifiCost + seatCost);
%>

<table align="center" width="1000">
    <tr height="60">
        <td colspan="3">
            <span style="font-size: larger; color: red; font-weight: bold">■ 예약 확인</span>
        </td>
    </tr>
    <tr>
        <td align="center">
            <img src="img/<%=rentCarDTO.getImg()%>" width="470">
        </td>
    </tr>
    <tr height="50">
        <td align="center">
            <span style="color: gray">
                대여 금액 <%=totalCost%> 원 <br>
                         <%=rentCarDTO.getPrice()%> (원) * <%=rDTO.getQty()%>(대) * <%=rDTO.getRent_term()%> (대여일)
                옵션 금액 <%=optionCost%> 원 <br>
                총 금액 <%=totalCost + optionCost%> 원
            </span>
        </td>
    </tr>
</table>
<%
    }
%>
</body>
</html>
