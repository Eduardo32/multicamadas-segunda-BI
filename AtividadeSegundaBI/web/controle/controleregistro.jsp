<%-- 
    Document   : controleregistro
    Created on : 02/05/2017, 16:53:18
    Author     : M
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProfessorDAO"%>
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
            
            professor.setMatricula(request.getParameter("matricula"));
            professor.setNome(request.getParameter("nome"));
            professor.setSenha(request.getParameter("senha"));
            
            rs = ProfessorDAO.pesquisarProfessor(professor);
            
            if(rs.next()) {
                %><p>Matricula ja cadastrada</p><%
            } else {
                ProfessorDAO.inserirProfessor(professor);
                session.setAttribute("professor", professor);
                RequestDispatcher rd = request.getRequestDispatcher("../paginas/entrada.jsp");
                rd.forward(request, response);
            }
        %>
    </body>
</html>
