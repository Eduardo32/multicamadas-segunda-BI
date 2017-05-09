
<%@page import="java.sql.ResultSet"%>
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
        
        <title>IFPA | Registro</title>
    </head>
    <body class="corpo">
        <%
            String erro = String.valueOf(request.getAttribute("erro"));
            if(erro.equals("null")) {
                erro = "";
            }
        %>
        <div class="container center-block">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="page-header">
                        <center><img alt="logo" src="../imagens/ifpa.png" width="150"></center>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div id="erro"> <%= erro %> </div>
                    
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Registro de Professor</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" method="POST" action="../controle/controleregistro.jsp" data-toggle="validator" role="form">
                                
                                <div class="form-group">
                                    <label for="nome" class="col-sm-2 control-label">Nome</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome Completo" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="matricula" class="col-sm-2 control-label">Matrícula</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="matricula" name="matricula" placeholder="Matrícula" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="campus" class="col-sm-2 control-label">Campus</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="campus" id="campus" required>
                                            <option value="">-- Selecione --</option>
                                            <option value="Abaetetuba">Abaetetuba</option>
                                            <option value="Altamira">Altamira</option>
                                            <option value="Ananindeua">Ananindeua</option>
                                            <option value="Belem">Belém</option>
                                            <option value="Bragança">Bragança</option>
                                            <option value="Breves">Breves</option>
                                            <option value="Cameta">Cametá</option>
                                            <option value="Castanhal">Castanhal</option>
                                            <option value="Conceiçao do Araguaia">Conceição do Araguaia</option>
                                            <option value="Maraba - Industrial">Marabá - Industrial</option>
                                            <option value="Maraba - Rural">Marabá - Rural</option>
                                            <option value="Itaituba">Itaituba</option>
                                            <option value="Obidos">Óbidos</option>
                                            <option value="Parauapebas">Parauapebas</option>
                                            <option value="Paragominas">Paragominas</option>
                                            <option value="Santarem">Santarém</option>
                                            <option value="Tucurui">Tucuruí</option>
                                            <option value="Vigia">Vigia</option>
                                        </select>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="coordenador" class="col-sm-2 control-label">Coordenador</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="coordenador" id="coordenador" placeholder="Coordenador do Docente" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="senha" class="col-sm-2 control-label">Senha</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                
                                <div class="btn-group pull-right">
                                    <button id="enviar" type="submit" class="btn btn-success">Enviar</button>
				</div>
                            </form>
                        </div>
                        <div class="panel-footer">
                            <a href="login.jsp">Voltar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="../js/bootstrap.js"></script>
        <script src="../js/validator.min.js" type="text/javascript"></script>
    </body>
</html>
