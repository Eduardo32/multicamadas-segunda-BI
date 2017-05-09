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
            String erro = "<div class='alert alert-danger alert-dismissible' role='alert'>"
                            + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                            + "<strong>Erro!</strong> Essa matrícula já cadastrada."
                        + "</div>";
            
            professor.setCampus(request.getParameter("campus"));
            professor.setCoordenador(request.getParameter("coordenador"));
            professor.setMatricula(request.getParameter("matricula"));
            professor.setNome(request.getParameter("nome"));
            professor.setSenha(request.getParameter("senha"));
            
            rs = ProfessorDAO.pesquisarProfessor(professor);
            
            if(rs.next()) {
                request.setAttribute("erro", erro);
                RequestDispatcher rd = request.getRequestDispatcher("../paginas/registro.jsp");
                rd.forward(request, response);
            } else {
                ProfessorDAO.inserirProfessor(professor);
                session.setAttribute("professor", professor);
                RequestDispatcher rd = request.getRequestDispatcher("../paginas/entrada.jsp");
                rd.forward(request, response);
            }
        %>
    </body>
</html>
