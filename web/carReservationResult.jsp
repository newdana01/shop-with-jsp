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
<jsp:useBean id="rDTO" class="db.ReservationDTO">
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
        Date d1; //대여 날짜
        Date d2; //반납 날짜
        Date today = new Date();
        int dateDiff = 0;
        try{
            //날짜를 yyyy-MM-dd으로 포맷해주는 객체 생성
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            d1 = sdf.parse(rDTO.getRent_date()); //String 타입의 대여날짜를 Date 타입으로 변환
            d2 = sdf.parse(rDTO.getReturn_date()); //String 타입의 반납날짜를 Date 타입으로 변환
            today = sdf.parse(sdf.format(today)); //yyyy-MM-dd으로 바꾼 후 Date 타입으로 변환
            int compare1 = d1.compareTo(today);
            int compare2 = d2.compareTo(d1); //반납날짜보다 대여날짜가 크다면 -1 같다면 0, 반납 날짜가 더 크다면 1을 리턴
            dateDiff = (int) ((d2.getTime() - d1.getTime()) / (24*60*60*1000) + 1); //대여일 - 반납일 간 차

            if(compare1 < 0){ //오늘보다 이전 날짜 선택시
%>
<script>
    alert("현재 시스템 날짜보다 이전 날짜는 선택할 수 없음");
    history.back();
</script>
<%
            }else if (compare2 < 0){ //반납 날짜가 대여시작날짜 보다 이전일 경우
%>
<script>
    alert("반납 날짜가 대여 날짜보다 빠릅니다.");
    history.back();
</script>
<%
            }else if (dateDiff > 5){
%>
<script>
    alert("최대 대여일은 5일 입니다.");
    history.back();
</script>
<%

            }else{

                //아이디 값을 가져옴
                String id1 = (String)session.getAttribute("id");
                rDTO.setId(id1);

                RentCarDAO rentCarDAO = new RentCarDAO();

                int insCost = 0;
                if(rDTO.getIns() == 1) insCost = 10000;
                //와이파이
                int wifiCost = 0;
                if(rDTO.getWifi() == 1) wifiCost = 10000;
                //베이비시트
                int seatCost = 0;
                if(rDTO.getSeat() == 1) seatCost = 10000;

                //차량 정보 얻어오기
                RentCarDTO rentCarDTO = rentCarDAO.getCarInfo(rDTO.getCno());
                //총 예약금액 계산
                int reserveCost = rentCarDTO.getPrice() * dateDiff; //옵션을 제외한 순수 대여 가격

                int optionCost = dateDiff * (insCost + wifiCost + seatCost);

                int totalCost = reserveCost + optionCost;

                rentCarDAO.insertReservation(rDTO, totalCost); //예약 정보 저장
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
                대여 금액 <%=reserveCost%> 원 <br>
                         <%=rentCarDTO.getPrice()%> (원) * <%=dateDiff%> (대여일) <br>
                옵션 금액 <%=optionCost%> 원 <br>
                총 금액 <%=totalCost%> 원
            </span>
        </td>
    </tr>
    <tr>
        <td align="center">
            <input type="button" onclick="location.href='carMain.jsp?center=carLookup.jsp'" value="예약확인">
        </td>
    </tr>
</table>
<%
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
%>
</body>
</html>
