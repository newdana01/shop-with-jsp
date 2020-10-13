<%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-08
  Time: 오후 5:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>메인 페이지</title>
  </head>
  <body>
  <%
    String center = request.getParameter("center");

    //처음 실행 시 center값 없으니 null처리
    if(center==null){
      center = "center.jsp"; //디폴트 center값 부여
    }
  %>
  <table width="1000" align="center">
    <!--top 부분-->
    <tr height="140" align="center">
      <td width=1000" align="center">
        <jsp:include page="top.jsp"/>
      </td>
    </tr>

    <!--center 부분-->
    <tr align="center">
      <td width=1000" align="center">
        <jsp:include page="<%=center%>"/>
      </td>
    </tr>

    <!--bottom 부분-->
    <tr height="80" align="center">
      <td width=1000" align="center">
        <jsp:include page="bottom.jsp"/>
      </td>
    </tr>
  </table>
  </body>
</html>
