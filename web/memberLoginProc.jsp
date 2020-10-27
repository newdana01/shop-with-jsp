<%@ page import="db.RentCarDAO" %><%--
  Created by IntelliJ IDEA.
  User: joo
  Date: 2020-10-16
  Time: 오후 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    //회원 아이디와 패스워드가 일치하는지 비교
    RentCarDAO rentCarDAO = new RentCarDAO();

    int result = rentCarDAO.isExist(id, pw);

    if(result==0){
%>
<script>
    alert("아이디 또는 패스워드가 일치하지 않습니다.");
    location.href="carMain.jsp?center=memberLogin.jsp"
</script>
<%
    }else {
        session.setAttribute("id", id);
        response.sendRedirect("carMain.jsp");
    }
%>
</body>
</html>
