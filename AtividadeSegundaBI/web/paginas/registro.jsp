
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
                    <div id="erro"> <%--= erro --%> </div>
                    
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Registro de Professor</h3>
                        </div>
                        <div class="panel-body">
                            <form method="POST" action="../controle/controleregistro.jsp" data-toggle="validator" role="form">
                                
                                <div class="form-group">
                                    <label for="nome">Nome</label>
                                    <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome Completo" required>
                                    <div class="help-block with-errors"></div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="matricula">Matrícula</label>
                                    <input type="text" class="form-control" id="matricula" name="matricula" placeholder="Matrícula" required>
                                    <div class="help-block with-errors"></div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="senha">Senha</label>
                                    <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha" required>
                                    <div class="help-block with-errors"></div>
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
