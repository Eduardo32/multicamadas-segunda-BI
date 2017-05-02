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
<html lang="pt-br">
    <head>
        <link rel="ico" href="../imagens/ifpa.gif" type="image/gif" />
        <link rel="shotcut icon" href="../imagens/ifpa.gif" type="image/gif" />
        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="../css/bootstrap.css" rel="stylesheet">
        
        <script src="../js/jquery-3.2.0.min.js" type="text/javascript"></script>
        
        <title>IFPA | Bem-Vindo</title>
    </head>
    <body class="corpo">
        <jsp:useBean class="modelo.Professor" id="professor" />
        <%
            ResultSet rs;
            professor = (Professor) session.getAttribute("professor");
            
            if(professor.getNome() == null) {
                rs = ProfessorDAO.pesquisarProfessor(professor);
                if(rs.next()){
                    professor.setNome(rs.getString(2));
                }
            }
        %>
        <div class="container center-block">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="page-header">
                        <center><img alt="logo" src="../imagens/ifpa.png" width="150"></center>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Bem-Vindo Prof. <%= professor.getNome() %></h3>
                        </div>
                        <div class="panel-body">
                                <p>Olá, professor aqui você pode visualizar todos os seus atendimentos intraescolar cadastrados.</p>
                                <p>Para cadastrar um novo click no botão cadastrar novo.</p>
                                
                            <div class="panel panel-default">
                                <div class="panel-heading">Atendimentos Intraescolar Cadastrados</div>
  
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Ano Letivo</th>
                                            <th>Nº de Aulas</th>
                                            <th>Dia</th>
                                            <th>Mes</th>
                                            <th>Local (Bloco/Sala)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                            
                            <a class="btn btn-success pull-right" href="#" role="button">Cadastrar Novo</a>
                        </div>

                        <div class="panel-footer">
                            <center>IFPA - Instituto Federal de Educação, Ciência e Tecnologia do Pará</center>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
                
        
        <script src="../js/bootstrap.js"></script>
    </body>
</html>
