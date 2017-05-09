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
        <script>
            $(document).ready(function () {
                $('#anoLetivo').change(function () {
                    var ano = $('#anoLetivo').val();
                    
                    $.post("../controle/carregarsemestre.jsp", {ano: ano}, function (data) {
                        $('#semestre').html(data);
                    });
                });
                
                $('#semestre').change(function () {
                    var ano = $('#anoLetivo').val();
                    var semestre = $('#semestre').val();
                    
                    $.post("../controle/carregaratividades.jsp", {ano: ano, semestre: semestre, matricula: matricula}, function (data) {
                        $('#atividades').html(data);
                    });
                });                
            });
        </script>
        
        <title>IFPA | Bem-Vindo</title>
    </head>
    <body class="corpo">
        <jsp:useBean class="modelo.Professor" id="professor" />
        <%
            professor = (Professor) session.getAttribute("professor");
            if(professor == null){
                RequestDispatcher rd = request.getRequestDispatcher("../paginas/login.jsp");
                rd.forward(request, response);
            }
            
            %><script>var matricula = <%= professor.getMatricula() %>;</script><%
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
                            <a class="btn btn-success pull-right" href="../controle/controlesair.jsp" role="button">Sair</a>
                            <p><b>Coordenador: <%= professor.getCoordenador() %></b></p>
                            <p><b>Campus: <%= professor.getCampus() %></b></p>
                            
                            <p>Olá, professor selecionando o ano letivo e o semestre 
                                você podera visualizar os seus atendimentos intraescolares 
                                cadastrados.</p>
                            
                            
                            <form class="form-inline">
                                <div class="form-group">
                                    <label for="anoLetivo">Ano Letivo</label>
                                    <select class="form-control" name="anoLetivo" id="anoLetivo">
                                        <option value="0">-- Selecione --</option>
                                        <option value="2016">2016</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="semestre">Semestre</label>
                                    <select class="form-control" name="semestre" id="semestre">
                                        <option value="0">-- Selecione o Ano --</option>
                                    </select>
                                </div>
                            </form>
                            
                            
                            <br>
                                
                            <div class="panel panel-default">
                                <div class="panel-heading">Atendimentos Intraescolares Cadastrados</div>
  
                                <div class="table-responsive">
                                    
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Nº de Aulas</th>
                                            <th>Dia</th>
                                            <th>Mes</th>
                                            <th>Horario</th>
                                            <th>Local (Bloco/Sala)</th>
                                            <th>Atividade</th>
                                        </tr>
                                    </thead>
                                    <tbody name="atividades" id="atividades">
                                                                                
                                    </tbody>
                                </table>
                                </div>
                            </div>
                            <p>Para cadastrar um novo, click no botão cadastrar novo.</p>
                            <div class="pull-right">
                                <input class="btn btn-success " type="button" aria-label="..." onClick="window.print()" value="Imprimir">
                                <a class="btn btn-success " href="/AtividadeSegundaBI/paginas/cadastro.jsp" role="button" aria-label="...">Cadastrar Novo</a>
                            </div>
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
