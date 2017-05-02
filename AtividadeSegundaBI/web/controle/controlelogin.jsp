<%-- 
    Document   : controlelogin
    Created on : 09/04/2017, 18:00:57
    Author     : M
--%>

<%@page import="DAO.ProfessorDAO"%>
<%@page import="java.sql.ResultSet"%>
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
            String erro = "<div class='alert alert-danger alert-dismissible' role='alert'>"
                            + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                            + "<strong>Erro!</strong> Matrícula ou Senha inválida."
                        + "</div>";
            
            professor.setMatricula(request.getParameter("matricula"));
            professor.setSenha(request.getParameter("senha"));
            
            rs = ProfessorDAO.pesquisarLogin(professor);
            
            if(rs.next() && rs.getString(2).equals(professor.getSenha())) {
                session.setAttribute("professor", professor);
                RequestDispatcher rd = request.getRequestDispatcher("../paginas/entrada.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("erro", erro);
                RequestDispatcher rd = request.getRequestDispatcher("../paginas/login.jsp");
                rd.forward(request, response);
            }
        %>
    </body>
</html>
