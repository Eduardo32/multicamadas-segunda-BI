
<%@page import="DAO.FichaDAO"%>
<%@page import="modelo.Professor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean class="modelo.Ficha" id="ficha" />
        <jsp:useBean class="modelo.Professor" id="professor" />
        <%
            String confirmacao = "<div class='alert alert-success alert-dismissible' role='alert'>"
                    + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                    + "<strong>Erro!</strong> Atividade cadastrada com sucesso."
                    + "</div>";
            
            professor = (Professor) session.getAttribute("professor");
            
            SimpleDateFormat formaData = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat formaHora = new SimpleDateFormat("HH:mm");
            
            ficha.setNumeroDeAulas(Integer.valueOf(request.getParameter("numeroAulas")));
            ficha.setAnoLetivo(Integer.valueOf(request.getParameter("anoLetivo")));
            ficha.setBloco(request.getParameter("bloco"));
            ficha.setData(formaData.parse(request.getParameter("data")));
            ficha.setDescricao(request.getParameter("atividade"));
            ficha.setHora(formaHora.parse(request.getParameter("hora")));
            ficha.setSala(request.getParameter("sala"));
            ficha.setSemestre(Integer.valueOf(request.getParameter("semestre")));
            ficha.setMatriculaDocente(professor.getMatricula());
            
            FichaDAO.inserirFicha(ficha);
            
            request.setAttribute("conf", confirmacao);
            RequestDispatcher rd = request.getRequestDispatcher("../paginas/cadastro.jsp");
            rd.forward(request, response);
        %>
    </body>
</html>
