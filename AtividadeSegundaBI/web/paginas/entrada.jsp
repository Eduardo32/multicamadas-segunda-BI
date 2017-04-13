<%-- 
    Document   : entrada
    Created on : 09/04/2017, 22:26:20
    Author     : M
--%>

<%@page import="DAO.ProfessorDAO"%>
<%@page import="java.sql.ResultSet"%>
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
            ResultSet rs;
            professor = (Professor) session.getAttribute("professor");
            
            rs = ProfessorDAO.pesquisarPorCod(professor);
            if(rs.next()){
                professor.setNome(rs.getString(1));
            }
        %>
        
        <h1>Bem-Vindo <%= professor.getNome() %>!</h1>
    </body>
</html>
