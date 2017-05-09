
<%@page import="modelo.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean class="modelo.Professor" id="professor" />
        <%
            session.setAttribute("professor", null);
            professor = (Professor) session.getAttribute("professor");
            
            RequestDispatcher rd = request.getRequestDispatcher("../paginas/login.jsp");
            rd.forward(request, response);
        %>
        <!--
        <p> <%--= professor.getCoordenador() %> </p>
        <p> <%= professor.getMatricula() %> </p>
        <p> <%= professor.getNome() %> </p>
        <p> <%= professor.getSenha() --%> </p>-->
    </body>
</html>
