<%-- 
    Document   : cadastro
    Created on : 03/05/2017, 20:13:54
    Author     : M
--%>

<%@page import="DAO.ProfessorDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="ico" href="../imagens/ifpa.gif" type="image/gif" />
        <link rel="shotcut icon" href="../imagens/ifpa.gif" type="image/gif" />
        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="../css/bootstrap.css" rel="stylesheet">
        
        <script src="../js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="../js/jquery.mask.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#data').mask('00/00/0000');
                $('#hora').mask('00:00');
                $('#numeroAulas').mask('00');
            });
        </script>
        
        <title>IFPA | Cadastro</title>
    </head>
    <body class="corpo">
        <jsp:useBean class="modelo.Professor" id="professor" />
        <%
            String confirmacao = String.valueOf(request.getAttribute("conf"));
            if(confirmacao.equals("null")) {
                confirmacao = "";
            }
            professor = (Professor) session.getAttribute("professor"); 
            professor = (Professor) session.getAttribute("professor");
            if(professor == null){
                RequestDispatcher rd = request.getRequestDispatcher("../paginas/login.jsp");
                rd.forward(request, response);
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
                    <div id="conf"> <%= confirmacao %> </div>
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Cadastro de Atendimento Intraescolar <%--= professor.getNome() --%></h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" method="POST" action="../controle/controlecadastro.jsp"  data-toggle="validator" role="form">
                                <div class="form-group">
                                    <label for="nomeDocente" class="col-sm-2 control-label">Docente</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="nomeDocente" id="nomeDocente" placeholder="Nome do Docente" value="<%= professor.getNome() %>" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="anoLetivo" class="col-sm-2 control-label">Ano Letivo</label>
                                    <div class="col-sm-3">
                                        <select class="form-control" name="anoLetivo" id="anoLetivo" required>
                                            <option value="">-- Selecione --</option>
                                            <option value="2016">2016</option>
                                        </select>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="semestre" class="col-sm-2 control-label">Semestre</label>
                                    <div class="col-sm-3">
                                        <select class="form-control" name="semestre" id="semestre" required>
                                            <option value="">-- Selecione --</option>
                                            <option value="1">1º Semestre</option>
                                            <option value="2">2º Semestre</option>
                                        </select>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>                                
                                <div class="form-group">
                                    <label for="data" class="col-sm-2 control-label">Data</label>
                                    <div class="col-sm-3">                                        
                                        <input type="text" class="form-control" name="data" id="data" placeholder="Data do Atendimento" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>                                
                                <div class="form-group">
                                    <label for="hora" class="col-sm-2 control-label">Horario</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="hora" id="hora" placeholder="Horario do Atendimento" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>                                
                                <div class="form-group">
                                    <label for="numeroAulas" class="col-sm-2 control-label">Numero de Aulas</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="numeroAulas" id="numeroAulas" placeholder="" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>                                
                                <div class="form-group">
                                    <label for="bloco" class="col-sm-2 control-label">Bloco</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="bloco" id="bloco" placeholder="Local (Bloco)" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="sala" class="col-sm-2 control-label">Sala</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="sala" id="sala" placeholder="Sala/Laboratório" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="atividade" class="col-sm-2 control-label">Atividade Realizada</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="atividade" id="atividade" rows="3" placeholder="Descrição da atividade realizada" required></textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="pull-right">
                                            
                                        <a class="btn btn-success " href="/AtividadeSegundaBI/paginas/entrada.jsp" role="button" aria-label="...">Voltar</a>
                                        <button type="submit" class="btn btn-success">Enviar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="panel-footer">
                            <center>IFPA - Instituto Federal de Educação, Ciência e Tecnologia do Pará</center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="../js/bootstrap.js"></script>
        <script src="../js/validator.min.js" type="text/javascript"></script>
    </body>
</html>
